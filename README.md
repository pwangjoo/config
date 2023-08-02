# README.md
This repository was made & opened public to share personally.


## MacOS

### Miscellaneous
```zsh
% sudo pmset -c disablesleep 1 #prevent auto sleeping (1: disable, 0: enable)
```

### Installing Homebrew
```zsh
% /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
% brew install --cask [PACKAGE]
% brew install [PACKAGE]
```
* Casks: `google-chrome`, `discord`, `visual-studio-code`
* Formula: `node@16`, `node@18`, `mysql`

### Configuring Git
```zsh
% git config --global user.name "[ID]"
% git config --global user.email "[EMAIL]"
```

### Allowing SSH Access
Menu > System Preferences > Sharing > Remote Login


## Ubuntu-22.04

### Miscellaneous
```bash
$ sudo shutdown -r now #restart
$ sudo systemctl start [PACKAGE] #assign package autostart
$ sudo service [PACKAGE] restart #restart package
```

### Managing Packages
```bash
$ sudo apt update
$ sudo apt upgrade
$ sudo apt autoremove
$ sudo apt install [PACKAGE]
```
* Packages: `mysql-server`, `nginx`

### Installing Node@16
```bash
$ curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
```
(different version can be found [here](https://github.com/nodesource/distributions#installation-instructions))

### Mysql
```bash
$ mysqldump -u root -p [DBNAME] > ~/.mysql/[FILENAME].sql
$ sudo mysql
```
```sql
mysql> CREATE USER 'ubuntu'@'localhost' IDENTIFIED BY '';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'ubuntu'@'localhost';
```