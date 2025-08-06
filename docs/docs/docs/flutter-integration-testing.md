# Flutter Integration Tests (Robot Pattern)

This project uses **Flutter Integration Testing** with the **Robot Pattern** to ensure UI flows and app behavior are working as expected.

---

## Directory Structure

```
integration_test/
├── app_test.dart             # Main entry point for integration tests
├── robots/
│   └── login_form_robot.dart # Contains reusable robot class for login flow
└── helper.dart               # Utility/helper functions used in tests
```

---

## Robot Pattern

We follow the **Robot Pattern** to keep our test code clean, maintainable, and readable.
Each robot encapsulates the logic for interacting with a specific screen or feature. For example:

```dart
final loginFormRobot = LoginFormRobot(tester);
await loginFormRobot.loginAdmin();
```
All robot files are located in:

```
integration_test/robots/
```

---

## Setup Instructions

1. Make sure you have the necessary dependencies installed:

```bash
flutter pub get
```

2. Ensure backend is running and accessible.
3. Create a `.env` file in the root directory and add required variables:
```env
API_URL=http://<IPv4>:4000/graphql
```

---

## Running Integration Tests

To run the integration test for `app_test.dart`, use the following command:
```bash
flutter test integration_test/app_test.dart
```
---

Happy Testing! 🎉
