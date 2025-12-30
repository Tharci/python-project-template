# syntax=docker/dockerfile:1.7
FROM python:3.13-slim

# Prevent Python from writing .pyc files and enable unbuffered logs
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# System deps (optional but commonly useful for builds)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl \
  && rm -rf /var/lib/apt/lists/*

# Install uv
RUN pip install --no-cache-dir uv

# Copy dependency files first for better layer caching
# Supports either pyproject.toml (+ uv.lock) or requirements.txt
COPY pyproject.toml uv.lock* requirements.txt* ./

# Install dependencies
# - If uv.lock exists, install from lock
# - Else if pyproject.toml exists, install project deps
# - Else fallback to requirements.txt
RUN if [ -f "uv.lock" ]; then \
      uv sync --frozen --no-dev; \
    elif [ -f "pyproject.toml" ]; then \
      uv sync --no-dev; \
    else \
      uv pip install -r requirements.txt; \
    fi

# Copy app source
COPY . .

EXPOSE 5000

CMD ["uv", "run", "uvicorn", "app:app", "--host=0.0.0.0", "--port=5000"]
