import pytest
from app.routers import plant_images as plant_images_router
from fastapi.testclient import TestClient
from app.main import app
from app.database import models
from app.database.database import engine, SessionLocal
from sqlalchemy.orm import Session
from datetime import datetime, UTC
from dotenv import load_dotenv
import os

client = TestClient(app)
load_dotenv()

#Setup the test database
models.Base.metadata.create_all(bind=engine)

#Dependency override to use a test DB session
def override_get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

app.dependency_overrides[plant_images_router.get_db] = override_get_db

#Test constants
VALID_API_KEY = os.getenv("API_KEY")  
API_KEY_NAME = "AICoach-API-Key"

#Tests
def test_create_plant_image():
    response = client.post(
        "/plant_images/",
        headers={API_KEY_NAME: VALID_API_KEY},
        json={
            "timestamp": datetime.now(UTC).isoformat(),
            "plant_name": "Tomato",
            "account_uid": "user123",
            "plant_state": "Healthy",
            "filename": "image1.jpg"
        }
    )
    assert response.status_code == 200
    data = response.json()
    assert data["id"] is not None
    assert data["plant_name"] == "Tomato"

def test_get_plant_images():
    # Create a test image first (since your DB is empty between tests)
    client.post(
        "/plant_images/",
        headers={API_KEY_NAME: VALID_API_KEY},
        json={
            "timestamp": datetime.now(UTC).isoformat(),
            "plant_name": "Lettuce",
            "account_uid": "user456",
            "plant_state": "Wilting",
            "filename": "image2.jpg"
        }
    )

    response = client.get(
        "/plant_images/",
        headers={API_KEY_NAME: VALID_API_KEY}
    )
    assert response.status_code == 200
    data = response.json()
    assert isinstance(data, list)
    assert len(data) >= 1
    assert any(image["plant_name"] == "Lettuce" for image in data)

def test_api_key_required():
    response = client.get("/plant_images/")
    assert response.status_code == 401 or response.status_code == 403