#!/bin/bash

docker-compose build
docker-compose up -d
docker exec -it laravel1 bash -c "touch database/database.sqlite"
docker exec -it laravel1 bash -c "composer update -n"
docker exec -it laravel1 bash -c "cp .env.example .env"
docker exec -it laravel1 bash -c "php artisan key:generate"
docker exec -it laravel1 bash -c "php artisan migrate"
docker exec -it laravel1 bash -c "sed -i 's/APP_NAME=Laravel/APP_NAME=Laravel-App-1/g' .env"
docker exec -it laravel1 bash -c "sed -i 's|APP_URL=http://localhost|APP_URL=https://laravel1.site.com|g' .env"
