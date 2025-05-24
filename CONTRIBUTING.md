# Contributing to FastAPI Excel Comparison

Thank you for your interest in contributing to FastAPI Excel Comparison! This document provides guidelines and instructions for contributing to this project.

## Development Setup

1. Fork the repository and clone your fork:
   ```bash
   git clone https://github.com/yourusername/fast-api-compare-excel.git
   cd fast-api-compare-excel
   ```

2. Create a virtual environment and install dependencies:
   ```bash
   python -m venv venv
   # Activate the virtual environment
   # Windows:
   venv\Scripts\activate
   # macOS/Linux:
   source venv/bin/activate
   
   # Install dependencies
   pip install -r requirements.txt
   ```

3. Set up pre-commit hooks (optional but recommended):
   ```bash
   pip install pre-commit
   pre-commit install
   ```

## Development Workflow

1. Create a new branch for your feature or bugfix:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes and test them:
   ```bash
   # Start the development server
   uvicorn app.main:app --reload
   ```

3. Run linting and formatting:
   ```bash
   # Install development dependencies if you haven't already
   pip install flake8 black isort
   
   # Run linting
   flake8 .
   
   # Run formatting
   black .
   isort .
   ```

4. Commit your changes with a descriptive message:
   ```bash
   git commit -m "Add feature: description of your changes"
   ```

5. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

6. Open a pull request on GitHub.

## CI/CD Pipeline

This project uses GitHub Actions for CI/CD. When you open a pull request or push to the main branch, the following workflows will run automatically:

### 1. Test Build and Validate
- Linting and formatting checks
- Test execution
- Docker build verification

### 2. Build and Push Docker Images (on merge to main)
- Builds multi-architecture Docker images (amd64 and arm64)
- Pushes images to GitHub Container Registry
- Runs security scans on the images

## Docker Development

You can use Docker for development to ensure consistency across environments:

```bash
# Build and start the container
docker-compose up -d --build

# View logs
docker-compose logs -f

# Stop the container
docker-compose down
```

## Guidelines

1. Follow the code style of the project.
2. Write or update tests for the changes you make.
3. Keep pull requests focused on a single topic.
4. Write clear commit messages and PR descriptions.
5. Update documentation when adding or modifying features.

## License

By contributing to FastAPI Excel Comparison, you agree that your contributions will be licensed under the project's [MIT License](LICENSE).

Thank you for your contributions!
