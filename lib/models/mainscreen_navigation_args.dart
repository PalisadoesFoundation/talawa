// ignore_for_file: avoid_dynamic_calls

/// This class creates a MainScreenArgs model.
class MainScreenArgs {
  MainScreenArgs({
    this.fromSignUp = false,
    required this.mainScreenIndex,
    this.toggleDemoMode = false,
  });

  /// Indicates whether the user navigated to the main screen from the signup page.
  final bool fromSignUp;

  /// Represents the index of the current page.
  final int mainScreenIndex;

  /// Determines if the application is in demo mode.
  final bool toggleDemoMode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainScreenArgs &&
          other.fromSignUp == fromSignUp &&
          other.mainScreenIndex == mainScreenIndex &&
          other.toggleDemoMode == toggleDemoMode;

  @override
  int get hashCode =>
      fromSignUp.hashCode ^ mainScreenIndex.hashCode ^ toggleDemoMode.hashCode;
}
