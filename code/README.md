# README.md
집에 남는 맥북으로 `code-server` 돌리는 방법

## 1. Homebrew 설치하기
```zsh
% xcode-select --install
% /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 2. Nginx, Certbot, Chrome, Code-Server 설치하기
```zsh
% brew install nginx certbot code-server
% brew install --cask google-chrome
```
### 2.1 `/Users/Admin/.config/code-server/config.yaml` 수정하기
```yaml
bind-addr: 127.0.0.1:8080
auth: password
password: mypasswd
cert: false
```
### 2.2 Code-Server 가동하기
```zsh
% brew services start code-server
```

## 3. Nginx 세팅하기
### 3.1 `/usr/local/etc/nginx/.conf` 수정하기
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
### 3.2 Nginx 서버 가동하기
```zsh
% brew services start nginx
```
### 3.3 Certbot으로 SSL인증받기
```zsh
% sudo certbot --nginx
% sudo chmod -R 755 /etc/letsencrypt/live
% sudo chmod -R 755 /etc/letsencrypt/live/mydomain.com
% sudo chmod -R 755 /etc/letsencrypt/archive
% sudo chmod -R 755 /etc/letsencrypt/archive/mydomain.com
```
### 3.4 Nginx Permission 수정하기
```zsh
% sudo chmod -R 755 /usr/local/var/run/nginx/proxy_temp
```
### 3.5 Nginx 서버 재가동하기
```zsh
% brew services restart nginx
```

## 4. Code-Server 상세 세팅하기
### 4.1 Code 설정하기
```json
{
    "extensions.autoUpdate": false,
    "workbench.colorTheme": "Default Dark+",
    "workbench.startupEditor": "newUntitledFile",
    "editor.rulers": [80],
}
```
### 4.2 Extension 설치하기
```zsh
% code-server --install-extension ms-toolsai.jupyter-2020.11.399280825.vsix # 최신 .vsix 다운로드
% code-server --install-extension ms-python.python
```
