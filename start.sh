#!/usr/bin/env bash
# You should start the nginx-proxy container before running this script

# Stop and remove all the wordpress containers
# docker rm -f $(docker ps -aqf name=wordpress)
# docker rm -f $(docker ps -aqf name=mariadb_wp)
# And their folders

for number in 1 2 3 4 5 6 7 8 9 10
do

# Dynamically create ENV vars
echo "I hope you changed the password!"
export MYSQL_PASSWORD=kgB7yJCwGYq2jeQH
export WP_ID=wp${number}
export WP_HOST=wp${number}.stoat.xyz
export MYSQL_SUFFIX=mysql_${number}

mkdir ./wordpress/wp${number}
cp ./wordpress/docker-compose.yml ./wordpress/wp${number}
docker-compose -f ./wordpress/wp${number}/docker-compose.yml up -d --build wordpress

echo "Configured a Wordpress blog for $WP_HOST"

done

exit 0
