## Automatically created docker image for travis

[![Build Status](https://travis-ci.org/encodeering/docker-travis.svg?branch=master)](https://travis-ci.org/encodeering/docker-travis)

### Docker

```docker pull encodeering/travis-amd64```

- 1.8.2
- https://hub.docker.com/r/encodeering/travis-amd64/


```bash
travis () { docker run -u root -it --rm --entrypoint=bash -v `pwd`:/usr/local/src encodeering/travis-amd64:1.8.2; }
```
