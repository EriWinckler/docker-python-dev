FROM python:3.11-slim

# Copy requirements file
COPY requirements.txt .

# Install all packages from requirements.txt
RUN pip install -r requirements.txt

CMD ["tail", "-f", "/dev/null"]