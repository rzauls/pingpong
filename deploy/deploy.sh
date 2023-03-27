#!/bin/bash
install_docker ()
{
    echo "installing docker"
}


run_deployment ()
{
    echo "running deployment commands\n"
echo "docker pull rzauls/pingpong 
docker container rm -f pingpong-server || true &&
docker run -d -p 80:8081 --name pingpong-server rzauls/pingpong:latest"
}

if ! [ -x "$(command -v docker)" ]; then
  echo "docker is not installed, installing docker"
  install_docker;
fi

run_deployment;
