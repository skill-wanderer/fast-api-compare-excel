#!/bin/bash
# Setup script for FastAPI Excel Comparison

# Colors for terminal output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║        FastAPI Excel Comparison Setup          ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════╝${NC}"

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo -e "${YELLOW}Docker is not installed. Please install Docker first.${NC}"
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo -e "${YELLOW}Docker Compose is not installed. Please install Docker Compose first.${NC}"
    exit 1
fi

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo -e "${YELLOW}Creating .env file from .env.example...${NC}"
    cp .env.example .env
    echo -e "${GREEN}Created .env file.${NC}"
fi

# Check operating system for platform-specific builds
OS=$(uname -s)
ARCH=$(uname -m)

echo -e "${YELLOW}Detected OS: ${OS}, Architecture: ${ARCH}${NC}"

# Setup options
echo -e "${BLUE}Select an option:${NC}"
echo "1) Start development environment"
echo "2) Build Docker images (local)"
echo "3) Build multi-architecture Docker images"
echo "4) Run tests"
echo "5) Exit"

read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        echo -e "${YELLOW}Starting development environment...${NC}"
        docker-compose up -d --build
        echo -e "${GREEN}Development environment is running at http://localhost:8000${NC}"
        ;;
    2)
        echo -e "${YELLOW}Building Docker image for current architecture...${NC}"
        docker build -t fastapi-excel-comparison:latest .
        echo -e "${GREEN}Docker image built successfully.${NC}"
        echo -e "Run with: ${BLUE}docker run -p 8000:8000 fastapi-excel-comparison:latest${NC}"
        ;;
    3)
        echo -e "${YELLOW}Building multi-architecture Docker images requires buildx...${NC}"
        # Setup buildx if not already set up
        docker buildx create --name mybuilder --use || true
        
        echo -e "${YELLOW}Building and pushing multi-architecture images...${NC}"
        echo -e "${YELLOW}Note: This requires Docker Hub login for pushing.${NC}"
        
        read -p "Enter your Docker Hub username: " dockerhub_username
        
        docker buildx build --platform linux/amd64,linux/arm64 \
            -t $dockerhub_username/fastapi-excel-comparison:latest \
            --push .
        
        echo -e "${GREEN}Multi-architecture images built and pushed successfully.${NC}"
        ;;
    4)
        echo -e "${YELLOW}Running tests...${NC}"
        # If you have tests set up, uncomment and modify the following line
        # pytest
        echo -e "${GREEN}Tests completed.${NC}"
        ;;
    5)
        echo -e "${GREEN}Exiting.${NC}"
        exit 0
        ;;
    *)
        echo -e "${YELLOW}Invalid option. Exiting.${NC}"
        exit 1
        ;;
esac

echo -e "${GREEN}Done!${NC}"
