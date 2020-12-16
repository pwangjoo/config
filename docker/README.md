# README.md
Introduction to basic commands for __Docker__ environment management.
* Please do __NOT__ install any other packages other than __Docker__ and its dependencies.
* Highly suggest generating new images and containers to test different settings.
* Recommend setting up __non-root user__ to run general commands inside the containers.

## Docker-19.03.8 (stable)

### Docker management
```bash
$ docker info #check Docker version and resources

$ docker pull [image]:[tag] #pull an image from the docker hub
$ docker build -t [name]:[tag] --force-rm -q [dockerfile_dir] #build an image named [name]:[tag] using Dockerfile

$ docker image ls #list all images
$ docker ps -a #list all containers (both idle and active)

$ docker (image) rm [name] #remove container(image)
```
Usage: `$ docker build -t image:latest --force-rm -q C:/github/docker`

### Docker run & stop
```bash
$ docker run -itd -v [host_dir]:[target_dir] -p [host_IP]:[host]:[target] \
    --name [name] [image]:[tag] #generate container from an image
$ docker exec -it [container] bash #execute container with shell /bin/bash
$ docker stop [container] #end container and its processes
$ docker restart [container] #restart container and its processes
```
Usage: `$ docker run -itd -v ":C/github":"/home" -p 8888:8888 --name cont NAME:latest`\
You need to open up the port with `-p` command when generating a container to use __Jupyter Notebook__.

## Ubuntu-18.04 (stable)

### Initial settings under Docker container
This can be also set up previously with __Dockerfile__.\
For usage of __Dockerfile__, check out [/config](https://github.com/pwangjoo/docker/tree/master/config).
```bash
$ export DEBIAN_FRONTEND="noninteractive" #suppress errors under Docker environments
$ apt-get update #update Ubuntu repositories
```

### Setting up `sudo` & Running as a non-root user
```bash
$ apt-get install sudo #install command `sudo`
$ useradd -ms /bin/bash [user] #add non-root user with home dir and shell
$ usermod -aG sudo [user] #assign non-root user to group `sudo`
$ passwd [user] #set password for non-root user (interactive - cannot be scripted)
$ su - [user] #log-in shell as a non-root user
```

Running `sudo` will now require a password.

## Helpful commands

### Advanced packaging tool, `apt-get`
Prefix `sudo` is necessary for certain commands under __non-root user__ mode.\
Use suffix `-y` to pre-answer Y, `-q` for quiet mode, `-qq` for even more quiet mode.

```bash
$ apt-get upgrade #update Ubuntu packages to newest version

$ apt-get install [packages] #install packages using apt-get
$ apt-get remove [packages] #uninstall packages
$ apt-get purge [packages] #uninstall & remove settings of packages

$ apt-get autoremove #uninstall no-longer used dependencies
$ apt-get autoclean #clean out package caches that are no longer maintained
```

### Managing package priorities
```bash
$ update-alternatives --config [cmd] #check the package's priority of [cmd]
$ update-alternatives --install /usr/bin/[cmd] [cmd] /usr/bin/[package] [order] #set priority
```
Usage: `$ update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1`

### Installing Jupyter Notebook & running
```bash
#pip
$ pip install jupyter
$ python -m notebook --ip=0.0.0.0 --port=8888 #execute jupyter notebook under localhost
$ python -m notebook list #show jupyter notebook token

#conda
$ conda install jupyter
$ jupyter notebook --ip=0.0.0.0 --port=8888 #execute jupyter notebook under localhost
$ jupyter notebook list #show jupyter notebook token
```
If `conda` is necessary, consider __miniconda__ over __anaconda__. (GUI not supported.)\
You need to log out and log back in to activate __Jupyter Notebook__ installation.\
Use suffix `--allow-root` for root privilege, add `&> /dev/null &` to run on background.
