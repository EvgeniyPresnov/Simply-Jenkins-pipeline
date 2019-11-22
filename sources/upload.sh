#!/bin/bash

REPO_URL=http://192.168.127.131:8081/repository/deb-repo/
PACKAGE=`ls *.deb`
USERNAME=admin
PASSWORD=evgen

curl -u $USERNAME:$PASSWORD -X POST -H "Content-Type: multipart/form-data" --data-binary @$PACKAGE $REPO_URL
