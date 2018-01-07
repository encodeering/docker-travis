#!/bin/bash

set -e

import com.encodeering.docker.config
import com.encodeering.docker.docker

docker-pull "$REPOSITORY/ruby-$ARCH:2.3-debian" "ruby:2.3"

docker build -t "$DOCKER_IMAGE" --build-arg VERSION="$VERSION" foreman

docker run --rm "$DOCKER_IMAGE" travis version
