#!/bin/sh
set -e

if [ -z "${INPUT_REPO_NAME}" ]; then
  echo "Need Docker Repo Name e.g. ash84/meier"
  exit 1
fi

if [ -z "${INPUT_USERNAME}" ]; then
  echo "Need Docker user name for login"
  exit 1
fi

if [ -z "${INPUT_PASSWORD}" ]; then
  echo "Need Docker password for login"
  exit 1
fi



TAG=$(echo ${GITHUB_REF} | sed -e "s/refs\/tags\///g")

echo ${INPUT_PASSWORD} | docker login -u ${INPUT_USERNAME} --password-stdin

DOCKERNAME="${INPUT_REPO_NAME}:${TAG}"
docker build -t ${DOCKERNAME} .
docker push ${DOCKERNAME}

docker logout