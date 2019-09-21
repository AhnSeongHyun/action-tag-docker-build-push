FROM docker:19.03.2
LABEL "com.github.actions.name"="Tag Buil Publish Docker"
LABEL "com.github.actions.description"="Uses the git branch as the docker tag and pushes the container"
LABEL "com.github.actions.icon"="anchor"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/AhnSeongHyun/action-tag-docker-build-push"
LABEL "maintainer"="sh84.ahn@gmail.com"

RUN apk update \
  && apk upgrade \
  && apk add --no-cache git

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]