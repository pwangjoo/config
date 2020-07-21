# README.md
This repository was made & opened public to share personally.
Please do not contribute in any way. Thank you.

Introducing basic commands for managing Docker environments
* Please do __NOT__ install any other packages other than Docker and its dependencies
* Highly suggest generating new images and containers to test different settings
* You can access __Jupyter Notebook__ of a certain container by opening up the port with `-p` command
* To use __Jupyter Notebook__ use `$ pip(conda) install jupyter_client=5.3.1 (stable)` command
* Recommend setting up __non-root USER__ to run commands inside the containers

## `Docker-19.03.8` (stable)

### `Docker` management
```
$ docker info

$ docker pull [image]:[tag]
$ docker image ls
$ docker ps -a

$ docker (image) rm [name]
```

### `Docker` build & run & stop
```
$ docker build -t [name]:[tag] [dockerfile_dir]

$ docker run -itd -v [host_dir]:[target_dir] -p [IP]:[host]:[target] --name [name] [image]:[tag]
$ docker exec -it [container] bash
$ docker stop [container]
```

## `Ubuntu-18.04` (stable)

### initial settings under `Docker` container
```
# export DEBIAN_FRONTEND="noninteractive"
# apt-get update
```

### setting up `sudo` and running as non-root user
```
# apt-get install sudo
# useradd -ms -p [passwd] [user]
# usermod -aG sudo [user]
# su - [user]
```

### `apt` and other package management
```
$ sudo apt upgrade -y && apt install apt-utils -qq && apt autoremove -y && apt autoclean -y
$ update-alternatives --install /usr/bin/[cmd] [cmd] /usr/bin/[package] [#]
```
