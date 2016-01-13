#!/bin/bash

set -ev

TAG="$REPOSITORY/$PROJECT-$ARCH"
TAGSPECIFIER="$VERSION"

docker pull   "$REPOSITORY/ruby-$ARCH:2.3"
docker tag -f "$REPOSITORY/ruby-$ARCH:2.3" "ruby:2.3"

docker build -t "$TAG:$TAGSPECIFIER" --build-arg VERSION="$VERSION" "$PROJECT"

docker run --rm "$TAG:$TAGSPECIFIER" version
