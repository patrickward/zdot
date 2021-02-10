#!/usr/local/bin/zsh

rm -Rf ./docker-home
mkdir -p ./docker-home/.config
docker-compose run --rm zdot
