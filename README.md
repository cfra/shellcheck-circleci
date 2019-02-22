# shellcheck-circleci

[![CircleCI Build](https://circleci.com/gh/cfra/shellcheck-circleci.svg?style=shield)](https://circleci.com/gh/cfra/workflows/shellcheck-circleci "CircleCI Build")
[![Calendar Versioning](https://img.shields.io/badge/calver-YYYY.0M.0D.MICRO-blue.svg)](http://calver.org/ "Calendar Versioning")

A Docker image for running [shellcheck](https://www.shellcheck.net/) on [CircleCI](https://circleci.com/).

This image is *not* maintained by CircleCI.

## What is this

This image can be used for running shellcheck in CircleCI. In contrast to the official image, this image
also includes git and ssh, tools needed for CircleCI to run smoothly.

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
