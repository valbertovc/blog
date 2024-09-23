from django.conf import settings
from storages.backends.s3 import S3Storage


class BaseStorage(S3Storage):
    access_key = settings.AWS_ACCESS_KEY_ID
    secret_key = settings.AWS_SECRET_ACCESS_KEY
    endpoint_url = settings.AWS_S3_ENDPOINT_URL
    file_overwrite = False


class StaticStorage(BaseStorage):
    bucket_name = settings.STATIC_BUCKET_NAME
    bucket_acl = "public-read"


class MediaStorage(BaseStorage):
    bucket_name = settings.MEDIA_BUCKET_NAME
    bucket_acl = "private"
