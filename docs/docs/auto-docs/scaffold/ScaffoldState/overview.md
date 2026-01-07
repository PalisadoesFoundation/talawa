# Overview for `ScaffoldState`

## Description

State for a [Scaffold].

 Can display [BottomSheet]s. Retrieve a [ScaffoldState] from the current
 [BuildContext] using [Scaffold.of].

## Dependencies

- State, TickerProviderStateMixin, RestorationMixin

## Members

- **_drawerKey**: `GlobalKey&lt;DrawerControllerState&gt;`
- **_endDrawerKey**: `GlobalKey&lt;DrawerControllerState&gt;`
- **_bodyKey**: `GlobalKey`
- **_appBarMaxHeight**: `double?`
- **_drawerOpened**: `RestorableBool`
- **_endDrawerOpened**: `RestorableBool`
- **_scaffoldMessenger**: `ScaffoldMessengerState?`
- **_messengerSnackBar**: `ScaffoldFeatureController&lt;SnackBar, SnackBarClosedReason&gt;?`
- **_messengerMaterialBanner**: `ScaffoldFeatureController&lt;MaterialBanner, MaterialBannerClosedReason&gt;?`
- **_dismissedBottomSheets**: `List&lt;_StandardBottomSheet&gt;`
- **_currentBottomSheet**: `PersistentBottomSheetController?`
- **_currentBottomSheetKey**: `GlobalKey`
- **_persistentSheetHistoryEntry**: `LocalHistoryEntry?`
- **_floatingActionButtonMoveController**: `AnimationController`
- **_floatingActionButtonAnimator**: `FloatingActionButtonAnimator`
- **_previousFloatingActionButtonLocation**: `FloatingActionButtonLocation?`
- **_floatingActionButtonLocation**: `FloatingActionButtonLocation?`
- **_floatingActionButtonVisibilityController**: `AnimationController`
- **_geometryNotifier**: `_ScaffoldGeometryNotifier`
- **_showBodyScrim**: `bool`
- **_bodyScrimColor**: `Color`
