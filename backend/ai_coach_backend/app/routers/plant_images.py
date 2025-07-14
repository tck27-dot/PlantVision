from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.database.database import SessionLocal
from app.schemas import plant_images as schemas
from app.crud import plant_images as crud
from app.auth.auth import verify_api_key

router = APIRouter(
    prefix="/plant_images",
    tags=["Plant Images"],
    dependencies=[Depends(verify_api_key)],
)

# Dependency for getting a DB session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/", response_model=list[schemas.PlantImage])
def read_plant_images(db: Session = Depends(get_db)):
    return crud.get_plant_images(db)

@router.post("/", response_model=schemas.PlantImage)
def create_plant_image(plant_image: schemas.PlantImageCreate, db: Session = Depends(get_db)):
    return crud.create_plant_image(db, plant_image)