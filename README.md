# README.md
This repository was made & opened public to share personally.
Please do not contribute in any way. Thank you.

Introducing basic commands for managing Docker environments
* Please do __NOT__ install any other packages other than Docker and its dependencies
* Highly suggest generating new images and containers to test different settings
* You can access __Jupyter Notebook__ of a certain container by opening up the port with `-p` command
* To use __Jupyter Notebook__ use `$ pip(conda) install jupyter_client=5.3.1 (stable)` command
* Recommend setting up __non-root USER__ to run containers (reference [/docker](https://github.com/pwangjoo/test/blob/master/docker))

## `Docker-19.03.8` (stable)

### `Docker` management
```
$ docker info

$ docker pull [image]:[tag]
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
