#!/bin/bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

docker-pull "$REPOSITORY/ruby-$ARCH:2.3-debian" "ruby:2.3"

docker-build --build-arg VERSION="$PIN" foreman

docker-verify travis version
