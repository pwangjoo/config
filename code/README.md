# README.md
Introduction to running `code-server` using Macbook.

## 1. Install Nginx, Certbot, Code-Server
```zsh
% brew install nginx certbot code-server
```
### 1.1 Configure `/Users/Admin/.config/code-server/config.yaml`
```yaml
bind-addr: 127.0.0.1:8080
auth: password
password: mypasswd
cert: false
```
### 1.2 Run Code-Server
```zsh
% brew services start code-server
```

## 2. Set-up Nginx
### 2.1 Configure `/usr/local/etc/nginx/.conf`
```nginx
worker_processes  1;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;

    sendfile        on;
    keepalive_timeout  65;

    server {
        listen 80;
        server_name  mydomain.com www.mydomain.com;

        location / {
            root /Users/Admin/Documents/web;
            index index.html index.htm;
        }
        
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root html;
        }
        
        access_log /Users/Admin/Documents/web/logs/access.log;
        error_log /Users/Admin/Documents/web/logs/error.log;
    }

    server {
        listen 80;
        server_name  code.mydomain.com;
      
        location / {
            proxy_pass http://localhost:8080/;
            proxy_set_header Host $host;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection upgrade;
            proxy_set_header Accept-Encoding gzip;
        }
        
        access_log /Users/Admin/Documents/web/logs/code_access.log;
        error_log /Users/Admin/Documents/web/logs/code_error.log;
        }

    include servers/*;
}
```
### 2.2 Run Nginx
```zsh
% brew services start nginx
```
### 2.3 Encrypt SSL using Certbot
```zsh
% sudo certbot --nginx
% sudo chmod -R 755 /etc/letsencrypt/live
% sudo chmod -R 755 /etc/letsencrypt/live/mydomain.com
% sudo chmod -R 755 /etc/letsencrypt/archive
% sudo chmod -R 755 /etc/letsencrypt/archive/mydomain.com
```
### 2.4 Update Nginx permission
```zsh
% sudo chmod -R 755 /usr/local/var/run/nginx/proxy_temp
```
### 2.5 Restart Nginx
```zsh
% brew services restart nginx
```

## 3. Set-up Code-Server
### 3.1 Code configuration
```json
{
    "extensions.autoUpdate": false,
    "workbench.colorTheme": "Default Dark+",
    "editor.rulers": [80],
}
```
### 3.2 Installing extensions
```zsh
% code-server --install-extension ms-toolsai.jupyter-2020.11.399280825.vsix #need to download .vsix beforehand
% code-server --install-extension ms-python.python
```
