---
id: api-containerization
title: API Plugin Containerization
slug: /developer-resources/api/containerization
sidebar_position: 3
---


# API Plugin Containerization (T5 Summarizer Reference)

This section uses the exact setup from the T5 Summarizer plugin for containerization.

## Quick Start

### 1. Build and Run with Docker Compose

```bash
docker-compose up --build
# The API will be available at http://localhost:8000
```

### 2. Using the API

```bash
# Health check
curl http://localhost:8000/health

# Summarize text
curl -X POST "http://localhost:8000/summarize" \
     -H "Content-Type: application/json" \
     -d '{"text": "Your long text here...", "max_summary_length": 150}'
```

## Docker Compose Example

```yaml
services:
  t5-summarizer:
    build: .
    container_name: t5-summarizer
    ports:
      - "8000:8000"
    volumes:
      - cache:/app/cache
      - input:/app/input
      - output:/app/output

      }
    },
  })
);

builder.objectType('SummarizeResult', {
  fields: (t) => ({
    summary: t.exposeString('summary'),
    originalLength: t.exposeInt('originalLength'),
    summaryLength: t.exposeInt('summaryLength'),
  }),
});
```

### Lifecycle Integration

```typescript
// index.ts
import { IPluginLifecycle } from '../../types';
import { execSync } from 'child_process';
import axios from 'axios';

const SummarizeT5Plugin: IPluginLifecycle = {
  async onInstall() {
    console.log('[SummarizeT5] Building Docker container...');
    
    // Build container
    execSync('docker-compose -f container/docker-compose.yml build', {
      cwd: __dirname,
      stdio: 'inherit',
    });
  },

  async onActivate() {
    console.log('[SummarizeT5] Starting container...');
    
    // Start container
    execSync('docker-compose -f container/docker-compose.yml up -d', {
      cwd: __dirname,
      stdio: 'inherit',
    });

    // Wait for health check
    await waitForHealthy('http://localhost:8000/health', 60000);
    
    console.log('[SummarizeT5] Container ready');
  },

  async onDeactivate() {
    console.log('[SummarizeT5] Stopping container...');
    
    // Stop container
    execSync('docker-compose -f container/docker-compose.yml down', {
      cwd: __dirname,
      stdio: 'inherit',
    });
  },

  async onUninstall() {
    console.log('[SummarizeT5] Removing container and volumes...');
    
    // Remove everything
    execSync('docker-compose -f container/docker-compose.yml down -v --rmi all', {
      cwd: __dirname,
      stdio: 'inherit',
    });
  },
};

async function waitForHealthy(url: string, timeout: number): Promise<void> {
  const start = Date.now();
  
  while (Date.now() - start < timeout) {
    try {
      const response = await axios.get(url);
      if (response.data.status === 'healthy') {
        return;
      }
    } catch (error) {
      // Not ready yet
    }
    
    await new Promise(resolve => setTimeout(resolve, 1000));
  }
  
  throw new Error('Container health check timeout');
}

export default SummarizeT5Plugin;
```

## Multi-Container Setup

### Redis + Worker Example

```yaml
# docker-compose.yml
services:
  redis:
    image: redis:7-alpine
    container_name: plugin-redis
    ports:
      - "6379:6379"
    volumes:
      - redis-data:/data
    command: redis-server --appendonly yes
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 10s
      timeout: 5s
      retries: 5

  worker:
    build: ./worker
    container_name: plugin-worker
    depends_on:
      redis:
        condition: service_healthy
    environment:
      - REDIS_URL=redis://redis:6379
      - WORKER_CONCURRENCY=4
    volumes:
      - ./jobs:/app/jobs
    restart: unless-stopped

volumes:
  redis-data:
```

## Environment Variables

```bash
# .env (plugin-specific)
# T5 Model Configuration
MODEL_NAME=t5-base
MAX_LENGTH=512
MIN_LENGTH=50
BATCH_SIZE=4

# Container Resources
MEMORY_LIMIT=4G
CPU_LIMIT=2.0

# Service Configuration
SERVICE_PORT=8000
LOG_LEVEL=info
```

## Health Checks

### Container Health

```python
@app.get("/health")
async def health_check():
    """Comprehensive health check"""
    try:
        # Check model loaded
        if model is None:
            return {"status": "unhealthy", "reason": "Model not loaded"}
        
        # Check device availability
        if device == "cuda" and not torch.cuda.is_available():
            return {"status": "degraded", "reason": "GPU not available"}
        
        # Test summarization
        test_input = tokenizer.encode("test", return_tensors="pt").to(device)
        model.generate(test_input, max_length=10)
        
        return {
            "status": "healthy",
            "model": model_name,
            "device": device,
            "memory_allocated": torch.cuda.memory_allocated() if device == "cuda" else None
        }
    except Exception as e:
        return {"status": "unhealthy", "error": str(e)}
```

## Best Practices

### ✅ Do's

- Use multi-stage builds to reduce image size
- Implement health checks
- Set resource limits
- Use volume mounts for persistent data
- Implement graceful shutdown
- Add proper logging
- Monitor container health
- Use environment variables for configuration

### ❌ Don'ts

- Don't store secrets in Docker images
- Don't run as root user
- Don't use `latest` tag in production
- Don't ignore resource limits
- Don't skip health checks
- Don't expose unnecessary ports

## Optimization

### Image Size

```dockerfile
# Multi-stage build
FROM python:3.9-slim as builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

FROM python:3.9-slim

WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY . .

ENV PATH=/root/.local/bin:$PATH
CMD ["python", "server.py"]
```

### Caching

```python
from functools import lru_cache

@lru_cache(maxsize=100)
def get_summary_cached(text_hash: str, max_length: int):
    # Cache summaries
    return summarize(text, max_length)
```

## Troubleshooting

### Container Won't Start

```bash
# Check logs
docker-compose logs t5-summarizer

# Check resource usage
docker stats

# Inspect container
docker inspect t5-summarizer
```

### Out of Memory

```yaml
# Increase memory limit
deploy:
  resources:
    limits:
      memory: 8G
```

### Slow Performance

- Use GPU if available
- Batch requests
- Reduce model size
- Implement caching

## Resources

- [Docker Documentation](https://docs.docker.com)
- [Docker Compose](https://docs.docker.com/compose/)
- [FastAPI](https://fastapi.tiangolo.com)
- [Hugging Face Transformers](https://huggingface.co/docs/transformers/)
