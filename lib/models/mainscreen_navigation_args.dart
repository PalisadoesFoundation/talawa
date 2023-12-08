// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

class MainScreenArgs {
  MainScreenArgs({
    this.fromSignUp = false,
    required this.mainScreenIndex,
    this.toggleDemoMode = false,
  });

  final bool fromSignUp;
  final int mainScreenIndex;
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
