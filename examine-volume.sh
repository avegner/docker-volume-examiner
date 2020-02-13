#!/bin/sh -eu
IMAGE=volume-examiner:latest
VOLUME=${1}

suppress_out()
{
  ${@} >/dev/null 2>&1
}

volume_exist()
{
  suppress_out docker volume inspect ${1}
}

image_exist()
{
  suppress_out docker image inspect ${1}
}

image_fresh()
{
  suppress_out make -f check-image-freshness
}

if ! image_exist ${IMAGE} || ! image_fresh; then
  echo 'generating examiner image...'
  docker build -t ${IMAGE} .
fi

if ! volume_exist ${VOLUME}; then
  echo "volume \"${VOLUME}\" doesn't exist"
  exit 1
fi

echo 'running examiner container...'
docker run -it --rm -v ${VOLUME}:/ro-volume:ro ${IMAGE}
