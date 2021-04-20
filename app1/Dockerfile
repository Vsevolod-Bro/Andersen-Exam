FROM python:3.6-alpine


COPY . /app
WORKDIR /app

RUN pip install -r /app/requirements.txt && chmod 755 application.py

EXPOSE 5000 80
CMD [ "python", "application.py" ]