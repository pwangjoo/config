# README.md
This repository was made & opened public to share personally.\
Please do not contribute in any way. Thank you.

Introducing basic commands for managing Docker environments.
* Please do __NOT__ install any other packages other than Docker and its dependencies.
* Highly suggest generating new images and containers to test different settings.
* You can access __Jupyter Notebook__ of a certain container by opening up the port with `-p` command.
* To use __Jupyter Notebook__ use `$ pip(conda) install jupyter` command.
* Recommend setting up __non-root user__ to run general commands inside the containers.

## Docker-19.03.8 (stable)

### Docker management
``` bash
$ docker info #chech version and resources of docker

$ docker pull [image]:[tag] #pull an image from docker hub
$ docker build -t [name]:[tag] [dockerfile] #build an image named name:tag using .Dockerfile

$ docker image ls #list images
$ docker ps -a #list all containers

$ docker (image) rm [name] #remove container(image)
```
Use: `$ docker build -t KE:0.1 ":C\Users\KE\Dockerfile"` (has to be directory)

### Docker run & stop
```bash
$ docker run -itd -v [host_dir]:[target_dir] -p [host_IP]:[host]:[target] \
    --name [name] [image]:[tag] #generate container from an image
$ docker exec -it [container] bash #execute container with shell /bin/bash
$ docker stop [container] #end container and its processes
$ docker restart [container] #restart container and its processes
```
Use: `$ docker run -itd -v ":D\github":"/usr/KE" -p 8888:8888 --name test KE:0.1`

## Ubuntu-18.04 (stable)

### Initial settings under Docker container
``` bash
$ export DEBIAN_FRONTEND="noninteractive" #supress errors under Docker environments
$ apt update #update Ubuntu repositories
```

### Setting up `sudo` & Running as a non-root user
``` bash
$ apt install sudo #install command `sudo`
$ useradd -ms /bin/bash [user] #add non-user with home dir and shell
$ usermod -aG sudo [user] #assign non-user to group `sudo`
$ passwd [user] #set password for non-user (interactive - cannot be scripted)
$ su - [user] #login shell as a non-root user
```

Now your container is equivalent to general vanilla Ubuntu environments.\
Enjoy coding. :)

## Helpful commands

### `apt` (or `apt-get`)
Prefix `sudo` is necessary for certain commands under non-root user mode.\
Use suffix `-y` to pre-answer Y, `-q` for quiet mode, `-qq` for even more quiet mode.

``` bash
$ apt upgrade #update Ubuntu packages to newest version

$ apt install [packages] #install packages using apt-get
$ apt remove [packages] #uninstall packages
$ apt purge [packages] #uninstall & remove settings of packages

$ apt autoremove #uninstall no-longer used dependencies
$ apt autoclean #clean out package caches that are no longer maintained
```

### Managing package priorities
```bash
$ update-alternatives --config [cmd] #check package priority of command cmd
$ update-alternatives --install /usr/bin/[cmd] [cmd] /usr/bin/[package] [order] #set priority
```
Use: `$ update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1`
