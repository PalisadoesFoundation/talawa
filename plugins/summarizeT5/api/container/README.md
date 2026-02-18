# T5 Text Summarization in Docker

This project provides a Docker-based solution for text summarization using the T5-base model from Hugging Face Transformers.

## Features

- **T5-base model** for high-quality text summarization
- **Docker containerization** for easy deployment
- **REST API** with FastAPI for web integration
- **Command-line interface** for batch processing
- **GPU support** (automatically detects CUDA if available)
- **Caching** for model files to speed up subsequent runs

## Quick Start

### 1. Build and Run with Docker Compose

```bash
# Build and start the API server
docker-compose up --build

# The API will be available at http://localhost:8000
```

### 2. Using the API

Once the container is running, you can use the API:

```bash
# Health check
curl http://localhost:8000/health

# Summarize text
curl -X POST "http://localhost:8000/summarize" \
     -H "Content-Type: application/json" \
     -d '{"text": "Your long text here...", "max_summary_length": 150}'
```

### 3. Command Line Usage

```bash
# Run with docker-compose CLI profile
docker-compose --profile cli run t5-cli python summarize.py --help

# Summarize text directly
docker-compose --profile cli run t5-cli python summarize.py --text "Your text here"

# Summarize from file
echo "Your long text here..." > input.txt
docker-compose --profile cli run -v $(pwd):/app/input t5-cli python summarize.py --file /app/input/input.txt
```

## API Endpoints

### GET /
- **Description**: Health check
- **Response**: `{"message": "T5 Text Summarization API is running"}`

### GET /health
- **Description**: Detailed health check
- **Response**: `{"status": "healthy", "model": "t5-small"}`

### POST /summarize
- **Description**: Summarize a single text
- **Request Body**:
  ```json
  {
    "text": "Your text to summarize...",
    "max_summary_length": 150
  }
  ```
- **Response**:
  ```json
  {
    "summary": "Generated summary...",
    "original_length": 500,
    "summary_length": 120
  }
  ```

### POST /summarize/batch
- **Description**: Summarize multiple texts
- **Request Body**:
  ```json
  {
    "texts": ["Text 1...", "Text 2..."],
    "max_summary_length": 150
  }
  ```

## Configuration

### Environment Variables

- `TRANSFORMERS_CACHE`: Path to cache directory (default: `/app/cache`)
- `PYTHONPATH`: Python path (default: `/app`)

### Docker Compose Services

1. **t5-summarizer**: Main API server (port 8000)
2. **t5-cli**: Command-line interface (use with `--profile cli`)

### Volumes

- `./cache:/app/cache`: Model cache directory
- `./input:/app/input`: Input files directory
- `./output:/app/output`: Output files directory

## Model Comparison

| Model | Size | Parameters | Quality | Speed | Memory |
|-------|------|------------|---------|-------|--------|
| T5-small | ~60MB | 60M | Good | Fast | ~1GB |
| **T5-base** | **~220MB** | **220M** | **Better** | **Medium** | **~2GB** |
| T5-large | ~800MB | 770M | Best | Slow | ~4GB |

**T5-base** provides the best balance of quality and performance for most use cases.

## Usage Examples

### Example 1: API Usage with curl

```bash
# Start the service
docker-compose up -d

# Summarize text
curl -X POST "http://localhost:8000/summarize" \
     -H "Content-Type: application/json" \
     -d '{
       "text": "Artificial intelligence (AI) is intelligence demonstrated by machines, in contrast to the natural intelligence displayed by humans and animals. Leading AI textbooks define the field as the study of intelligent agents: any device that perceives its environment and takes actions that maximize its chance of successfully achieving its goals.",
       "max_summary_length": 100
     }'
```

### Example 2: Command Line Usage

```bash
# Create input file
cat > input.txt << EOF
Machine learning is a subset of artificial intelligence that focuses on algorithms that can learn from data. It has applications in many fields including computer vision, natural language processing, and robotics. The field has grown rapidly in recent years due to advances in computing power and the availability of large datasets.
EOF

# Summarize the file
docker-compose --profile cli run -v $(pwd):/app/input t5-cli python summarize.py --file /app/input/input.txt --max-summary-length 50
```

### Example 3: Interactive Mode

```bash
# Run interactive mode
docker-compose --profile cli run t5-cli python summarize.py
# Then type your text and press Ctrl+D when done
```

## Performance Notes

- **First run**: Model download and initialization may take 3-5 minutes
- **Subsequent runs**: Much faster due to caching
- **Memory usage**: ~2-4GB RAM recommended (T5-base uses more memory than T5-small)
- **GPU**: Automatically uses CUDA if available for faster inference

## Troubleshooting

### Common Issues

1. **Out of memory**: Increase Docker memory limit or use a smaller model
2. **Model download fails**: Check internet connection and try again
3. **Port conflicts**: Change port mapping in docker-compose.yml

### Logs

```bash
# View logs
docker-compose logs t5-summarizer

# Follow logs
docker-compose logs -f t5-summarizer
```

## Development

### Building from Source

```bash
# Build the image
docker build -t t5-summarizer .

# Run the container
docker run -p 8000:8000 t5-summarizer
```

### Custom Model

To use a different T5 model, modify the `model_name` parameter in the code:

```python
# In summarize.py or api_server.py
summarizer = T5Summarizer(model_name="t5-large")  # or t5-small, t5-3b, t5-11b
```

Available models:
- `t5-small` (60M parameters) - Fastest, good quality
- `t5-base` (220M parameters) - **Recommended** - Best balance
- `t5-large` (770M parameters) - Best quality, slower
- `t5-3b` (3B parameters) - Very high quality, requires more resources
- `t5-11b` (11B parameters) - Highest quality, requires significant resources

## License

This project uses the T5 model from Hugging Face, which is subject to the Apache 2.0 license.
