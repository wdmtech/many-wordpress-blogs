#!/usr/bin/env bash
# You should start the nginx-proxy container before running this script

for number in {1..2}
do

rm -rf ./wordpress/wp${number}

# Dynamically create ENV vars
echo "I hope you changed the password!"
export MYSQL_PASSWORD=kgB7yJCwGYq2jeQH
export WP_ID=wp${number}
export WP_HOST=wp${number}.wordpress.wdmtech.co.uk
export MYSQL_SUFFIX=mysql_${number}

mkdir ./wordpress/wp${number}
cp ./wordpress/docker-compose.yml ./wordpress/wp${number}
docker-compose -f ./wordpress/wp${number}/docker-compose.yml up -d

echo "Configured a Wordpress blog for $WP_HOST"

done

exit 0
