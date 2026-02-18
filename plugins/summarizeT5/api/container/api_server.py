#!/usr/bin/env python3
"""FastAPI server for T5 Text Summarization.

Provides REST API endpoints for text summarization using T5-base model
"""

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Optional
from contextlib import asynccontextmanager
import uvicorn
from summarize import T5Summarizer

# Initialize summarizer (will be loaded when server starts)
summarizer = None


@asynccontextmanager
async def lifespan(app: FastAPI):
    """Initialize the T5 model when server starts.

    Args:
        None

    Returns:
        None

    """
    global summarizer
    print("Loading T5 model...")
    summarizer = T5Summarizer()
    print("Server ready!")
    yield
    print("Shutting down...")


# Initialize FastAPI app
app = FastAPI(
    title="T5 Text Summarization API",
    description="API for text summarization using T5-base model",
    version="1.0.0",
    lifespan=lifespan,
)


class SummarizeRequest(BaseModel):
    """Summarize request model.

    Args:
        None

    Returns:
        None

    """

    text: str
    max_summary_length: Optional[int] = 150


class SummarizeResponse(BaseModel):
    """Summarize response model.

    Args:
        None

    Returns:
        None

    """

    summary: str
    original_length: int
    summary_length: int


@app.get("/")
async def root():
    """Root endpoint.

    Args:
        None

    Returns:
        string: Message string.

    """
    return {"message": "T5 Text Summarization API is running"}


@app.get("/health")
async def health_check():
    """Health check endpoint.

    Args:
        None

    Returns:
        dict: Status dict.

    """
    return {
        "status": "healthy",
        "model": summarizer.model_name if summarizer else "not loaded",
    }


@app.post("/summarize", response_model=SummarizeResponse)
async def summarize_text(request: SummarizeRequest):
    """Summarize the provided text.

    Args:
        request: SummarizeRequest containing text and optional
            max_summary_length

    Returns:
        code: SummarizeResponse with summary and metadata

    """
    if not summarizer:
        raise HTTPException(status_code=503, detail="Model not loaded yet")

    if not request.text.strip():
        raise HTTPException(status_code=400, detail="Text cannot be empty")

    try:
        # Generate summary
        summary = summarizer.summarize(
            request.text, request.max_summary_length
        )

        return SummarizeResponse(
            summary=summary,
            original_length=len(request.text),
            summary_length=len(summary),
        )

    except Exception as e:
        raise HTTPException(
            status_code=500, detail=f"Error generating summary: {str(e)}"
        )


@app.post("/summarize/batch")
async def summarize_batch(texts: list[str], max_summary_length: int = 150):
    """Summarize multiple texts in batch.

    Args:
        texts: List of texts to summarize
        max_summary_length: Maximum length of summaries

    Returns:
        list: List of summaries

    """
    if not summarizer:
        raise HTTPException(status_code=503, detail="Model not loaded yet")

    if not texts:
        raise HTTPException(status_code=400, detail="No texts provided")

    try:
        summaries = []
        for text in texts:
            if text.strip():
                summary = summarizer.summarize(text, max_summary_length)
                summaries.append(summary)
            else:
                summaries.append("")

        return {"summaries": summaries}

    except Exception as e:
        raise HTTPException(
            status_code=500, detail=f"Error generating summaries: {str(e)}"
        )


if __name__ == "__main__":
    uvicorn.run("api_server:app", host="0.0.0.0", port=8000, reload=False)
