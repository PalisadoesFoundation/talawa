# Overview for `MainScreenViewModel`

## Description

MainScreenViewModel class provide methods to interact with the modal to serve data in user's action in Main Screen Views.

 The functions in this class are
 mainly in the context of Tutorials for different componenets of the App.

 Functions include:
 * `showTutorial`
 * `showHome`
 * `tourEventTargets`
 * `tourAddPost`
 * `tourChat`
 * `tourProfile`

## Dependencies

- BaseModel

## Members

- **scaffoldKey**: `GlobalKey&lt;ScaffoldState&gt;`
  static variables.

- **keyBNHome**: `GlobalKey`
  static variables.

- **keyBNDemoHome**: `GlobalKey`
  static variables.

- **keySHPinnedPost**: `GlobalKey`
  static variables.

- **keySHPost**: `GlobalKey`
  static variables.

- **keySHOrgName**: `GlobalKey`
  static variables.

- **keySHMenuIcon**: `GlobalKey`
  static variables.

- **keyDrawerCurOrg**: `GlobalKey`
  static variables.

- **keyDrawerSwitchableOrg**: `GlobalKey`
  static variables.

- **keyDrawerJoinOrg**: `GlobalKey`
  static variables.

- **keyDrawerLeaveCurrentOrg**: `GlobalKey`
  static variables.

- **keyBNEvents**: `GlobalKey`
  static variables.

- **keyBNDemoEvents**: `GlobalKey`
  static variables.

- **keySECategoryMenu**: `GlobalKey`
  static variables.

- **keySEDateFilter**: `GlobalKey`
  static variables.

- **keySEAdd**: `GlobalKey`
  static variables.

- **keySECard**: `GlobalKey`
  static variables.

- **keyBNPost**: `GlobalKey`
  static variables.

- **keyBNDemoPost**: `GlobalKey`
  static variables.

- **keyBNChat**: `GlobalKey`
  static variables.

- **keyBNProfile**: `GlobalKey`
  static variables.

- **keyBNDemoProfile**: `GlobalKey`
  static variables.

- **keyBNFunds**: `GlobalKey`
  static variables.

- **keySPEditProfile**: `GlobalKey`
  static variables.

- **keySPAppSetting**: `GlobalKey`
  static variables.

- **keySPHelp**: `GlobalKey`
  static variables.

- **keySPDonateUs**: `GlobalKey`
  static variables.

- **keySPInvite**: `GlobalKey`
  static variables.

- **keySPLogout**: `GlobalKey`
  static variables.

- **keySPPalisadoes**: `GlobalKey`
  static variables.

- **showAppTour**: `bool`
  bool to determine if we wanna show the apptour.

- **tourComplete**: `bool`
  bool to determine if apptour is complete.

- **tourSkipped**: `bool`
  bool to determine if apptour is skipped.

- **context**: `BuildContext`
  context consist of parent info.

- **appTour**: `AppTour`
  tutorialCoachMark consist of coach used to give tutorial.

- **targets**: `List&lt;FocusTarget&gt;`
  array of target.

- **demoMode**: `bool`
  flag to represent if app is in demoMode.

- **pages**: `List&lt;Widget&gt;`
  Contains the Widgets to be rendered for corresponding navbar items.

- **navBarItems**: `List&lt;BottomNavigationBarItem&gt;`
  Actual [BottomNavigationBarItem]s that show up on the screen.

- **currentPageIndex**: `int`
  var for current page in index.

