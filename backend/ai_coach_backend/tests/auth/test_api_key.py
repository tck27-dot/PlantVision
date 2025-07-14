from fastapi.testclient import TestClient
from app.main import app
from dotenv import load_dotenv
import os

client = TestClient(app)
load_dotenv()
APIKEY = os.getenv("API_KEY")

def test_valid_api_key():
    headers = {"AICoach-API-Key": APIKEY } 
    response = client.get("/plant_images", headers=headers)
    assert response.status_code == 200



def test_invalid_api_key():
    headers = {"AICoach-API-Key": "invalid_key"}
    response = client.get("/plant_images", headers=headers)
    assert response.status_code == 403


def test_missing_api_key():
    response = client.get("/plant_images")
    assert response.status_code == 403 