#!/bin/bash

set -e
set -u
set -o pipefail

cd "$(dirname "$0")"

if [ -z "${CIRCLE_PROJECT_REPONAME:-}" ]; then
	DOCKER_IMAGE="shellcheck-circleci"
else
	# When we are running on CircleCI, retrieve the image and tag which we just built.
	# This is a bit hacky, but we don't have access to the parameters passed to docker-publish/build.
	DOCKER_IMAGE="$(docker images --format "{{.Repository}}:{{.Tag}}" | grep "/${CIRCLE_PROJECT_REPONAME}:")"
fi

# Check if shellcheck is present in the image
if docker run --rm "$DOCKER_IMAGE" shellcheck -V | grep -q 'ShellCheck - shell script analysis tool'; then
	echo "Shellcheck found." >&2
else
	echo "Shellcheck seems to be broken!" >&2
	exit 1
fi

# Check if git is present in the image
if docker run --rm "$DOCKER_IMAGE" git version | grep -q 'git version'; then
	echo "Git found." >&2
else
	echo "Git seems to be broken!" >&2
	exit 1
fi

# And, because we can, check if the shellscripts in this repo have any issues
find . -type f -name '*.sh' | while read -r file; do
	echo "==== Checking $file ====" >&2
	docker run -i --rm "$DOCKER_IMAGE" shellcheck --external-sources /dev/stdin < "$file"
	echo "==== Passed. ====" >&2
done
