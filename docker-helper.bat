@echo off
REM Docker Helper for Windows CMD

IF "%1"=="" (
    GOTO help
) ELSE IF "%1"=="help" (
    GOTO help
) ELSE IF "%1"=="start" (
    GOTO start
) ELSE IF "%1"=="stop" (
    GOTO stop
) ELSE IF "%1"=="restart" (
    GOTO restart
) ELSE IF "%1"=="logs" (
    GOTO logs
) ELSE IF "%1"=="exec" (
    GOTO exec
) ELSE IF "%1"=="build" (
    GOTO build
) ELSE IF "%1"=="clean" (
    GOTO clean
) ELSE (
    ECHO Unknown command: %1
    ECHO Run 'docker-helper.bat help' for a list of commands.
    EXIT /B 1
)

:help
ECHO FastAPI Excel Comparison Tool Docker Helper
ECHO.
ECHO Usage:
ECHO   docker-helper.bat [command]
ECHO.
ECHO Commands:
ECHO   start       Build and start the Docker containers
ECHO   stop        Stop the Docker containers
ECHO   restart     Restart the Docker containers
ECHO   logs        Show logs from the containers
ECHO   exec        Execute a command in the web container
ECHO   build       Rebuild the Docker containers
ECHO   clean       Remove all containers and images related to the project
ECHO   help        Show this help message
EXIT /B 0

:start
docker-compose up -d
ECHO Containers started. Access the application at http://localhost:8000
EXIT /B 0

:stop
docker-compose down
ECHO Containers stopped.
EXIT /B 0

:restart
docker-compose restart
ECHO Containers restarted.
EXIT /B 0

:logs
docker-compose logs -f
EXIT /B 0

:exec
IF "%2"=="" (
    ECHO Usage: docker-helper.bat exec [command]
    EXIT /B 1
)
SET cmd=%*
SET cmd=%cmd:exec =%
docker-compose exec web %cmd%
EXIT /B 0

:build
docker-compose up -d --build
ECHO Containers rebuilt and started.
EXIT /B 0

:clean
ECHO Stopping containers...
docker-compose down

ECHO Removing project containers...
FOR /F "tokens=1" %%i IN ('docker ps -a ^| findstr fast-api-compare-excel') DO (
    docker rm -f %%i
)

ECHO Removing project images...
FOR /F "tokens=3" %%i IN ('docker images ^| findstr fast-api-compare-excel') DO (
    docker rmi -f %%i
)

ECHO Cleanup complete.
EXIT /B 0
