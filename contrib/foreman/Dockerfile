FROM       ruby:2.3

MAINTAINER Michael Clausen <encodeering@gmail.com>

ARG        VERSION

RUN        apt-get update \
 &&        apt-get install -y ca-certificates curl unzip \
 &&        rm -rf /var/lib/apt/lists/*

RUN        useradd -m -s /bin/bash -u 1000 -U foreman

COPY       config.yml /home/foreman/.travis/config.yml

RUN        gem install travis -v ${VERSION} --no-rdoc --no-ri --verbose \
 &&                    travis version

RUN        curl -L https://github.com/travis-ci/travis-build/archive/master.zip > ~foreman/master.zip \
 &&        unzip                    ~foreman/master.zip -d ~foreman/.travis                           \
 &&        rm                       ~foreman/master.zip                                               \
 &&        bundle install --gemfile ~foreman/.travis/travis-build-master/Gemfile --verbose            \
 &&        chown -R foreman:foreman ~foreman/.travis

VOLUME     /usr/local/src

WORKDIR    /usr/local/src

USER       foreman

ENTRYPOINT ["docker-exec", "travis"]
