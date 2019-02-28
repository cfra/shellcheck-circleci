FROM koalaman/shellcheck-alpine:v0.6.0@sha256:7d4d712a2686da99d37580b4e2f45eb658b74e4b01caf67c1099adc294b96b52

# Install git and openssh-client for CircleCI
RUN apk add \
	--no-cache \
	--no-progress \
	--update \
	git openssh-client
