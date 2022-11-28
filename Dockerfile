FROM python:3.7.3-stretch

WORKDIR /apps

COPY app.py requirements.txt /apps/

## Step 3:
# Install packages from requirements.txt
RUN pip install --no-cache-dir --upgrade pip==20.3.1 &&\
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

EXPOSE 80 443

CMD ["python", "app.py"]