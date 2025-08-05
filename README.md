# Clean Python Development Environment with Docker

Stop polluting your development machine. Keep your Python environments isolated, clean, and production-ready.

## The Problem

Traditional Python development clutters your machine with multiple Python versions, conflicting virtual environments, and package dependencies that break other projects. Hours are spent debugging environment issues instead of writing code.

## The Solution

This Docker-based development environment provides complete isolation where each project gets its own container, your host machine stays clean, and you can run Python 2.7 and 3.11 projects simultaneously with full IDE integration.

## Quick Start

```bash
git clone https://github.com/EriWinckler/docker-python-dev
cd docker-python-dev
make dev-up
make dev-shell
python space_facts.py
```

## Configuration

Copy `.env.example` to `.env` and customize:

```bash
#PYTHON_IMAGE=local-python-dev
PYTHON_IMAGE=eriwinckler/local-python-dev
PROJECT_DIR=./
HOST_PORT=8000
DOCKERFILE_CONTEXT=.
DOCKERFILE_PATH=Dockerfile
```

For different Python versions:
```bash
# Python 3.7 project
PYTHON_IMAGE=python:3.7-slim

# Python 3.11 project  
PYTHON_IMAGE=python:3.11-slim
```

## Available Commands

```bash
make dev-up        # Start development environment
make dev-down      # Stop development environment
make dev-shell     # Access container shell
make dev-rebuild   # Rebuild container
make dev-logs      # View container logs
make dev-clean     # Clean up everything
```

## IDE Integration

### PyCharm
1. Start container: `make dev-up`
2. Settings → Project → Python Interpreter
3. Add → Docker
4. Configure image name from `.env` file
5. Python interpreter path: `/usr/local/bin/python`

### VS Code
1. Start container: `make dev-up`
2. Install Remote-Containers extension
3. Attach to running container
4. Select Python interpreter: `/usr/local/bin/python`

### Other IDEs
Any IDE supporting remote Python interpreters can connect to the running container.

## Project Structure

```
docker-python-dev/
├── docker-compose.yml    # Development environment
├── Dockerfile                # Python environment
├── requirements.txt          # Dependencies
├── .env.example             # Environment template
├── Makefile                 # Commands
├── space_facts.py           # Demo script
└── README.md
```

## Demo Script

The included `space_facts.py` demonstrates real API calls:
- Tracks International Space Station location
- Shows current astronauts in space  
- Fetches NASA astronomy data
- Proves network access and dependencies work

## Multiple Projects

Each project can have its own configuration:

```bash
project-a/
├── .env                     # PYTHON_IMAGE=python:3.7-slim
└── requirements.txt

project-b/  
├── .env                     # PYTHON_IMAGE=python:3.11-slim
└── requirements.txt
```

## Customization

### Adding Dependencies
1. Update `requirements.txt`
2. Run `make dev-rebuild`

### Custom Images
```bash
# Build specialized environments
docker build -t my-ml-env:latest -f Dockerfile.ml .
docker build -t my-web-env:latest -f Dockerfile.web .
```

## Why This Approach

**vs Virtual Environments:** Better isolation including system dependencies, reproducible across machines, zero host pollution.

**vs DevContainers:** IDE agnostic, simpler configuration with standard Docker Compose, more flexible customization.

**vs System Python:** No version conflicts, safe experimentation, production environment parity.

## CI/CD Integration

```yaml
# GitHub Actions example
- name: Test in container
  run: |
    docker-compose -f docker-compose.dev.yml up -d
    docker-compose -f docker-compose.dev.yml exec -T python-dev pytest
```

## License

MIT License - see LICENSE file for details.

## Related Articles

- [Building a Secure Isolated Development Environment for Google's Gemini CLI](https://medium.com/@efwinckler/building-a-secure-isolated-development-environment-for-googles-gemini-cli-83fbb443be81)
- [Stop Polluting Your Development Machine: The Clean Python Environment Revolution](https://medium.com/@your-medium-handle/your-article-url)

## Support

Questions or issues: [GitHub Issues](https://github.com/EriWinckler/docker-python-dev/issues)

Connect: [LinkedIn](https://www.linkedin.com/in/eridan-winckler-449798169/))