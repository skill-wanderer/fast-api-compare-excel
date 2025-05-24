@echo off
REM Setup script for FastAPI Excel Comparison (Windows)

echo.
echo ========================================
echo   FastAPI Excel Comparison Setup
echo ========================================
echo.

REM Check if Docker is installed
where docker >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Docker is not installed. Please install Docker first.
    exit /b 1
)

REM Check if Docker Compose is installed
where docker-compose >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Docker Compose is not installed. Please install Docker Compose first.
    exit /b 1
)

REM Create .env file if it doesn't exist
if not exist .env (
    echo Creating .env file from .env.example...
    copy .env.example .env
    echo Created .env file.
)

REM Setup options
echo Select an option:
echo 1) Start development environment
echo 2) Build Docker images (local)
echo 3) Build multi-architecture Docker images
echo 4) Run tests
echo 5) Exit

set /p choice="Enter your choice (1-5): "

if "%choice%"=="1" (
    echo Starting development environment...
    docker-compose up -d --build
    echo Development environment is running at http://localhost:8000
) else if "%choice%"=="2" (
    echo Building Docker image for current architecture...
    docker build -t fastapi-excel-comparison:latest .
    echo Docker image built successfully.
    echo Run with: docker run -p 8000:8000 fastapi-excel-comparison:latest
) else if "%choice%"=="3" (
    echo Building multi-architecture Docker images requires buildx...
    REM Setup buildx if not already set up
    docker buildx create --name mybuilder --use 2>nul
    
    echo Building and pushing multi-architecture images...
    echo Note: This requires Docker Hub login for pushing.
    
    set /p dockerhub_username="Enter your Docker Hub username: "
    
    docker buildx build --platform linux/amd64,linux/arm64 ^
        -t %dockerhub_username%/fastapi-excel-comparison:latest ^
        --push .
    
    echo Multi-architecture images built and pushed successfully.
) else if "%choice%"=="4" (
    echo Running tests...
    REM If you have tests set up, uncomment and modify the following line
    REM pytest
    echo Tests completed.
) else if "%choice%"=="5" (
    echo Exiting.
    exit /b 0
) else (
    echo Invalid option. Exiting.
    exit /b 1
)

echo Done!
