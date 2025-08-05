.PHONY: dev-up dev-down dev-shell dev-rebuild

dev-up:
	docker-compose -f docker-compose.dev.yml up -d

dev-down:
	docker-compose -f docker-compose.dev.yml down

dev-shell:
	docker-compose -f docker-compose.dev.yml exec python-dev bash

dev-rebuild:
	docker-compose -f docker-compose.dev.yml up --build -d

dev-logs:
	docker-compose -f docker-compose.dev.yml logs -f python-dev