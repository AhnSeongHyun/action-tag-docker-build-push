# action-tag-docker-build-push

> docker build and push to docker-hub only push tag

### Usage

```yaml
name: Continuous Deployment

on:
  push:
    tags:
      - v1.*
      - v2.*

jobs:

  build-push:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: Publish to Registry
        uses: AhnSeongHyun/action-tag-docker-build-push@master
        with:
          repo_name: ash84/meier
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}
```

### Required Arguments
- `repo_name` : docker hub repo 
- `username` : docket hub user name for push docker image
- `password` : docket hub user password for push docker image 
