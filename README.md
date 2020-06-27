0. 获取脚本
```
git clone https://github.com/wsdo/local-https-cert.git
cd local-https-cert
```
1. 生成本地的RootCA:

```
sh createRootCA.sh
```

![20200627134114](https://s.shudong.wang/note/20200627134114.png)
![20200627134446](https://s.shudong.wang/note/20200627134446.png)

> 1.输入一个秘密（随便输入，但是要记住）
> 2.输入刚才的秘密（和上面秘密要一致）


2. 创建根证书
```
sh createCertificate.sh
```

![20200627134535](https://s.shudong.wang/note/20200627134535.png)

3. 让打开RootCA改成始终信任
#### 点击

![20200627133245](https://s.shudong.wang/note/20200627133245.png)

#### 点击login 输入上面生成证书的秘密

![20200627133233](https://s.shudong.wang/note/20200627133233.png)
![20200627134735](https://s.shudong.wang/note/20200627134735.png)
![20200627134805](https://s.shudong.wang/note/20200627134805.png)

## nginx 

```
# HTTPS server
server {
    listen 443 ssl;
    server_name shudong.wang;

    ssl_certificate ssl/www.server.crt;
    ssl_certificate_key ssl/www.server.key;

    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout 5m;

    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

    location / {
        # try_files $uri $uri/ /index.html;
        proxy_redirect off;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://localhost:8000/;
    }
}

```
