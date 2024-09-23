.PHONY: runserver start-web requirements dokku-deploy dokku-create dokku-start

runserver:
	python manage.py runserver

start-web:
	python manage.py migrate --noinput
	python manage.py collectstatic --noinput
	gunicorn blog.wsgi

requirements:
	uv pip compile pyproject.toml -o requirements.txt

dokku-deploy:
	git push dokku $(shell git branch --show-current):main

dokku-create:
	docker exec -it dokku dokku apps:create blog||echo "App blog already exists"
	docker exec -it dokku dokku postgres:create blog-db||echo "Postgres service blog-db already exists"
	docker exec -it dokku dokku postgres:link blog-db blog||echo "Link already exists"

dokku-start:
	docker compose up -d dokku
