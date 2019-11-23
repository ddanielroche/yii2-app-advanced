@echo off

rem -------------------------------------------------------------
rem  Docker Compose command line test script for Windows.
rem  https://github.com/ddanielroche/yii2-app-advanced/blob/master/docs/guide/start-testing.md
rem -------------------------------------------------------------

rem Execute test database migrations
docker-compose run --rm backend ./yii_test migrate

rem Build the test suite
docker-compose run --rm backend vendor/bin/codecept build

rem Then all sample tests can be started by running
docker-compose run --rm backend vendor/bin/codecept run

rem Thanks!