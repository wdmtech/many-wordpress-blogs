#!/usr/bin/env bash
docker rm -f $(docker ps -aqf name=mariadb_wp)
docker rm -f $(docker ps -aqf name=wordpress_wp)
rm -rf ./wordpress/wp*
