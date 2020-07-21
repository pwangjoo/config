# README.md

Introducing basic commands for managing Docker environments
* Please do "NOT" install any other packages other than Docker and its dependencies
* Highly recommend "NOT" using `conda` (can be replaced with `pip`) in Docker environments
* Highly suggest generating new Docker environment to test different settings
* Recommend setting NON_ROOT USER to run Docker environments (reference non_root.Dockerfile)

## `Docker-19.03.8` (stable)

### `Docker` management
```
$ docker info

$ docker image ls
$ docker ps -a

$ docker (image) rm [name]
```

### `Docker` build & run
```
$ docker build -t [name]:[tag] [dockerfile_dir]

$ docker run -i -t -d -v [host_dir]:[target_dir] -p [IP]:[host]:[target] --name [name] [image]:[tag]
$ docker exec -i -t [container] bin bash
```

## `Ubuntu-18.04` (stable)

### initial `apt-get` command
```
$ apt-get update && upgrade -y
$ apt-get install -y --no-install-recommends \
    build-essential
$ apt-get autoremove -y && autoclean -y
```

### package management
```
$ update-alternatives --install /usr/bin/[cmd] [cmd] /usr/bin/[package] [#]
```
