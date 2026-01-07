# Overview for `Scaffold`

## Description

Implements the basic Material Design visual layout structure.

 This class provides APIs for showing drawers and bottom sheets.

 To display a persistent bottom sheet, obtain the
 [ScaffoldState] for the current [BuildContext] via [Scaffold.of] and use the
 [ScaffoldState.showBottomSheet] function.

 
 This example shows a [Scaffold] with a [body] and [FloatingActionButton].
 The [body] is a [Text] placed in a [Center] in order to center the text
 within the [Scaffold]. The [FloatingActionButton] is connected to a
 callback that increments a counter.

 ** See code in examples/api/lib/material/scaffold/scaffold.0.dart **
 

 
 This example shows a [Scaffold] with a blueGrey [backgroundColor], [body]
 and [FloatingActionButton]. The [body] is a [Text] placed in a [Center] in
 order to center the text within the [Scaffold]. The [FloatingActionButton]
 is connected to a callback that increments a counter.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/scaffold_background_color.png)

 ** See code in examples/api/lib/material/scaffold/scaffold.1.dart **
 

 
 This example shows a [Scaffold] with an [AppBar], a [BottomAppBar] and a
 [FloatingActionButton]. The [body] is a [Text] placed in a [Center] in order
 to center the text within the [Scaffold]. The [FloatingActionButton] is
 centered and docked within the [BottomAppBar] using
 [FloatingActionButtonLocation.centerDocked]. The [FloatingActionButton] is
 connected to a callback that increments a counter.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/scaffold_bottom_app_bar.png)

 ** See code in examples/api/lib/material/scaffold/scaffold.2.dart **
 

 ## Scaffold layout, the keyboard, and display "notches"

 The scaffold will expand to fill the available space. That usually
 means that it will occupy its entire window or device screen. When
 the device's keyboard appears the Scaffold's ancestor [MediaQuery]
 widget's [MediaQueryData.viewInsets] changes and the Scaffold will
 be rebuilt. By default the scaffold's [body] is resized to make
 room for the keyboard. To prevent the resize set
 [resizeToAvoidBottomInset] to false. In either case the focused
 widget will be scrolled into view if it's within a scrollable
 container.

 The [MediaQueryData.padding] value defines areas that might
 not be completely visible, like the display "notch" on the iPhone
 X. The scaffold's [body] is not inset by this padding value
 although an [appBar] or [bottomNavigationBar] will typically
 cause the body to avoid the padding. The [SafeArea]
 widget can be used within the scaffold's body to avoid areas
 like display notches.

 ## Floating action button with a draggable scrollable bottom sheet

 If [Scaffold.bottomSheet] is a [DraggableScrollableSheet],
 [Scaffold.floatingActionButton] is set, and the bottom sheet is dragged to
 cover greater than 70% of the Scaffold's height, two things happen in parallel:

   * Scaffold starts to show scrim (see [ScaffoldState.showBodyScrim]), and
   * [Scaffold.floatingActionButton] is scaled down through an animation with a [Curves.easeIn], and
     disappears when the bottom sheet covers the entire Scaffold.

 And as soon as the bottom sheet is dragged down to cover less than 70% of the [Scaffold], the scrim
 disappears and [Scaffold.floatingActionButton] animates back to its normal size.

 ## Troubleshooting

 ### Nested Scaffolds

 The Scaffold is designed to be a top level container for
 a [MaterialApp]. This means that adding a Scaffold
 to each route on a Material app will provide the app with
 Material's basic visual layout structure.

 It is typically not necessary to nest Scaffolds. For example, in a
 tabbed UI, where the [bottomNavigationBar] is a [TabBar]
 and the body is a [TabBarView], you might be tempted to make each tab bar
 view a scaffold with a differently titled AppBar. Rather, it would be
 better to add a listener to the [TabController] that updates the
 AppBar

 
 Add a listener to the app's tab controller so that the [AppBar] title of the
 app's one and only scaffold is reset each time a new tab is selected.

 ```dart
 TabController(vsync: tickerProvider, length: tabCount)..addListener( )
 ```
 

 Although there are some use cases, like a presentation app that
 shows embedded flutter content, where nested scaffolds are
 appropriate, it's best to avoid nesting scaffolds.

 See also:

  * [AppBar], which is a horizontal bar typically shown at the top of an app
    using the [appBar] property.
  * [BottomAppBar], which is a horizontal bar typically shown at the bottom
    of an app using the [bottomNavigationBar] property.
  * [FloatingActionButton], which is a circular button typically shown in the
    bottom right corner of the app using the [floatingActionButton] property.
  * [Drawer], which is a vertical panel that is typically displayed to the
    left of the body (and often hidden on phones) using the [drawer]
    property.
  * [BottomNavigationBar], which is a horizontal array of buttons typically
    shown along the bottom of the app using the [bottomNavigationBar]
    property.
  * [BottomSheet], which is an overlay typically shown near the bottom of the
    app. A bottom sheet can either be persistent, in which case it is shown
    using the [ScaffoldState.showBottomSheet] method, or modal, in which case
    it is shown using the [showModalBottomSheet] function.
  * [SnackBar], which is a lightweight message with an optional action which
    briefly displays at the bottom of the screen. Use the
    [ScaffoldMessengerState.showSnackBar] method to show snack bars.
  * [MaterialBanner], which displays an important, succinct message, at the
    top of the screen, below the app bar. Use the
    [ScaffoldMessengerState.showMaterialBanner] method to show material banners.
  * [ScaffoldState], which is the state associated with this widget.
  * <https://material.io/design/layout/responsive-layout-grid.html>
  * Cookbook: [Add a Drawer to a screen](https://docs.flutter.dev/cookbook/design/drawer)

## Dependencies

- StatefulWidget

## Members

- **extendBody**: `bool`
  If true, and [bottomNavigationBar] or [persistentFooterButtons]
 is specified, then the [body] extends to the bottom of the Scaffold,
 instead of only extending to the top of the [bottomNavigationBar]
 or the [persistentFooterButtons].

 If true, a [MediaQuery] widget whose bottom padding matches the height
 of the [bottomNavigationBar] will be added above the scaffold's [body].

 This property is often useful when the [bottomNavigationBar] has
 a non-rectangular shape, like [CircularNotchedRectangle], which
 adds a [FloatingActionButton] sized notch to the top edge of the bar.
 In this case specifying `extendBody: true` ensures that scaffold's
 body will be visible through the bottom navigation bar's notch.

 See also:

  * [extendBodyBehindAppBar], which extends the height of the body
    to the top of the scaffold.

- **extendBodyBehindAppBar**: `bool`
  If true, and an [appBar] is specified, then the height of the [body] is
 extended to include the height of the app bar and the top of the body
 is aligned with the top of the app bar.

 This is useful if the app bar's [AppBar.backgroundColor] is not
 completely opaque.

 This property is false by default.

 See also:

  * [extendBody], which extends the height of the body to the bottom
    of the scaffold.

- **appBar**: `PreferredSizeWidget?`
  An app bar to display at the top of the scaffold.

- **body**: `Widget?`
  The primary content of the scaffold.

 Displayed below the [appBar], above the bottom of the ambient
 [MediaQuery]'s [MediaQueryData.viewInsets], and behind the
 [floatingActionButton] and [drawer]. If [resizeToAvoidBottomInset] is
 false then the body is not resized when the onscreen keyboard appears,
 i.e. it is not inset by `viewInsets.bottom`.

 The widget in the body of the scaffold is positioned at the top-left of
 the available space between the app bar and the bottom of the scaffold. To
 center this widget instead, consider putting it in a [Center] widget and
 having that be the body. To expand this widget instead, consider
 putting it in a [SizedBox.expand].

 If you have a column of widgets that should normally fit on the screen,
 but may overflow and would in such cases need to scroll, consider using a
 [ListView] as the body of the scaffold. This is also a good choice for
 the case where your body is a scrollable list.

- **floatingActionButton**: `Widget?`
  A button displayed floating above [body], in the bottom right corner.

 Typically a [FloatingActionButton].

- **floatingActionButtonLocation**: `FloatingActionButtonLocation?`
  Responsible for determining where the [floatingActionButton] should go.

 If null, the [ScaffoldState] will use the default location, [FloatingActionButtonLocation.endFloat].

- **floatingActionButtonAnimator**: `FloatingActionButtonAnimator?`
  Animator to move the [floatingActionButton] to a new [floatingActionButtonLocation].

 If null, the [ScaffoldState] will use the default animator, [FloatingActionButtonAnimator.scaling].

- **persistentFooterButtons**: `List&lt;Widget&gt;?`
  A set of buttons that are displayed at the bottom of the scaffold.

 Typically this is a list of [TextButton] widgets. These buttons are
 persistently visible, even if the [body] of the scaffold scrolls.

 These widgets will be wrapped in an [OverflowBar].

 The [persistentFooterButtons] are rendered above the
 [bottomNavigationBar] but below the [body].

- **persistentFooterAlignment**: `AlignmentDirectional`
  The alignment of the [persistentFooterButtons] inside the [OverflowBar].

 Defaults to [AlignmentDirectional.centerEnd].

- **drawer**: `Widget?`
  A panel displayed to the side of the [body], often hidden on mobile
 devices. Swipes in from either left-to-right ([TextDirection.ltr]) or
 right-to-left ([TextDirection.rtl])

 Typically a [Drawer].

 To open the drawer, use the [ScaffoldState.openDrawer] function.

 To close the drawer, use either [ScaffoldState.closeDrawer], [Navigator.pop]
 or press the escape key on the keyboard.

 
 To disable the drawer edge swipe on mobile, set the
 [Scaffold.drawerEnableOpenDragGesture] to false. Then, use
 [ScaffoldState.openDrawer] to open the drawer and [Navigator.pop] to close
 it.

 ** See code in examples/api/lib/material/scaffold/scaffold.drawer.0.dart **
 

- **onDrawerChanged**: `DrawerCallback?`
  Optional callback that is called when the [Scaffold.drawer] is opened or closed.

- **endDrawer**: `Widget?`
  A panel displayed to the side of the [body], often hidden on mobile
 devices. Swipes in from right-to-left ([TextDirection.ltr]) or
 left-to-right ([TextDirection.rtl])

 Typically a [Drawer].

 To open the drawer, use the [ScaffoldState.openEndDrawer] function.

 To close the drawer, use either [ScaffoldState.closeEndDrawer], [Navigator.pop]
 or press the escape key on the keyboard.

 
 To disable the drawer edge swipe, set the
 [Scaffold.endDrawerEnableOpenDragGesture] to false. Then, use
 [ScaffoldState.openEndDrawer] to open the drawer and [Navigator.pop] to
 close it.

 ** See code in examples/api/lib/material/scaffold/scaffold.end_drawer.0.dart **
 

- **onEndDrawerChanged**: `DrawerCallback?`
  Optional callback that is called when the [Scaffold.endDrawer] is opened or closed.

- **drawerScrimColor**: `Color?`
  The color to use for the scrim that obscures primary content while a drawer is open.

 If this is null, then [DrawerThemeData.scrimColor] is used. If that
 is also null, then it defaults to [Colors.black54].

- **backgroundColor**: `Color?`
  The color of the [Material] widget that underlies the entire Scaffold.

 The theme's [ThemeData.scaffoldBackgroundColor] by default.

- **bottomNavigationBar**: `Widget?`
  A bottom navigation bar to display at the bottom of the scaffold.

 Snack bars slide from underneath the bottom navigation bar while bottom
 sheets are stacked on top.

 The [bottomNavigationBar] is rendered below the [persistentFooterButtons]
 and the [body].

- **bottomSheet**: `Widget?`
  The persistent bottom sheet to display.

 A persistent bottom sheet shows information that supplements the primary
 content of the app. A persistent bottom sheet remains visible even when
 the user interacts with other parts of the app.

 A closely related widget is a modal bottom sheet, which is an alternative
 to a menu or a dialog and prevents the user from interacting with the rest
 of the app. Modal bottom sheets can be created and displayed with the
 [showModalBottomSheet] function.

 Unlike the persistent bottom sheet displayed by [showBottomSheet]
 this bottom sheet is not a [LocalHistoryEntry] and cannot be dismissed
 with the scaffold appbar's back button.

 If a persistent bottom sheet created with [showBottomSheet] is already
 visible, it must be closed before building the Scaffold with a new
 [bottomSheet].

 The value of [bottomSheet] can be any widget at all. It's unlikely to
 actually be a [BottomSheet], which is used by the implementations of
 [showBottomSheet] and [showModalBottomSheet]. Typically it's a widget
 that includes [Material].

 See also:

  * [showBottomSheet], which displays a bottom sheet as a route that can
    be dismissed with the scaffold's back button.
  * [showModalBottomSheet], which displays a modal bottom sheet.
  * [BottomSheetThemeData], which can be used to customize the default
    bottom sheet property values when using a [BottomSheet].

- **resizeToAvoidBottomInset**: `bool?`
  If true the [body] and the scaffold's floating widgets should size
 themselves to avoid the onscreen keyboard whose height is defined by the
 ambient [MediaQuery]'s [MediaQueryData.viewInsets] `bottom` property.

 For example, if there is an onscreen keyboard displayed above the
 scaffold, the body can be resized to avoid overlapping the keyboard, which
 prevents widgets inside the body from being obscured by the keyboard.

 Defaults to true.

- **primary**: `bool`
  Whether this scaffold is being displayed at the top of the screen.

 If true then the height of the [appBar] will be extended by the height
 of the screen's status bar, i.e. the top padding for [MediaQuery].

 The default value of this property, like the default value of
 [AppBar.primary], is true.

- **drawerDragStartBehavior**: `DragStartBehavior`
  

- **drawerEdgeDragWidth**: `double?`
  The width of the area within which a horizontal swipe will open the
 drawer.

 By default, the value used is 20.0 added to the padding edge of
 `MediaQuery.paddingOf(context)` that corresponds to the surrounding
 [TextDirection]. This ensures that the drag area for notched devices is
 not obscured. For example, if `TextDirection.of(context)` is set to
 [TextDirection.ltr], 20.0 will be added to
 `MediaQuery.paddingOf(context).left`.

- **drawerEnableOpenDragGesture**: `bool`
  Determines if the [Scaffold.drawer] can be opened with a drag
 gesture on mobile.

 On desktop platforms, the drawer is not draggable.

 By default, the drag gesture is enabled on mobile.

- **endDrawerEnableOpenDragGesture**: `bool`
  Determines if the [Scaffold.endDrawer] can be opened with a
 gesture on mobile.

 On desktop platforms, the drawer is not draggable.

 By default, the drag gesture is enabled on mobile.

- **restorationId**: `String?`
  Restoration ID to save and restore the state of the [Scaffold].

 If it is non-null, the scaffold will persist and restore whether the
 [drawer] and [endDrawer] was open or closed.

 The state of this widget is persisted in a [RestorationBucket] claimed
 from the surrounding [RestorationScope] using the provided restoration ID.

 See also:

  * [RestorationManager], which explains how state restoration works in
    Flutter.

## Constructors

### Unnamed Constructor
Creates a visual scaffold for Material Design widgets.

