FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libsndfile1 \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

# Upgrade pip and install dependencies
#RUN pip install --no-cache-dir --upgrade pip
#RUN pip install --no-cache-dir torch==2.1.2 --index-url https://download.pytorch.org/whl/cpu
#RUN pip install --no-cache-dir flask
#RUN pip install --no-cache-dir whispers2t

CMD ["python", "app.py"]