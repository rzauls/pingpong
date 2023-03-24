1. Generate shh key-pair, add .pub key to server known_hosts on the VPS
2. Add private key to GH action secrets as SSH_PRIVATE_KEY

3. install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

4. either create a deploy.sh script on the VPS, or just run the commands manually in GH action job/step

