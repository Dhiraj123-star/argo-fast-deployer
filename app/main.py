from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {
        "status":"online",
        "system":"ArgoFast-Deployer",
        "version":"1.0.0"
    
    }