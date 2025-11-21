# Generic Server URL Feature

## Overview

This feature allows users to use a generic/custom server URL while using the Talawa mobile app. Users can now change or configure the server URL directly from the login and signup screens without having to navigate to a separate "Set URL" screen.

## Motivation

Previously, users had to go through the "Set URL" screen to configure the server URL before they could login or signup. This new feature provides more flexibility by allowing users to:
- View the currently configured server URL
- Edit/change the server URL directly from login or signup screens
- Validate and save new server URLs without leaving the authentication flow

## Implementation Details

### Components Modified

#### 1. Login Screen (`lib/views/pre_auth_screens/login.dart`)
- Added a collapsible "Server URL" section at the top of the login form
- Shows current server URL with a green checkmark when configured
- Provides an edit button to expand/collapse the URL input field
- Includes a save button to validate and update the server URL

#### 2. Signup Screen (`lib/views/pre_auth_screens/signup_details.dart`)
- Added the same collapsible "Server URL" section as in the login screen
- Maintains consistency with the login screen UI/UX

#### 3. Login ViewModel (`lib/view_model/pre_auth_view_models/login_view_model.dart`)
- Added `urlController` - TextEditingController for managing URL input
- Added `urlFocus` - FocusNode for URL input field focus management
- Added `showUrlField` - Boolean flag to control URL field visibility
- Added `loadCurrentUrl()` - Method to load existing URL from Hive storage
- Added `toggleUrlField()` - Method to show/hide the URL input field
- Added `updateServerUrl()` - Method to validate and save new server URL

#### 4. Signup ViewModel (`lib/view_model/pre_auth_view_models/signup_details_view_model.dart`)
- Added the same properties and methods as LoginViewModel for URL management

### Storage

The server URL is stored in Hive local storage with the following keys:
- `url` - The main server URL (e.g., `https://example.com/graphql`)
- `imageUrl` - The image URL prefix (automatically derived as `{url}/talawa/`)

### URL Validation

When a user updates the server URL:
1. The URL format is validated using `Validator.validateURL()`
2. The URL existence is checked using `Validator.validateUrlExistence()`
3. If valid, the URL is saved to Hive storage
4. The GraphQL configuration is updated via `graphqlConfig.getOrgUrl()`
5. A success message is displayed to the user

### UI/UX Flow

#### Initial State (URL Already Configured)
- Server URL section shows a collapsed view
- Current URL is displayed in gray text (truncated with ellipsis if too long)
- A green checkmark icon indicates a URL is configured
- An edit icon button allows expanding the field

#### Editing State
- User clicks the edit icon
- URL input field expands with the current URL pre-filled
- User can modify the URL
- User clicks save icon or presses enter to validate and update
- Progress dialog appears during validation
- Success/error message is displayed based on validation result

#### No URL Configured State
- The URL field is empty
- No checkmark icon is shown
- User can click edit icon to enter a URL

## Internationalization

Translation strings have been added to all language files:
- English: "Server URL", "Enter Server URL"
- German: "Server-URL", "Server-URL eingeben"
- Spanish: "URL del servidor", "Ingrese la URL del servidor"
- French: "URL du serveur", "Entrez l'URL du serveur"
- Hindi: "सर्वर URL", "सर्वर URL दर्ज करें"
- Japanese: "サーバーURL", "サーバーURLを入力"
- Portuguese: "URL do servidor", "Digite a URL do servidor"
- Chinese: "服务器URL", "输入服务器URL"

## Benefits

1. **Flexibility**: Users can change server URLs without navigating away from login/signup
2. **Convenience**: The URL field is collapsible, keeping the UI clean when not needed
3. **Transparency**: Users can always see which server they're connecting to
4. **Validation**: Built-in URL validation prevents connection errors
5. **Persistence**: URLs are cached in local storage for future sessions

## Usage

### For End Users

1. **On Login Screen:**
   - Open the Talawa app and navigate to the login screen
   - Look for "Server URL" section at the top of the form
   - Click the edit icon to expand the URL input field
   - Enter your custom server URL (e.g., `https://your-server.com/graphql`)
   - Click the save icon or press enter
   - Wait for validation (a loading dialog will appear)
   - If valid, you'll see a success message and can proceed to login

2. **On Signup Screen:**
   - Navigate to the signup screen after selecting an organization
   - The same "Server URL" section is available
   - Follow the same steps as login to configure or change the URL

### For Developers

To use the URL management functionality in other screens:

```dart
// Load current URL from storage
final box = Hive.box('url');
final String? currentUrl = box.get('url') as String?;

// Update URL
box.put('url', newUrl);
box.put('imageUrl', "$newUrl/talawa/");
graphqlConfig.getOrgUrl(); // Refresh GraphQL config
```

## Testing

Key areas to test:
1. URL validation with valid and invalid URLs
2. URL persistence across app restarts
3. UI state transitions (collapsed/expanded)
4. Network connectivity during URL validation
5. Translation strings in different languages
6. Integration with existing authentication flows

## Future Enhancements

Potential improvements for future versions:
1. URL history/suggestions for frequently used servers
2. QR code scanning directly from login/signup screens
3. Auto-detection of server URL based on user email domain
4. Server URL presets for common Talawa instances
5. Offline mode indicator when server is unreachable

## Related Files

- `/lib/views/pre_auth_screens/login.dart`
- `/lib/views/pre_auth_screens/signup_details.dart`
- `/lib/view_model/pre_auth_view_models/login_view_model.dart`
- `/lib/view_model/pre_auth_view_models/signup_details_view_model.dart`
- `/lib/services/graphql_config.dart`
- `/lib/utils/validators.dart`
- `/lang/*.json` (all language translation files)

## Issues Addressed

This implementation addresses GitHub issue #3013: "Feat: To allow user to use generic url while using the app"

## Credits

Implemented as part of Google Summer of Code (GSoC) contribution to the Talawa project.
