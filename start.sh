#!/usr/bin/env bash

# Get the latest from the repo
git pull

# Kill everything first
docker rm -f $(docker ps -aq)

# Start the nginx-proxy container and disconnect from it
docker-compose -f ./proxy/docker-compose.yml up -d

for number in {1..2}
do

# Dynamically create ENV vars
echo "I hope you changed the password!"
export MYSQL_PASSWORD=kgB7yJCwGYq2jeQH
export WP_ID=wp${number}
export WP_HOST=wp${number}.wordpress.wdmtech.co.uk
export MYSQL_SUFFIX=mysql_${number}

echo "Starting $WP_HOST"

# Start a wordpress container and disconnect from it
docker-compose -f ./wordpress/docker-compose.yml \
-e MYSQL_PASSWORD=kgB7yJCwGYq2jeQH \
-e WP_ID=wp${number} \
-e WP_HOST=wp${number}.wordpress.wdmtech.co.uk \
-e MYSQL_SUFFIX=mysql_${number} \
up -d

echo "Finished setting up Wordpress blog number ${number}"

done

exit 0
