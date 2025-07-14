import pytest
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from app.database import models
from app.crud import plant_images as crud
from app.schemas.plant_images import PlantImageCreate
from datetime import datetime, UTC

# ---- Setup a temporary in-memory database ----
SQLALCHEMY_DATABASE_URL = "sqlite:///:memory:"

engine = create_engine(SQLALCHEMY_DATABASE_URL, connect_args={"check_same_thread": False})
TestingSessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Create the tables
models.Base.metadata.create_all(bind=engine)

@pytest.fixture
def db():
    db = TestingSessionLocal()
    try:
        yield db
    finally:
        db.close()

# ---- Tests ----

def test_create_plant_image(db):
    plant_image_data = PlantImageCreate(
        timestamp=datetime.now(UTC),
        plant_name="Tomato",
        account_uid="user123",
        plant_state="Healthy",
        filename="image1.jpg",
        model_version="v1.0",
        notes="No issues"
    )

    created_image = crud.create_plant_image(db, plant_image_data)

    assert created_image.id is not None
    assert created_image.plant_name == "Tomato"

def test_get_plant_image(db):
    # First create
    plant_image_data = PlantImageCreate(
        timestamp=datetime.now(UTC),
        plant_name="Lettuce",
        account_uid="user456",
        plant_state="Wilting",
        filename="image2.jpg"
    )
    created_image = crud.create_plant_image(db, plant_image_data)

    # Now get
    fetched_image = crud.get_plant_image(db, created_image.id)
    assert fetched_image is not None
    assert fetched_image.plant_name == "Lettuce"

def test_get_plant_images(db):
    # Create multiple images
    for i in range(3):
        plant_image_data = PlantImageCreate(
            timestamp=datetime.now(UTC),
            plant_name=f"Plant {i}",
            account_uid="batch_user",
            plant_state="Healthy",
            filename=f"image_{i}.jpg"
        )
        crud.create_plant_image(db, plant_image_data)

    images = crud.get_plant_images(db)
    assert len(images) >= 3

def test_delete_plant_image(db):
    plant_image_data = PlantImageCreate(
        timestamp=datetime.now(UTC),
        plant_name="Spinach",
        account_uid="user789",
        plant_state="Dead",
        filename="image3.jpg"
    )
    created_image = crud.create_plant_image(db, plant_image_data)

    deleted_image = crud.delete_plant_image(db, created_image.id)
    assert deleted_image is not None
    assert deleted_image.id == created_image.id

    # Confirm it's really deleted
    should_be_none = crud.get_plant_image(db, created_image.id)
    assert should_be_none is None