from fastapi import APIRouter, UploadFile, File, HTTPException, Depends
from sqlalchemy.orm import Session
from datetime import datetime, timezone

from app.auth.auth import verify_api_key
from app.inference.inference_engine import run_inference
from app.database.database import SessionLocal
from app.schemas import plant_images as schemas
from app.crud import plant_images as crud

router = APIRouter(
    prefix="/inference",
    tags=["Inference"],
    dependencies=[Depends(verify_api_key)],
)

# Dependency for getting a DB session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/")
async def classify_plant(
    file: UploadFile = File(...),
    db: Session = Depends(get_db)
):
    try:
        # Read and classify image
        image_bytes = await file.read()
        result = run_inference(image_bytes)

        # Save result to database
        new_plant = schemas.PlantImageCreate(
            timestamp=datetime.now(timezone.utc),
            plant_name="Uploaded from iOS",  # Replace or enhance if you want more dynamic logic
            account_uid="user_123",          # Replace with real user info in future
            plant_state=result,
            filename=file.filename,
            model_version="v1",
            notes=None
        )
        db_plant_image = crud.create_plant_image(db, new_plant)

        # Return both classification and saved record info
        return {
            "classification": result,
            "record_id": db_plant_image.id
        }

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))