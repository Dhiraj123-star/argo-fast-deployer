from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {
        "status":"online",
        "system":"Zero-Downtime-FastAPI",
        "version":"1.1.0",
        "message":"Update Successful!!"
    
    }
@app.get("/health")
def health_check():
    return {"status":"healthy"}

@app.get("/status")
def get_status():
    return {
        "database": "connected",
        "cache": "active",
        "uptime": "99.9%"

    }