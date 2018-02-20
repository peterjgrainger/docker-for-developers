# Demo

Key reasons for all best practice

* quick to pull
* disk space needed to store
* easily reproducable
* quick to rebuild

Best practice

* no state
* Multi layer
* permission of files
* permission of user running system
* image size
* use a .dockerignore

## Dev version

docker build -f docker/dev/Dockerfile . -t dev-version

docker run -p 3000:3000 -v $(pwd)/src:/opt/node-demo/src dev-version

# Release

docker build -f docker/release/Dockerfile . -t prod-build

docker run -it -p 3000:3000 prod-build /bin/sh