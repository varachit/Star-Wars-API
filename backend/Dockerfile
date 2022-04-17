FROM python:3.10.4-slim-bullseye
WORKDIR /backend
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

# docker build --tag starwars-django .
# docker run --publish 8000:8000 starwars-django