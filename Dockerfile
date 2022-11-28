FROM ubuntu:20.04

WORKDIR /apps

COPY app.py requirements.txt /apps/

## Step 3:
# Install packages from requirements.txt
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask
RUN pip install --no-cache-dir --upgrade pip==20.3.1 &&\
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

EXPOSE 80 443


ENTRYPOINT FLASK_APP=/apps/app.py flask run --host=0.0.0.0 --port=8080