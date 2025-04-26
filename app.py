from flask import Flask, request
from whispers2t import WhisperS2T
import os

app = Flask(__name__)
model = WhisperS2T(model_name="tiny")  # Use tiny model for Railway

@app.route("/transcribe", methods=["POST"])
def transcribe():
    file = request.files["audio"]
    file_path = "/tmp/audio.mp3"
    file.save(file_path)
    transcription = model.transcribe(file_path)
    os.remove(file_path)
    return {"transcription": transcription}

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 9000))
    app.run(host="0.0.0.0", port=port)