.PHONY: start-web

start-web:
	python manage.py migrate --noinput
	python manage.py collectstatic --noinput
	gunicorn blog.wsgi
