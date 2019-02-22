FROM koalaman/shellcheck:latest@sha256:0242efa03457575329989cffb6e7860c4ca3d5696387d40a2ca1268728b87c2d as shellcheck

FROM circleci/buildpack-deps:latest@sha256:5ea8ce1c6c060858f6479f46659fcc124d64a2a5f42420285dd8da8384ba3ea8

COPY --from=shellcheck /bin/shellcheck /bin/shellcheck
