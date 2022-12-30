from fastapi import FastAPI
import uvicorn
from pydantic import BaseModel

app = FastAPI(title = 'Fahrenheit Calculator')

class Celsius(BaseModel):
    celsius: float

@app.post("/calculateFahrenheit")
def operator(input:Celsius):
    fahrenheit = (input.celsius * (9/5)) + 32
    return fahrenheit

if __name__ == "__main__":
    uvicorn.run(app, host = "0.0.0.0", port = 8001)

