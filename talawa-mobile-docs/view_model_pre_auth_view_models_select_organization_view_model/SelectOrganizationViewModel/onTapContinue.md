


# onTapContinue method








void onTapContinue
()








## Implementation

```dart
void onTapContinue() {
  // if user selected any organization.
  if (selectedOrganization.id != '-1') {
    navigationService.pushScreen(
      Routes.signupDetailScreen,
      arguments: selectedOrganization,
    );
  } else {
    navigationService.showTalawaErrorSnackBar(
      'Select one organization to continue',
      MessageType.warning,
      duration: const Duration(milliseconds: 750),
    );
  }
}
```







