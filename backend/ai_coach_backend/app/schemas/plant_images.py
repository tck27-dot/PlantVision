from pydantic import BaseModel, ConfigDict
from datetime import datetime
from typing import Optional

class PlantImageBase(BaseModel):
    timestamp: datetime
    plant_name: str
    account_uid: str
    plant_state: str
    filename: str
    model_version: Optional[str] = None
    notes: Optional[str] = None

class PlantImageCreate(PlantImageBase):
    pass

class PlantImage(PlantImageBase):
    id: int

    model_config = ConfigDict(from_attributes=True)