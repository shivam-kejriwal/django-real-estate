ifneq (,$(wildcard ./.env))
include .env
export
ENV_FILE_PARAM = --env-file .env

endif

build:
	sudo docker-compose up --build -d --remove-orphans

up:
	sudo docker-compose up -d

down:
	sudo docker-compose down

show-logs:
	sudo docker-compose logs

migrate:
	sudo docker-compose exec api python3 manage.py migrate

makemigrations:
	sudo docker-compose exec api python3 manage.py makemigrations

superuser:
	sudo docker-compose exec api python3 manage.py createsuperuser

collectstatic:
	sudo docker-compose exec api python3 manage.py collectstatic --no-input --clear

down-v:
	sudo docker-compose down -v

volume:
	docker volume inspect estate-src_postgres_data

estate-db:
	sudo docker-compose exec postgres-db psql --username=postgres --dbname=estate

test:
	sudo docker-compose exec api pytest -p no:warnings --cov=.

test-html:
	sudo docker-compose exec api pytest -p no:warnings --cov=. --cov-report html

flake8:
	sudo docker-compose exec api flake8 .

black-check:
	sudo docker-compose exec api black --check --exclude=migrations .

black-diff:
	sudo docker-compose exec api black --diff --exclude=migrations .

black:
	sudo docker-compose exec api black --exclude=migrations .

isort-check:
	sudo docker-compose exec api isort . --check-only --skip env --skip migrations

isort-diff:
	sudo docker-compose exec api isort . --diff --skip env --skip migrations

isort:
	sudo docker-compose exec api isort . --skip env --skip migrations

