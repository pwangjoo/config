# README.md
집에 남는 맥북으로 `code-server` 돌리는 방법

## 1. Homebrew 설치하기
```bash
$ xcode-select --install
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 2. Nginx, Certbot, Chrome, Code-Server 설치하기
```bash
$ brew install nginx certbot code-server
$ brew install --cask google-chrome
```
## 3. Nginx 세팅하기
### 3.1 Certbot 라이선스 발급받기
```bash
$ sudo certbot certonly --standalone
$ sudo chmod -R 755 /etc/letsencrypt/live/mydomain.com
```
### 3.2 `/usr/local/etc/nginx/.conf` 수정하기
```bash
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
    
        listen 443 ssl http2;
        ssl_certificate /etc/letsencrypt/live/mydomain.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/mydomain.com/privkey.pem;
    }

    server {
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
    
        listen 443 ssl http2;
        ssl_certificate /etc/letsencrypt/live/mydomain.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/mydomain.com/privkey.pem;
    }

    include servers/*;

    server {
        if ($host = mydomain.com) {
            return 301 https://$host$request_uri;
        }

        if ($host = www.mydomain.com) {
            return 301 https://$host$request_uri;
        }
    
        if ($host = code.mydomain.com) {
            return 301 https://$host$request_uri;
        }

        listen 80;
        listen [::]:80;
        server_name mydomain.com www.mydomain.com code.mydomain.com;
        return 404;
    }
}
```

## 4. Code-Server 세팅하기
### 4.1 `/Users/Admin/.config/code-server/config.yaml` 수정하기
```bash
bind-addr: 127.0.0.1:8080
auth: password
password: mypasswd
cert: false
```
### 4.2 Extension 설치하기
```bash
$ code-server --install-extension ms-toolsai.jupyter-2020.11.399280825.vsix # 최신 .vsix 다운로드
$ code-server --install-extension ms-python.python
```
### 4.3 Extension 자동 업데이트 취소하기
F1 > Extensions: Disable Auto Updating Extensions