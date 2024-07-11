#!/bin/bash

docker-compose build
docker-compose up -d
docker exec -it laravel2 bash -c "touch database/database.sqlite"
docker exec -it laravel2 bash -c "composer update -n"
docker exec -it laravel2 bash -c "cp .env.example .env"
docker exec -it laravel2 bash -c "php artisan key:generate"
docker exec -it laravel2 bash -c "php artisan migrate"
docker exec -it laravel2 bash -c "sed -i 's/APP_NAME=Laravel/APP_NAME=Laravel-App-2/g' .env"
