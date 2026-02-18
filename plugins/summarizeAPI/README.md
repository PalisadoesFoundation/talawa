# SummarizeAPI Plugin

AI-powered text summarization plugin that uses external API services. This plugin allows administrators to configure their own summarization API endpoints and credentials, making it flexible for various AI services.

## Features

- 🎯 **Configurable API Endpoint**: Use any summarization API service
- 🔐 **Secure API Key Management**: Store API keys securely in the database
- 📝 **Post Summarization**: Add summarize buttons to posts in both organization and user portals
- ⚙️ **Admin Configuration**: Easy-to-use configuration interface in the admin dashboard
- 🧪 **Test API Connection**: Built-in testing functionality to validate API setup

## Extension Points

- **G3**: Organization post summarize button
- **G4**: User portal post summarize button
- **RA1**: Admin configuration page route
- **DA1**: Admin dashboard menu item

## Configuration

1. Navigate to Admin Dashboard → SummarizeAPI Configuration
2. Enter your API endpoint URL (e.g., `https://api.example.com/summarize`)
3. Add your API key
4. Configure request/response format settings
5. Test the connection
6. Save the configuration

## API Requirements

Your summarization API should:
- Accept POST requests
- Support JSON request/response format
- Accept text in the request body
- Return summarized text in the response

### Example API Request Format
```json
{
  "text": "Your text to summarize...",
  "max_length": 150
}
```

### Example API Response Format
```json
{
  "summary": "The summarized text..."
}
```

## Usage

Once configured, users will see a "Summarize" button below post captions. Clicking it will:
1. Send the post text to your configured API
2. Display a loading indicator
3. Show the generated summary below the post

## Development

This plugin follows the Talawa plugin architecture with three main components:

- **admin/**: React components for web admin interface
- **api/**: GraphQL schema and resolvers
- **app/**: Flutter widgets for mobile app

## Author

Palisadoes Foundation
