#!/bin/bash
#intented to be run as root.
install_docker ()
{
    echo "installing docker"
    # TODO: not recommended for production environments. 
    # Either install docker on each target node manually, 
    # or use the official instructions using apt
    #
    # https://docs.docker.com/engine/install/ubuntu/
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
}

run_deployment ()
{
    echo "running deployment"
    docker pull rzauls/pingpong
    docker container rm -f pingpong-server || true
    docker run -d -p 80:8081 --name pingpong-server rzauls/pingpong:latest
}

if ! [ -x "$(command -v docker)" ]; then
  echo "docker not detected, installing docker"
  install_docker;
fi

run_deployment;
