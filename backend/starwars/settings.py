"""
Django settings for starwars project.

Generated by 'django-admin startproject' using Django 4.0.3.

For more information on this file, see
https://docs.djangoproject.com/en/4.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.0/ref/settings/
"""
import os
from dotenv import load_dotenv
from pathlib import Path

load_dotenv()

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-echlcupxf6_h9b320v$v4o20@q^3b_6u8^7rf9j!+uskt@r$yk'

# SECRET_KEY = os.environ.get('SECRET_KEY')
# TO USE VALUE FROM MACHINE ENVIRONMENT, ADD VARIABLE 'SECRET_KEY' TO YOUR ENVIRONMENT

# SECRET_KEY = os.getenv('SECRET_KEY')
# UNCOMMENT TO USE VALUE FROM PROJECT .ENV


# SECURITY WARNING: don't run with debug turned on in production!
# DEBUG = True
# ** Django Default **

# DEBUG = (os.environ.get('DEBUG_VALUE') == 'True')
# USE VALUE FROM MACHINE ENVIRONMENT, ADD VARIABLE 'DEBUG_VALUE' TO YOUR ENVIRONMENT
# AND SET VALUE TO 'True' OR 'False' WITH SINGLE QUOTE

DEBUG = (os.getenv('DEBUG') == 'True')
# USE VALUE FROM PROJECT .ENV

ALLOWED_HOSTS = ['localhost', '127.0.0.1']
# ALLOWED_HOSTS = ['starwars-api-django.herokuapp.com', 'localhost', '127.0.0.1']

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'corsheaders',
    'rest_framework',
    'rest_framework.authtoken',
    'api',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
]

ROOT_URLCONF = 'starwars.urls'
CORS_URLS_REGEX = r"^/api/v1/.*"
CORS_ALLOWED_ORIGINS = [
    'https://starwars-varachit.vercel.app',
    'http://localhost:3000',
    'http://127.0.0.1:3000'
]

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'starwars.wsgi.application'

# Database
# https://docs.djangoproject.com/en/4.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}

# Password validation
# https://docs.djangoproject.com/en/4.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Cache
REDIS_CACHING = (os.getenv('REDIS_CACHING') == 'True')
REDIS_HOSTNAME = os.getenv('REDIS_HOSTNAME')
REDIS_PORT = os.getenv('REDIS_PORT')
REDIS_USERNAME = os.getenv('REDIS_USERNAME')
REDIS_PASSWORD = os.getenv('REDIS_PASSWORD')
REDIS_TTL = os.getenv('REDIS_TTL')

# REDIS_CACHING = (os.environ.get('REDIS_CACHING') == 'True')
# REDIS_HOSTNAME = os.environ.get('REDIS_HOSTNAME')
# REDIS_PORT = os.environ.get('REDIS_PORT')
# REDIS_USERNAME = os.environ.get('REDIS_USERNAME')
# REDIS_PASSWORD = os.environ.get('REDIS_PASSWORD')
# REDIS_TTL = os.environ.get('REDIS_TTL')

REDIS_LOCATION = f'redis://{REDIS_HOSTNAME}:{REDIS_PORT}'

# If your redis requires password please uncomment the configuration down below

CACHES = {
    'default': {
        'BACKEND': 'django_redis.cache.RedisCache',
        'LOCATION': {REDIS_LOCATION},
        'OPTIONS': {
            # 'PASSWORD': REDIS_PASSWORD,
            'CLIENT_CLASS': 'django_redis.client.DefaultClient',
            'SERIALIZER': 'django_redis.serializers.json.JSONSerializer',
        }
    }
}

SESSION_ENGINE = "django.contrib.sessions.backends.cache"
SESSION_CACHE_ALIAS = "default"

# Internationalization
# https://docs.djangoproject.com/en/4.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.0/howto/static-files/


# STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
STATIC_URL = 'static/'
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'  # Whitenoise

# Default primary key field type
# https://docs.djangoproject.com/en/4.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
REST_FRAMEWORK = {
    "DEFAULT_AUTHENTICATION_CLASSES": [
        "rest_framework.authentication.SessionAuthentication",
        "api.authentication.CustomTokenAuthentication"
    ],
    "DEFAULT_PERMISSION_CLASSES": [
        "rest_framework.permissions.IsAuthenticatedOrReadOnly"
    ],
    "DEFAULT_PAGINATION_CLASS": "rest_framework.pagination.LimitOffsetPagination",
    "PAGE_SIZE": 10
}
