# shellcheck-circleci

[![CircleCI Build](https://circleci.com/gh/cfra/shellcheck-circleci.svg?style=shield)](https://circleci.com/gh/cfra/workflows/shellcheck-circleci "CircleCI Build")
[![Calendar Versioning](https://img.shields.io/badge/calver-YYYY.0M.0D.MICRO-blue.svg)](http://calver.org/ "Calendar Versioning")

A Docker image for running [shellcheck](https://www.shellcheck.net/) on [CircleCI](https://circleci.com/).

This image is *not* maintained by CircleCI.

## What is this

This image can be used for running shellcheck in CircleCI. In contrast to the official image, this image
also includes git and ssh, tools needed for CircleCI to run smoothly.

## Tags

The latest released version is tagged as `2019.02.22.1`.

The latest development version is tagged as `latest`.

## How to use this image

The easiest way to make use of it is to use the official CircleCI [shellcheck-orb](https://circleci.com/orbs/registry/orb/circleci/shellcheck) and override its executor:

```yaml
version: 2.1
orbs:
  shellcheck: circleci/shellcheck@1.3.3

executors:
  shellcheck-circleci:
    docker:
      - image: quay.io/cfra/shellcheck-circleci

workflows:
  version: 2
  build:
    jobs:
      - shellcheck/check:
          executor: shellcheck-circleci
```

## Development

For development, you can build the image locally using:

```console
$ ./build.sh
```

This will build the image and tag it as `shellcheck-circleci:latest`.

To validate the generated image, you can run:

```console
$ ./test
```

This will perform some basic tests on the image to see if shellcheck and git are working.
