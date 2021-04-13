FROM python:3.6-alpine
#

COPY . /app
WORKDIR /app

RUN pip install -r /app/requirements.txt

EXPOSE 5000 80
CMD [ "python", "application.py" ]