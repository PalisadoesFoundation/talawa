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

  /// Overrides the equality operator to compare instances of the MainScreenArgs class.
  ///
  /// Checks whether the [other] object is of the same type and compares its properties:
  /// If all properties match, returns `true`; otherwise, returns `false`.
  ///
  /// **params**:
  /// * `other`: The object to compare against this MainScreenArgs instance.
  ///
  /// **returns**:
  /// * `bool`: Returns `true` if the properties of both instances match; otherwise, `false`.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainScreenArgs &&
          other.fromSignUp == fromSignUp &&
          other.mainScreenIndex == mainScreenIndex &&
          other.toggleDemoMode == toggleDemoMode;

  /// Overrides the hashCode getter to generate a hash code based on the properties of the MainScreenArgs instance.
  ///
  /// Returns an integer value representing the combined hash codes.
  @override
  int get hashCode =>
      fromSignUp.hashCode ^ mainScreenIndex.hashCode ^ toggleDemoMode.hashCode;
}
