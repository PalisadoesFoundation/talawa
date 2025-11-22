# Talawa-Mobile Installation

Installation documentation can be found at either:

1. Online at https://docs-mobile.talawa.io/docs/installation
1. In the local repository at [INSTALLATION.md](docs/docs/docs/getting-started/installation.md) which is the source file for the web page.

## Features

### Custom Server URL Configuration

Talawa-Mobile allows users to specify a custom server URL during login and signup, enabling connection to any compatible Talawa API server.

#### How to Use

1. **On Login Screen:**
   - Tap the "Set URL" button to expand the server URL input section
   - Enter your custom Talawa API server URL (e.g., `https://api.example.com`)
   - The URL is validated for correct format and server availability
   - Once validated, the URL is saved and will persist across app restarts

2. **On Signup Screen:**
   - The same URL configuration is available during the signup process
   - Any URL set during signup will be used for the registration process
   - The URL persists after successful signup

#### URL Validation

The app performs two levels of validation:
- **Format Validation**: Ensures the URL follows proper URL structure
- **Existence Validation**: Verifies the server is reachable and responds

#### Supported Platforms

- Android
- iOS

**Note**: Web platform is not currently supported by Talawa-Mobile.
