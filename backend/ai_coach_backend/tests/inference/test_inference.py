import io
from fastapi.testclient import TestClient
from app.main import app
from PIL import Image
from dotenv import load_dotenv
import os

client = TestClient(app)

load_dotenv()

VALID_API_KEY = os.getenv("API_KEY") 

def create_dummy_image():
    img = Image.new('RGB', (224, 224), color=(255, 0, 0))  # Solid red image
    img_byte_arr = io.BytesIO()
    img.save(img_byte_arr, format='JPEG')
    img_byte_arr.seek(0)
    return img_byte_arr

def test_inference_endpoint_success():
    image_bytes = create_dummy_image()

    response = client.post(
        "/inference/",
        headers={"AICoach-API-Key": VALID_API_KEY},
        files={"file": ("test.jpg", image_bytes, "image/jpeg")}
    )

    assert response.status_code == 200
    data = response.json()
    assert "classification" in data
    assert isinstance(data["classification"], str)

def test_inference_endpoint_requires_api_key():
    image_bytes = create_dummy_image()

    response = client.post(
        "/inference/",
        files={"file": ("test.jpg", image_bytes, "image/jpeg")}
    )

    assert response.status_code == 401 or response.status_code == 403