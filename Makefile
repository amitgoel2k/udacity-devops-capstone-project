setup:
	# Create a virtual environment for running python
	# source when pyhton needs to be executed in the virtual environment: 
	# $source venv/bin/activate
	python3 -m venv ~/.venv
	source ~/.venv/bin/activate

install:
	# Install requirements inside a virtualenv
	pip install --no-cache-dir --upgrade pip==20.3.1 && \
		pip install --no-cache-dir -r requirements.txt

lint_docker:
	wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-Linux-x86_64
	chmod +x /bin/hadolint
	# This is a linter for Dockerfiles
	hadolint Dockerfile

lint_python:
	# This is a linter for Python source code: https://www.pylint.org/
	pylint --disable=R,C,W1202 app.py

all: setup install lint_python lint_docker