"""
Gunicorn configuration file
https://docs.gunicorn.org/en/stable/configure.html#configuration-file
https://docs.gunicorn.org/en/stable/settings.html
"""

accesslog = "-"
bind = ":8000"
wsgi_app = "blog.wsgi"
