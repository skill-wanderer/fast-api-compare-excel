#!/bin/bash

# Display help message
show_help() {
    echo "FastAPI Excel Comparison Tool Docker Helper"
    echo ""
    echo "Usage:"
    echo "  ./docker-helper.sh [command]"
    echo ""
    echo "Commands:"
    echo "  start       Build and start the Docker containers"
    echo "  stop        Stop the Docker containers"
    echo "  restart     Restart the Docker containers"
    echo "  logs        Show logs from the containers"
    echo "  exec        Execute a command in the web container"
    echo "  build       Rebuild the Docker containers"
    echo "  clean       Remove all containers and images related to the project"
    echo "  help        Show this help message"
}

# Check if Docker is installed
check_docker() {
    if ! [ -x "$(command -v docker)" ]; then
        echo "Error: Docker is not installed." >&2
        exit 1
    fi

    if ! [ -x "$(command -v docker-compose)" ]; then
        echo "Error: Docker Compose is not installed." >&2
        exit 1
    fi
}

# Start the containers
start() {
    docker-compose up -d
    echo "Containers started. Access the application at http://localhost:8000"
}

# Stop the containers
stop() {
    docker-compose down
    echo "Containers stopped."
}

# Restart the containers
restart() {
    docker-compose restart
    echo "Containers restarted."
}

# Show logs
logs() {
    docker-compose logs -f
}

# Execute a command in the web container
exec_cmd() {
    if [ "$#" -lt 2 ]; then
        echo "Usage: ./docker-helper.sh exec [command]"
        exit 1
    fi
    shift
    docker-compose exec web "$@"
}

# Rebuild the containers
build() {
    docker-compose up -d --build
    echo "Containers rebuilt and started."
}

# Clean up containers and images
clean() {
    echo "Stopping containers..."
    docker-compose down
    
    echo "Removing project containers..."
    docker ps -a | grep fast-api-compare-excel | awk '{print $1}' | xargs -r docker rm -f
    
    echo "Removing project images..."
    docker images | grep fast-api-compare-excel | awk '{print $3}' | xargs -r docker rmi -f
    
    echo "Cleanup complete."
}

# Check if Docker is installed
check_docker

# Process command line arguments
case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    logs)
        logs
        ;;
    exec)
        exec_cmd "$@"
        ;;
    build)
        build
        ;;
    clean)
        clean
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        if [ -z "$1" ]; then
            show_help
        else
            echo "Unknown command: $1"
            echo "Run './docker-helper.sh help' for a list of commands."
            exit 1
        fi
        ;;
esac

exit 0
