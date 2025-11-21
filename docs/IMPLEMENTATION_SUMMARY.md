# Generic Server URL Feature - Implementation Summary

## Issue
**GitHub Issue #3013**: Feat: To allow user to use generic url while using the app

## Problem Statement
Previously, users were required to navigate through a dedicated "Set URL" screen to configure the server URL before they could proceed to login or signup. This added an extra step to the authentication flow and didn't allow users to easily change the server URL once set.

## Solution Implemented

### 1. Added Server URL Input to Login Screen
- Added a collapsible "Server URL" section at the top of the login form
- Users can view, edit, and validate server URLs without leaving the login screen
- Current URL is displayed with visual indicators (checkmark when configured)
- URL validation happens in real-time with user feedback

### 2. Added Server URL Input to Signup Screen
- Implemented the same functionality on the signup screen for consistency
- Users can configure or change server URLs during the signup process

### 3. Key Features
- **Collapsible UI**: URL field can be expanded/collapsed to keep the interface clean
- **Real-time Validation**: Server URLs are validated before being saved
- **Visual Feedback**: Green checkmark indicates a configured URL, loading dialogs during validation
- **Persistence**: URLs are cached in Hive local storage
- **Multi-language Support**: Translation strings added for 8 languages

## Files Modified

### View Files
1. `/lib/views/pre_auth_screens/login.dart`
   - Added collapsible Server URL section with toggle button
   - Added URL input field with save functionality
   - Shows current URL when collapsed

2. `/lib/views/pre_auth_screens/signup_details.dart`
   - Same UI additions as login screen for consistency

### ViewModel Files
3. `/lib/view_model/pre_auth_view_models/login_view_model.dart`
   - Added URL management properties (urlController, urlFocus, showUrlField)
   - Added loadCurrentUrl() method to fetch saved URL from storage
   - Added toggleUrlField() method to show/hide URL input
   - Added updateServerUrl() method with validation and storage logic

4. `/lib/view_model/pre_auth_view_models/signup_details_view_model.dart`
   - Same additions as LoginViewModel

### Translation Files
5. All language files in `/lang/` directory:
   - `en.json` (English)
   - `de.json` (German)
   - `es.json` (Spanish)
   - `fr.json` (French)
   - `hi.json` (Hindi)
   - `ja.json` (Japanese)
   - `pt.json` (Portuguese)
   - `zh.json` (Chinese)
   
   Added translations for:
   - "Server URL"
   - "Enter Server URL"

### Documentation Files
6. `/docs/GENERIC_URL_FEATURE.md` - Comprehensive feature documentation
7. `/docs/IMPLEMENTATION_SUMMARY.md` - This file

## Technical Implementation Details

### URL Storage
- URLs are stored in Hive local storage box named 'url'
- Two keys are used:
  - `url`: Main server URL
  - `imageUrl`: Image URL prefix (derived as `{url}/talawa/`)

### URL Validation Flow
1. User enters or modifies URL
2. URL format is validated using `Validator.validateURL()`
3. URL existence is checked using `Validator.validateUrlExistence()`
4. If valid:
   - URL is saved to Hive storage
   - GraphQL config is refreshed via `graphqlConfig.getOrgUrl()`
   - Success message is shown
5. If invalid:
   - Error message is displayed
   - URL is not saved

### UI States
1. **Collapsed State (Default)**
   - Shows "Server URL" label with current URL in gray text
   - Green checkmark icon if URL is configured
   - Edit icon button to expand

2. **Expanded State**
   - Full URL input field is visible
   - Save icon button to validate and update
   - User can type or paste new URL

3. **Loading State**
   - Progress dialog shown during validation
   - Prevents user interaction until validation completes

## Testing Recommendations

### Manual Testing
1. **Login Screen URL Management**
   - Open app and navigate to login screen
   - Click edit icon to expand URL field
   - Enter valid URL and verify it saves correctly
   - Enter invalid URL and verify error message
   - Verify URL persists after app restart

2. **Signup Screen URL Management**
   - Navigate to signup screen
   - Verify same functionality as login screen
   - Test URL changes during signup flow

3. **Edge Cases**
   - Test with empty URL
   - Test with URLs missing protocol (http/https)
   - Test with unreachable server URLs
   - Test with special characters in URL
   - Test offline behavior

4. **Internationalization**
   - Change app language and verify translations
   - Test with all 8 supported languages

### Automated Testing
Consider adding test cases for:
- URL validation logic
- URL persistence in Hive storage
- ViewModel state management
- UI widget behavior

## Benefits of This Implementation

1. **User Experience**: Users can change servers without navigating away from login/signup
2. **Flexibility**: Support for multiple server environments (dev, staging, production)
3. **Developer Experience**: Organizations can easily switch between test servers
4. **Transparency**: Users always know which server they're connecting to
5. **Error Prevention**: Built-in validation prevents connection issues

## Backwards Compatibility

This implementation is fully backwards compatible:
- Existing "Set URL" screen still works
- Users who previously set URLs will see them in the new fields
- No breaking changes to storage or API

## Future Enhancement Ideas

1. **Server Profiles**: Save multiple server configurations with names
2. **Recent Servers**: Dropdown of recently used server URLs
3. **QR Code Integration**: Scan QR code to auto-fill server URL
4. **Organization Discovery**: Auto-detect server from organization name
5. **Health Check**: Show server status (online/offline) indicator

## GSoC Contribution

This feature was implemented as part of Google Summer of Code (GSoC) 2025 contribution to the Talawa project by [Contributor Name].

### Issue Reference
- GitHub Issue: #3013
- Pull Request: [To be added]

## Usage Instructions

### For End Users

**Changing Server URL on Login:**
1. Open Talawa app
2. Navigate to login screen
3. Look for "Server URL" section at top
4. Tap the edit icon (pencil)
5. Enter your server URL (e.g., `https://myserver.com/graphql`)
6. Tap the save icon (checkmark) or press Enter
7. Wait for validation
8. Proceed with login once URL is verified

**Changing Server URL on Signup:**
1. Navigate through organization selection to signup details
2. Follow same steps as login screen
3. Complete signup with your chosen server

### For Developers

To test with different servers during development:

```dart
// Programmatically set server URL
final box = Hive.box('url');
box.put('url', 'https://dev-server.com/graphql');
box.put('imageUrl', 'https://dev-server.com/graphql/talawa/');
graphqlConfig.getOrgUrl();
```

## Configuration

No additional configuration is required. The feature works out of the box with the existing Hive storage and GraphQL configuration.

## Dependencies

No new dependencies were added. The feature uses existing packages:
- `hive` (already in use for local storage)
- `graphql_flutter` (already in use for API communication)
- Built-in Flutter widgets and utilities

## Maintenance Notes

- URL validation logic is in `/lib/utils/validators.dart`
- GraphQL configuration is in `/lib/services/graphql_config.dart`
- If adding new language support, update translation files with URL-related strings
- Keep UI consistent across login and signup screens when making changes

## Screenshots

[Recommended to add screenshots showing:]
1. Login screen with collapsed URL section
2. Login screen with expanded URL input
3. URL validation success message
4. URL validation error message
5. Signup screen with URL section

## Contact

For questions or issues related to this feature:
- Create an issue on GitHub: https://github.com/PalisadoesFoundation/talawa/issues
- Refer to main documentation: /docs/GENERIC_URL_FEATURE.md

---

**Date Implemented**: November 21, 2025
**Status**: ✅ Complete and Ready for Review
