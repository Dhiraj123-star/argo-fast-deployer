FROM python:3.11-slim

WORKDIR /code

# Install dependencies

COPY ./app/requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy application code
COPY ./app /code/app

# Run the app
CMD ["uvicorn","app.main:app","--host","0.0.0.0","--port","8000"]
