#!/usr/bin/env bash 

if docker images | grep ubuntu; then
    echo "ubuntu image was downloaded"
else
    docker pull ubuntu > /dev/null
fi 

echo "Ubuntu is downloades with successful"

LIST=$(docker container ls -a | grep projetinho-toguro)

if [ -n "$LIST" ]; then
    for containers in $(echo "$LIST"); do
        echo "$(date +'%Y-%m-%dT%H:%M:%S') - is $containers"
    done
else
    docker container rm -f projetinho-toguro
    echo "container deleted"
fi

echo $(docker ps) 
docker run -it  ubuntu bash 


## update resources on Ubuntu os
apt update && apt upgrade -y 

apt install curl -y


## create a folder for show content on file test.txt
mkdir folder1
cd folder1
touch folder1/test.txt
echo Hey bro > folder1/test.txt 

cat test.txt 

exit

