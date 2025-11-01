# Talawa Mobile App - AI Coding Assistant Instructions

## Project Overview
Talawa is a comprehensive Flutter mobile app for community organization management, part of a modular ecosystem including talawa-api (GraphQL backend) and talawa-admin (web portal). The app uses **Provider + GetIt + MVVM architecture** with GraphQL for data management.

## Architecture & Core Patterns

### Dependency Injection (GetIt)
- **Central registration**: All services registered in `lib/locator.dart` using GetIt
- **Global instances**: Access via `userConfig`, `navigationService`, `databaseFunctions`, etc.
- **Singleton pattern**: Most services are singletons; ViewModels are factories
- **Testing**: Mock services through GetIt during test setup

### MVVM with Provider
- **BaseView pattern**: Use `lib/views/base_view.dart` wrapper for all screens
- **ViewModels**: Extend `BaseModel` from `lib/view_model/base_view_model.dart`
- **State management**: Use `setState(ViewState.busy/idle)` for loading states
- **Provider pattern**: ViewModels auto-registered with ChangeNotifierProvider

Example implementation:
```dart
class MyScreenViewModel extends BaseModel {
  void performAction() {
    setState(ViewState.busy);
    // async work
    setState(ViewState.idle);
  }
}

// In view
BaseView<MyScreenViewModel>(
  onModelReady: (model) => model.initialize(),
  builder: (context, model, child) => Scaffold(...)
)
```

### GraphQL Integration
- **Central config**: `lib/services/graphql_config.dart` manages client setup
- **Query definitions**: All GraphQL queries in `lib/utils/queries.dart`
- **Mutations**: Use `databaseFunctions.gqlAuthMutation()` pattern
- **Environment**: API URL configured via `.env` file

## File Organization & Conventions

### Folder Structure
```
lib/
├── services/          # Business logic, API calls, data management
├── view_model/        # MVVM ViewModels (business logic for UI)
├── views/            # UI screens and widgets
├── models/           # Data models matching API responses
├── utils/            # Utilities, validators, constants
├── constants/        # App constants, routing
└── locator.dart      # Dependency injection setup
```

### Naming Conventions
- **Files**: `snake_case.dart` (e.g., `organization_feed.dart`)
- **Classes**: `PascalCase` (e.g., `OrganizationFeedViewModel`)
- **Variables**: `camelCase` with explicit types when possible
- **Constants**: `static const String` for routes, strings

### Code Organization Within Files
1. Constructor (just after class declaration)
2. Private variables with explicit types
3. Build method (use sub-methods like `_buildAppBar()`)
4. Sub-build methods
5. Business logic methods
6. Utility methods

## Development Workflows

### Environment Setup
```bash
# Required files
cp .env.example .env  # Configure API_URL
cd talawa_lint && flutter pub get && cd ..
flutter pub get
```

### Code Quality Requirements
- **Formatting**: Run `dart format --set-exit-if-changed .` before commits
- **Analysis**: Run `flutter analyze` - must pass with no issues
- **Documentation**: Remove `// ignore_for_file: talawa_api_doc` lines and add proper docs
- **File size**: Max 300 lines per file (enforced)
- **Test coverage**: Must maintain current coverage threshold (check `.github/workflows/pull-request.yml`)

### Testing Patterns
- **Mock setup**: Use `test/helpers/test_helpers.dart` for service mocks
- **Widget tests**: Follow existing patterns in `test/widget_tests/`
- **Integration**: Use `test/helpers/` for shared test utilities
- **Coverage**: Run `flutter test --coverage` + `genhtml coverage/lcov.info -o coverage`

## UI & Responsive Design

### SizeConfig Pattern
**Critical**: Never use hardcoded dimensions in UI code
```dart
// ❌ Wrong
SizedBox(height: 8, width: 4)

// ✅ Correct
SizedBox(
  height: SizeConfig.safeBlockVertical,
  width: SizeConfig.safeBlockHorizontal
)
```

### Widget State Management
- **Prefer StatelessWidget** when possible
- **Use const constructors** where applicable
- **Debug output**: Use `debugPrint()` instead of `print()`

## Key Service Patterns

### Navigation
```dart
navigationService.pushNamed('/routeName', arguments: data);
navigationService.pop(); // instead of Navigator.pop
```

### User Management
```dart
// Check login status
if (await userConfig.userLoggedIn()) { ... }

// Access current user
final user = userConfig.currentUser;
```

### Data Fetching
```dart
// In ViewModel
Future<void> fetchData() async {
  setState(ViewState.busy);
  try {
    final result = await databaseFunctions.gqlAuthQuery(queries.getXQuery);
    // Process result
  } catch (e) {
    // Handle error
  }
  setState(ViewState.idle);
}
```

## Common Integration Points

### Multi-language Support
- Locale files in `lang/` directory
- Use `AppLocalizations` delegate pattern
- Support: en, es, fr, hi, zh, de, ja, pt

### Image Handling
- Use `imageService` for uploads/processing
- Images via `ImagePicker` + `ImageCropper` services
- Cached network images preferred for remote content

### Real-time Features
- Chat via GraphQL subscriptions
- WebSocket configuration in `GraphqlConfig`
- Use `ChatService` for messaging features

## Project-Specific Gotchas

- **Route arguments**: Always pass structured data via `RouteSettings.arguments`
- **Theme switching**: Use `AppTheme` provider, not direct ThemeData
- **Demo mode**: Separate demo screens exist for offline functionality
- **Quick actions**: iOS/Android home screen shortcuts configured in `main.dart`
- **Hive storage**: Local data persistence via `HiveManager`

## Testing Strategy
- **Unit tests**: For ViewModels and services
- **Widget tests**: For UI components
- **Integration tests**: In `integration_test/` directory
- **Mock data**: Use existing fixtures in `test/fixtures/`