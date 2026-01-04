from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {
        "status":"online",
        "system":"Zero-Downtime-FastAPI",
        "version":"1.0.0"
    
    }
@app.get("/health")
def health_check():
    return {"status":"healthy"}
