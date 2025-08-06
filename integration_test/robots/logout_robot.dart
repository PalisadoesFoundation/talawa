import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

/// A robot class to automate interactions with the logout process during integration tests.
class LogoutRobot {
  const LogoutRobot(this.tester);

  /// The [WidgetTester] instance used to interact with widgets during tests.
  final WidgetTester tester;

  ///  Logs out the user.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> logout() async {
    await _openProfileSettings();
    await _tapLogoutButton();
  }

  ///  Navigates to the profile settings page.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _openProfileSettings() async {
    await tester.pumpAndSettle(const Duration(seconds: 3));
    final Finder profileTab = find.byKey(const Key("ProfileTab"));
    if (profileTab.evaluate().isNotEmpty) {
      await tester.tap(profileTab);
    } else {
      // Fallback: find by icon in the bottom navigation bar
      final Finder bottomNavBar = find.byType(BottomNavigationBar);
      expect(bottomNavBar, findsOneWidget);

      // Find the profile icon (Icons.account_circle) within the bottom navigation bar
      final Finder profileIcon = find.descendant(
        of: bottomNavBar,
        matching: find.byIcon(Icons.account_circle),
      );
      expect(profileIcon, findsOneWidget);
      await tester.tap(profileIcon);
    }
    await tester.pumpAndSettle(const Duration(seconds: 2));
    final Finder settingsButton = find.byKey(const Key('settingIcon'));
    expect(settingsButton, findsOneWidget);
    await tester.tap(settingsButton);
    await tester.pumpAndSettle();
  }

  ///  Taps the logout button in the settings page.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _tapLogoutButton() async {
    await tester.pumpAndSettle(const Duration(seconds: 3));
    final Finder logoutButton = find.byKey(
      const Key('Logout'),
    );
    expect(logoutButton, findsOneWidget);
    await tester.tap(logoutButton);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await _handleRememberMeCheckbox();
    final Finder alertDialog = find.byType(AlertDialog);
    expect(alertDialog, findsOneWidget);

    final Finder confirmLogoutButton = find.descendant(
      of: alertDialog,
      matching: find.byKey(const Key('Logout')),
    );
    expect(confirmLogoutButton, findsOneWidget);
    await tester.tap(confirmLogoutButton);
    print("Logout button tapped");
    await tester.pumpAndSettle();
  }

  ///  Handles the "Remember me" checkbox in the logout dialog.
  ///
  ///  Unchecks the checkbox if it's currently checked.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _handleRememberMeCheckbox() async {
    final Finder rememberMeText = find.text('Remember me');
    expect(rememberMeText, findsOneWidget);
    final Finder checkbox = find.byType(Checkbox);
    expect(checkbox, findsOneWidget);

    // Get the checkbox widget to check its current state
    final Checkbox checkboxWidget = tester.widget(checkbox);
    if (checkboxWidget.value == true) {
      print("Checkbox is checked, unchecking it");
      await tester.tap(checkbox);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      print("Checkbox unchecked");
    } else {
      print("Checkbox is already unchecked");
    }
  }
}
