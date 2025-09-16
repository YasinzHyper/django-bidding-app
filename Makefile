# Makefile for Django Bidding App

.PHONY: help build dev prod down clean logs

help: ## Show this help message
	@echo "Django Bidding App - Docker Commands"
	@echo "====================================="
	@echo "Available commands:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build the Docker image
	docker-compose build

dev: ## Run in development mode with auto-reload
	docker-compose -f docker-compose.dev.yml up --build

prod: ## Run in production mode with Gunicorn
	docker-compose up --build

down: ## Stop all containers
	docker-compose -f docker-compose.dev.yml down
	docker-compose down

clean: ## Stop containers and remove volumes
	docker-compose -f docker-compose.dev.yml down -v
	docker-compose down -v
	docker system prune -f

logs: ## Show logs from the web container
	docker-compose logs -f web

shell: ## Open a shell in the running container
	docker-compose exec web bash

django-shell: ## Open Django shell
	docker-compose exec web python manage.py shell

admin: ## Create a superuser (interactive)
	docker-compose exec web python manage.py createsuperuser

migrate: ## Run database migrations
	docker-compose exec web python manage.py migrate

makemigrations: ## Create new migrations
	docker-compose exec web python manage.py makemigrations

collectstatic: ## Collect static files
	docker-compose exec web python manage.py collectstatic --noinput

test: ## Run tests
	docker-compose exec web python manage.py test