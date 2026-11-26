FROM python:3.11-slim-bookworm
WORKDIR /app
RUN pip install --no-cache-dir neo4j numpy fastapi uvicorn pydantic pytest httpx && \
    pip install --no-cache-dir torch --index-url https://download.pytorch.org/whl/cpu
COPY . /app
