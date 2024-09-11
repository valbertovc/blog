.PHONY: start-web requirements

start-web:
	python manage.py migrate --noinput
	python manage.py collectstatic --noinput
	gunicorn blog.wsgi

requirements:
	uv pip compile pyproject.toml -o requirements.txt
