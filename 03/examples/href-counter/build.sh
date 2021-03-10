#!/bin/sh
echo Building using multi-stage build

docker build --no-cache -t href-counter:small . -f Dockerfile.multi
