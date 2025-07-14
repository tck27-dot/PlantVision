from ..database import models
from sqlalchemy.orm import Session
from ..schemas import plant_images

def create_plant_image(db: Session, plant_image: plant_images.PlantImageCreate):
    db_plant_image = models.PlantImage(**plant_image.model_dump())
    db.add(db_plant_image)
    db.commit()
    db.refresh(db_plant_image)
    return db_plant_image

def get_plant_image(db: Session, plant_image_id: int):
    return db.query(models.PlantImage).filter(models.PlantImage.id == plant_image_id).first()

def get_plant_images(db: Session, skip: int = 0, limit: int = 100):
    return db.query(models.PlantImage).offset(skip).limit(limit).all()

def delete_plant_image(db: Session, plant_image_id: int):
    db_plant_image = db.query(models.PlantImage).filter(models.PlantImage.id == plant_image_id).first()
    if db_plant_image:
        db.delete(db_plant_image)
        db.commit()
    return db_plant_image