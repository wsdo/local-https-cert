#!/usr/bin/env bash
openssl req -new -sha256 -nodes -out devserver.csr -newkey rsa:2048 -keyout devserver.key -config server.csr.cnf
openssl x509 -req -in devserver.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out devserver.crt -days 825 -sha256 -extfile v3.ext
