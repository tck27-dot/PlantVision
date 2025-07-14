from fastapi import FastAPI
from dotenv import load_dotenv
from app.database import models
from app.database.database import engine
from app.routers import plant_images, plant_inference
load_dotenv()

# Create all DB tables
models.Base.metadata.create_all(bind=engine)

app = FastAPI()

# Register routers
app.include_router(plant_images.router)
app.include_router(plant_inference.router)
# Root health check
@app.get("/")
def root():
    return {"message": "Welcome to the PlantCoach API"}