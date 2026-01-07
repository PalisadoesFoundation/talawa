# Overview for `ScaffoldMessengerState`

## Description

State for a [ScaffoldMessenger].

 A [ScaffoldMessengerState] object can be used to [showSnackBar] or
 [showMaterialBanner] for every registered [Scaffold] that is a descendant of
 the associated [ScaffoldMessenger]. Scaffolds will register to receive
 [SnackBar]s and [MaterialBanner]s from their closest ScaffoldMessenger
 ancestor.

 Typically obtained via [ScaffoldMessenger.of].

## Dependencies

- State, TickerProviderStateMixin

## Members

- **_scaffolds**: `LinkedHashSet&lt;ScaffoldState&gt;`
- **_materialBanners**: `Queue&lt;ScaffoldFeatureController&lt;MaterialBanner, MaterialBannerClosedReason&gt;&gt;`
- **_materialBannerController**: `AnimationController?`
- **_snackBars**: `Queue&lt;ScaffoldFeatureController&lt;SnackBar, SnackBarClosedReason&gt;&gt;`
- **_snackBarController**: `AnimationController?`
- **_snackBarTimer**: `Timer?`
- **_accessibleNavigation**: `bool?`
