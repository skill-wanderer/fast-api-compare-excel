# Docker helper script for PowerShell
param (
    [string]$command = "help"
)

# Display help message
function Show-Help {
    Write-Host "FastAPI Excel Comparison Tool Docker Helper"
    Write-Host ""
    Write-Host "Usage:"
    Write-Host "  .\docker-helper.ps1 [command]"
    Write-Host ""
    Write-Host "Commands:"
    Write-Host "  start       Build and start the Docker containers"
    Write-Host "  stop        Stop the Docker containers"
    Write-Host "  restart     Restart the Docker containers"
    Write-Host "  logs        Show logs from the containers"
    Write-Host "  exec        Execute a command in the web container"
    Write-Host "  build       Rebuild the Docker containers"
    Write-Host "  clean       Remove all containers and images related to the project"
    Write-Host "  help        Show this help message"
}

# Check if Docker is installed
function Check-Docker {
    try {
        $dockerVersion = docker --version
        $dockerComposeVersion = docker-compose --version
    }
    catch {
        Write-Host "Error: Docker or Docker Compose is not installed." -ForegroundColor Red
        exit 1
    }
}

# Start the containers
function Start-Containers {
    docker-compose up -d
    Write-Host "Containers started. Access the application at http://localhost:8000" -ForegroundColor Green
}

# Stop the containers
function Stop-Containers {
    docker-compose down
    Write-Host "Containers stopped." -ForegroundColor Green
}

# Restart the containers
function Restart-Containers {
    docker-compose restart
    Write-Host "Containers restarted." -ForegroundColor Green
}

# Show logs
function Show-Logs {
    docker-compose logs -f
}

# Execute a command in the web container
function Exec-Command {
    param (
        [Parameter(ValueFromRemainingArguments=$true)]
        [string[]]$arguments
    )
    
    if ($arguments.Count -eq 0) {
        Write-Host "Usage: .\docker-helper.ps1 exec [command]" -ForegroundColor Red
        exit 1
    }
    
    $execCommand = "docker-compose exec web $($arguments -join ' ')"
    Invoke-Expression $execCommand
}

# Rebuild the containers
function Build-Containers {
    docker-compose up -d --build
    Write-Host "Containers rebuilt and started." -ForegroundColor Green
}

# Clean up containers and images
function Clean-Environment {
    Write-Host "Stopping containers..." -ForegroundColor Yellow
    docker-compose down
    
    Write-Host "Removing project containers..." -ForegroundColor Yellow
    $containers = docker ps -a | Select-String "fast-api-compare-excel"
    foreach ($container in $containers) {
        $containerId = ($container -split "\s+")[0]
        if ($containerId -ne "CONTAINER") {
            docker rm -f $containerId
        }
    }
    
    Write-Host "Removing project images..." -ForegroundColor Yellow
    $images = docker images | Select-String "fast-api-compare-excel"
    foreach ($image in $images) {
        $imageId = ($image -split "\s+")[2]
        docker rmi -f $imageId
    }
    
    Write-Host "Cleanup complete." -ForegroundColor Green
}

# Check if Docker is installed
Check-Docker

# Process command line arguments
switch ($command.ToLower()) {
    "start" {
        Start-Containers
    }
    "stop" {
        Stop-Containers
    }
    "restart" {
        Restart-Containers
    }
    "logs" {
        Show-Logs
    }
    "exec" {
        Exec-Command $args[1..($args.Count-1)]
    }
    "build" {
        Build-Containers
    }
    "clean" {
        Clean-Environment
    }
    "help" {
        Show-Help
    }
    default {
        Write-Host "Unknown command: $command" -ForegroundColor Red
        Write-Host "Run '.\docker-helper.ps1 help' for a list of commands." -ForegroundColor Yellow
        exit 1
    }
}
