FROM shashikg/whispers2t:latest

WORKDIR /app
COPY app.py /app

CMD ["python", "app.py"]