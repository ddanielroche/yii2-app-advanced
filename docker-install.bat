@echo off

rem -------------------------------------------------------------
rem  Docker Compose command line install script for Windows.
rem  https://github.com/ddanielroche/yii2-app-advanced/blob/master/docs/guide/start-installation.md#installing-using-docker
rem -------------------------------------------------------------

rem Install the application dependencies
docker-compose run --rm backend composer install

rem Initialize the application by running the init command within a container
docker-compose run --rm backend /app/init

rem Run the migrations
docker-compose run --rm backend yii migrate

rem Start the application
docker-compose up -d

rem Access it in your browser by opening
rem frontend: http://127.0.0.1:20080
rem backend: http://127.0.0.1:21080
