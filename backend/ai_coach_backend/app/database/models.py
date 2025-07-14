from sqlalchemy import Column, Integer, String, DateTime, Text
from .database import Base

class PlantImage(Base):
    __tablename__ = "plant_images"

    id = Column(Integer, primary_key=True, index=True)
    timestamp = Column(DateTime, nullable=False)
    plant_name = Column(String(255), nullable=False)
    account_uid = Column(String(255), nullable=False)
    plant_state = Column(String(100), nullable=False)
    filename = Column(String(255), nullable=False)
    model_version = Column(String(50), nullable=True)
    notes = Column(Text, nullable=True)