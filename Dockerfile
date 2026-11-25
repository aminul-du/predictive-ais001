FROM python:3.11-slim-bookworm
WORKDIR /app
RUN pip install --no-cache-dir neo4j numpy fastapi uvicorn pydantic pytest httpx && \
    pip install --no-cache-dir torch --extra-index-url https://pytorch.org
COPY . /app
