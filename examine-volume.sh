#!/bin/sh -eu
IMAGE=volume-examiner:latest
VOLUME=${1}

if ! docker inspect ${IMAGE} >/dev/null 2>&1 || ! make -f check-mod-time >/dev/null 2>&1; then
  docker build -t ${IMAGE} -f volume-examiner .
fi

if ! docker inspect ${VOLUME} 2>/dev/null | grep Mountpoint >/dev/null 2>&1; then
  echo "volume \"${VOLUME}\" doesn't exist"
  exit 1
fi

docker run -it --rm -v ${VOLUME}:/ro-volume:ro ${IMAGE}
