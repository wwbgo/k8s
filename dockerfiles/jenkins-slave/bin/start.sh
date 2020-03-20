#!/bin/bash

echo "$dockerpwd" | docker login docker.flexem.com --username $dockeruser --password-stdin
jenkins-slave