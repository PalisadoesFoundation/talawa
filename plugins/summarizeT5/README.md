# SummarizeT5 Plugin

AI-powered text summarization plugin using T5 model for Talawa posts.

## Features

- **G3 Extension Point**: Injects summarize button into organization posts
- **G4 Extension Point**: Injects summarize button into user portal posts
- **Simple API**: RESTful endpoint for text summarization
- **Fallback Support**: Works even when T5 service is unavailable

## Components

### Admin (Frontend)
- `SummarizeButton`: React component that appears below post captions
- Handles loading states, error handling, and displays summary inline

### API (Backend)
- `/api/summarize-t5/summarize`: POST endpoint for text summarization
- `/api/summarize-t5/health`: Health check endpoint
- `summarizeService`: Service layer for T5 model communication

## Usage

### For Users
1. Navigate to any post in the organization or user portal
2. Look for the "🤖 AI Summarize" button below the post caption
3. Click the button to generate an AI summary
4. The summary will appear inline below the button

### For Developers
The plugin automatically injects into G3 (org posts) and G4 (user posts) extension points. No additional configuration needed.

## API Endpoints

### POST /api/summarize-t5/summarize
```json
{
  "text": "Long text content to summarize...",
  "postId": "optional-post-id"
}
```

Response:
```json
{
  "summary": "Generated summary text...",
  "originalLength": 500,
  "summaryLength": 80,
  "postId": "optional-post-id"
}
```

## Environment Variables

- `T5_SERVICE_URL`: URL of the T5 Docker container (default: http://localhost:8000/summarize)

## Fallback Behavior

If the T5 service is unavailable, the plugin will:
1. Show an error message to the user
2. Log the error for debugging
3. Provide a simple text truncation as fallback

## Installation

1. Copy the plugin to your plugins directory
2. The plugin will automatically register G3 and G4 extension points
3. No additional configuration required

## Dependencies

- React (for admin components)
- Material-UI (for UI components)
- Express (for API endpoints)
- Fetch API (for T5 service communication)
