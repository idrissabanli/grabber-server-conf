#apt-get update
#apt-get install git
curl -LO https://raw.githubusercontent.com/munisisazade/docker-helper-commands/master/install.sh && bash install.sh
# adduser buglance
usermod -aG sudo buglance
sudo su - buglance

curl -fsSL get.docker.com -o get-docker.sh
bash get-docker.sh

# Install docker-compose
# ref: https://github.com/docker/compose/releases
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` > ./docker-compose
sudo mv ./docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

# Install docker-cleanup command
# ref: https://gist.github.com/msadig/1f113c3f88cefa91171eefa0c6815335
curl -L https://gist.githubusercontent.com/msadig/1f113c3f88cefa91171eefa0c6815335/raw > ./docker-cleanup
sudo mv docker-cleanup /usr/local/bin/docker-cleanup
sudo chmod +x /usr/local/bin/docker-cleanup

# Set Docker to start automatically at boot time
sudo usermod -aG docker $(whoami)

git clone https://idrisshabanli@bitbucket.org/labclients/utest_puppeteer.git

cd utest_puppeteer/

build-docker

docker-compose logs -f

