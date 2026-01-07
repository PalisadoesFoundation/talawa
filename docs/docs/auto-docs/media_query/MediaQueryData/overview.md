# Overview for `MediaQueryData`

## Description

Information about a piece of media (e.g., a window).

 For example, the [MediaQueryData.size] property contains the width and
 height of the current window.

 To obtain individual attributes in a [MediaQueryData], prefer to use the
 attribute-specific functions of [MediaQuery] over obtaining the entire
 [MediaQueryData] and accessing its members.
 

 To obtain the entire current [MediaQueryData] for a given [BuildContext],
 use the [MediaQuery.of] function. This can be useful if you are going to use
 [copyWith] to replace the [MediaQueryData] with one with an updated
 property.

 ## Insets and Padding

 ![A diagram of padding, viewInsets, and viewPadding in correlation with each
 other](https://flutter.github.io/assets-for-api-docs/assets/widgets/media_query.png)

 This diagram illustrates how [padding] relates to [viewPadding] and
 [viewInsets], shown here in its simplest configuration, as the difference
 between the two. In cases when the viewInsets exceed the viewPadding, like
 when a software keyboard is shown below, padding goes to zero rather than a
 negative value. Therefore, padding is calculated by taking
 `max(0.0, viewPadding - viewInsets)`.

 

 In this diagram, the black areas represent system UI that the app cannot
 draw over. The red area represents view padding that the application may not
 be able to detect gestures in and may not want to draw in. The grey area
 represents the system keyboard, which can cover over the bottom view padding
 when visible.

 MediaQueryData includes three [EdgeInsets] values:
 [padding], [viewPadding], and [viewInsets]. These values reflect the
 configuration of the device and are used and optionally consumed by widgets
 that position content within these insets. The padding value defines areas
 that might not be completely visible, like the display "notch" on the iPhone
 X. The viewInsets value defines areas that aren't visible at all, typically
 because they're obscured by the device's keyboard. Similar to viewInsets,
 viewPadding does not differentiate padding in areas that may be obscured.
 For example, by using the viewPadding property, padding would defer to the
 iPhone "safe area" regardless of whether a keyboard is showing.

 

 The viewInsets and viewPadding are independent values, they're
 measured from the edges of the MediaQuery widget's bounds. Together they
 inform the [padding] property. The bounds of the top level MediaQuery
 created by [WidgetsApp] are the same as the window that contains the app.

 Widgets whose layouts consume space defined by [viewInsets], [viewPadding],
 or [padding] should enclose their children in secondary MediaQuery
 widgets that reduce those properties by the same amount.
 The [removePadding], [removeViewPadding], and [removeViewInsets] methods are
 useful for this.

 See also:

  * [Scaffold], [SafeArea], [CupertinoTabScaffold], and
    [CupertinoPageScaffold], all of which are informed by [padding],
    [viewPadding], and [viewInsets].

## Members

- **size**: `Size`
  The size of the media in logical pixels (e.g, the size of the screen).

 Logical pixels are roughly the same visual size across devices. Physical
 pixels are the size of the actual hardware pixels on the device. The
 number of physical pixels per logical pixel is described by the
 [devicePixelRatio].

 Prefer using [MediaQuery.sizeOf] over [MediaQuery.of]`.size` to get the
 size, since the former will only notify of changes in [size], while the
 latter will notify for all [MediaQueryData] changes.

 For widgets drawn in an [Overlay], do not assume that the size of the
 [Overlay] is the size of the [MediaQuery]'s size. Nested overlays can have
 different sizes.

 ## Troubleshooting

 It is considered bad practice to cache and later use the size returned by
 `MediaQuery.sizeOf(context)`. It will make the application non-responsive
 and might lead to unexpected behaviors.

 For instance, during startup, especially in release mode, the first
 returned size might be [Size.zero]. The size will be updated when the
 native platform reports the actual resolution. Using [MediaQuery.sizeOf]
 will ensure that when the size changes, any widgets depending on the size
 are automatically rebuilt.

 See the article on [Creating responsive and adaptive
 apps](https://docs.flutter.dev/ui/adaptive-responsive)
 for an introduction.

 See also:

 * [FlutterView.physicalSize], which returns the size of the view in physical pixels.
 * [FlutterView.display], which returns reports display information like size, and refresh rate.
 * [MediaQuery.sizeOf], a method to find and depend on the size defined for
   a [BuildContext].

- **devicePixelRatio**: `double`
  The number of device pixels for each logical pixel. This number might not
 be a power of two. Indeed, it might not even be an integer. For example,
 the Nexus 6 has a device pixel ratio of 3.5.

- **_textScaleFactor**: `double`
- **_textScaler**: `TextScaler`
- **platformBrightness**: `Brightness`
  The current brightness mode of the host platform.

 For example, starting in Android Pie, battery saver mode asks all apps to
 render in a "dark mode".

 Not all platforms necessarily support a concept of brightness mode. Those
 platforms will report [Brightness.light] in this property.

 See also:

  * [MediaQuery.platformBrightnessOf], a method to find and depend on the
    platformBrightness defined for a [BuildContext].

- **viewInsets**: `EdgeInsets`
  The parts of the display that are completely obscured by system UI,
 typically by the device's keyboard.

 When a mobile device's keyboard is visible `viewInsets.bottom`
 corresponds to the top of the keyboard.

 This value is independent of the [padding] and [viewPadding]. viewPadding
 is measured from the edges of the [MediaQuery] widget's bounds. Padding is
 calculated based on the viewPadding and viewInsets. The bounds of the top
 level MediaQuery created by [WidgetsApp] are the same as the window
 (often the mobile device screen) that contains the app.

 

 See also:

  * [FlutterView], which provides some additional detail about this property
    and how it relates to [padding] and [viewPadding].

- **padding**: `EdgeInsets`
  The parts of the display that are partially obscured by system UI,
 typically by the hardware display "notches" or the system status bar.

 If you consumed this padding (e.g. by building a widget that envelops or
 accounts for this padding in its layout in such a way that children are
 no longer exposed to this padding), you should remove this padding
 for subsequent descendants in the widget tree by inserting a new
 [MediaQuery] widget using the [MediaQuery.removePadding] factory.

 Padding is derived from the values of [viewInsets] and [viewPadding].

 

 See also:

  * [FlutterView], which provides some additional detail about this
    property and how it relates to [viewInsets] and [viewPadding].
  * [SafeArea], a widget that consumes this padding with a [Padding] widget
    and automatically removes it from the [MediaQuery] for its child.

- **viewPadding**: `EdgeInsets`
  The parts of the display that are partially obscured by system UI,
 typically by the hardware display "notches" or the system status bar.

 This value remains the same regardless of whether the system is reporting
 other obstructions in the same physical area of the screen. For example, a
 software keyboard on the bottom of the screen that may cover and consume
 the same area that requires bottom padding will not affect this value.

 This value is independent of the [padding] and [viewInsets]: their values
 are measured from the edges of the [MediaQuery] widget's bounds. The
 bounds of the top level MediaQuery created by [WidgetsApp] are the
 same as the window that contains the app. On mobile devices, this will
 typically be the full screen.

 

 See also:

  * [FlutterView], which provides some additional detail about this
    property and how it relates to [padding] and [viewInsets].

- **systemGestureInsets**: `EdgeInsets`
  The areas along the edges of the display where the system consumes
 certain input events and blocks delivery of those events to the app.

 Starting with Android Q, simple swipe gestures that start within the
 [systemGestureInsets] areas are used by the system for page navigation
 and may not be delivered to the app. Taps and swipe gestures that begin
 with a long-press are delivered to the app, but simple press-drag-release
 swipe gestures which begin within the area defined by [systemGestureInsets]
 may not be.

 Apps should avoid locating gesture detectors within the system gesture
 insets area. Apps should feel free to put visual elements within
 this area.

 This property is currently only expected to be set to a non-default value
 on Android starting with version Q.

 
 For apps that might be deployed on Android Q devices with full gesture
 navigation enabled, use [systemGestureInsets] with [Padding]
 to avoid having the left and right edges of the [Slider] from appearing
 within the area reserved for system gesture navigation.

 By default, [Slider]s expand to fill the available width. So, we pad the
 left and right sides.

 ** See code in examples/api/lib/widgets/media_query/media_query_data.system_gesture_insets.0.dart **
 

- **alwaysUse24HourFormat**: `bool`
  Whether to use 24-hour format when formatting time.

 The behavior of this flag is different across platforms:

 - On Android this flag is reported directly from the user settings called
   "Use 24-hour format". It applies to any locale used by the application,
   whether it is the system-wide locale, or the custom locale set by the
   application.
 - On iOS this flag is set to true when the user setting called "24-Hour
   Time" is set or the system-wide locale's default uses 24-hour
   formatting.

- **accessibleNavigation**: `bool`
  Whether the user is using an accessibility service like TalkBack or
 VoiceOver to interact with the application.

 When this setting is true, features such as timeouts should be disabled or
 have minimum durations increased.

 See also:

  * [dart:ui.PlatformDispatcher.accessibilityFeatures], where the setting originates.

- **invertColors**: `bool`
  Whether the device is inverting the colors of the platform.

 This flag is currently only updated on iOS devices.

 See also:

  * [dart:ui.PlatformDispatcher.accessibilityFeatures], where the setting
    originates.

- **highContrast**: `bool`
  Whether the user requested a high contrast between foreground and background
 content on iOS, via Settings -> Accessibility -> Increase Contrast.

 This flag is currently only updated on iOS devices that are running iOS 13
 or above.

- **onOffSwitchLabels**: `bool`
  Whether the user requested to show on/off labels inside switches on iOS,
 via Settings -> Accessibility -> Display & Text Size -> On/Off Labels.

 See also:

  * [dart:ui.PlatformDispatcher.accessibilityFeatures], where the setting
    originates.

- **disableAnimations**: `bool`
  Whether the platform is requesting that animations be disabled or reduced
 as much as possible.

 See also:

  * [dart:ui.PlatformDispatcher.accessibilityFeatures], where the setting
    originates.

- **boldText**: `bool`
  Whether the platform is requesting that text be drawn with a bold font
 weight.

 See also:

  * [dart:ui.PlatformDispatcher.accessibilityFeatures], where the setting
    originates.

- **navigationMode**: `NavigationMode`
  Describes the navigation mode requested by the platform.

 Some user interfaces are better navigated using a directional pad (DPAD)
 or arrow keys, and for those interfaces, some widgets need to handle these
 directional events differently. In order to know when to do that, these
 widgets will look for the navigation mode in effect for their context.

 For instance, in a television interface, [NavigationMode.directional]
 should be set, so that directional navigation is used to navigate away
 from a text field using the DPAD. In contrast, on a regular desktop
 application with the [navigationMode] set to [NavigationMode.traditional],
 the arrow keys are used to move the cursor instead of navigating away.

 The [NavigationMode] values indicate the type of navigation to be used in
 a widget subtree for those widgets sensitive to it.

- **gestureSettings**: `DeviceGestureSettings`
  The gesture settings for the view this media query is derived from.

 This contains platform specific configuration for gesture behavior,
 such as touch slop. These settings should be favored for configuring
 gesture behavior over the framework constants.

- **displayFeatures**: `List<ui.DisplayFeature>`
  

 See also:

  * [dart:ui.DisplayFeatureType], which lists the different types of
  display features and explains the differences between them.
  * [dart:ui.DisplayFeatureState], which lists the possible states for
  folding features ([dart:ui.DisplayFeatureType.fold] and
  [dart:ui.DisplayFeatureType.hinge]).

- **supportsShowingSystemContextMenu**: `bool`
  Whether showing the system context menu is supported.

 For example, on iOS 16.0 and above, the system text selection context menu
 may be shown instead of the Flutter-drawn context menu in order to avoid
 the iOS clipboard access notification when the "Paste" button is pressed.

 See also:

  * [SystemContextMenuController] and [SystemContextMenu], which may be
    used to show the system context menu when this flag indicates it's
    supported.

## Constructors

### Unnamed Constructor
Creates data for a media query with explicit values.

 In a typical application, calling this constructor directly is rarely
 needed. Consider using [MediaQueryData.fromView] to create data based on a
 [dart:ui.FlutterView], or [MediaQueryData.copyWith] to create a new copy
 of [MediaQueryData] with updated properties from a base [MediaQueryData].

### fromWindow
Deprecated. Use [MediaQueryData.fromView] instead.

 This constructor was operating on a single window assumption. In
 preparation for Flutter's upcoming multi-window support, it has been
 deprecated.

#### Parameters

- `window`: `ui.FlutterView`
### fromView
Creates data for a [MediaQuery] based on the given `view`.

 If provided, the `platformData` is used to fill in the platform-specific
 aspects of the newly created [MediaQueryData]. If `platformData` is null,
 the `view`'s [PlatformDispatcher] is consulted to construct the
 platform-specific data.

 Data which is exposed directly on the [FlutterView] is considered
 view-specific. Data which is only exposed via the
 [FlutterView.platformDispatcher] property is considered platform-specific.

 Callers of this method should ensure that they also register for
 notifications so that the [MediaQueryData] can be updated when any data
 used to construct it changes. Notifications to consider are:

  * [WidgetsBindingObserver.didChangeMetrics] or
    [dart:ui.PlatformDispatcher.onMetricsChanged],
  * [WidgetsBindingObserver.didChangeAccessibilityFeatures] or
    [dart:ui.PlatformDispatcher.onAccessibilityFeaturesChanged],
  * [WidgetsBindingObserver.didChangeTextScaleFactor] or
    [dart:ui.PlatformDispatcher.onTextScaleFactorChanged],
  * [WidgetsBindingObserver.didChangePlatformBrightness] or
    [dart:ui.PlatformDispatcher.onPlatformBrightnessChanged].

 The last three notifications are only relevant if no `platformData` is
 provided. If `platformData` is provided, callers should ensure to call
 this method again when it changes to keep the constructed [MediaQueryData]
 updated.

 In general, [MediaQuery.of], and its associated "...Of" methods, are the
 appropriate way to obtain [MediaQueryData] from a widget. This `fromView`
 constructor is primarily for use in the implementation of the framework
 itself.

 See also:

  * [MediaQuery.fromView], which constructs [MediaQueryData] from a provided
    [FlutterView], makes it available to descendant widgets, and sets up
    the appropriate notification listeners to keep the data updated.

#### Parameters

- `view`: `ui.FlutterView`
- ``: `dynamic`
