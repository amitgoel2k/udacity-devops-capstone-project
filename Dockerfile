FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /apps

## Step 2:
# Copy source code to working directory
COPY app.py requirements.txt /apps/

## Step 3:
# Install packages from requirements.txt
RUN pip install --no-cache-dir --upgrade pip &&\
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]