# Overview for `FloatingActionButtonLocation`

## Description

An object that defines a position for the [FloatingActionButton]
 based on the [Scaffold]'s [ScaffoldPrelayoutGeometry].

 Flutter provides [FloatingActionButtonLocation]s for the common
 [FloatingActionButton] placements in Material Design applications. These
 locations are available as static members of this class.

 ## Floating Action Button placements

 The following diagrams show the available placement locations for the FloatingActionButton.

 * [FloatingActionButtonLocation.centerDocked]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_center_docked.png)


 * [FloatingActionButtonLocation.centerFloat]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_center_float.png)


 * [FloatingActionButtonLocation.centerTop]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_center_top.png)


 * [FloatingActionButtonLocation.endDocked]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_end_docked.png)


 * [FloatingActionButtonLocation.endFloat]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_end_float.png)


 * [FloatingActionButtonLocation.endTop]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_end_top.png)


 * [FloatingActionButtonLocation.startDocked]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_start_docked.png)


 * [FloatingActionButtonLocation.startFloat]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_start_float.png)


 * [FloatingActionButtonLocation.startTop]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_start_top.png)


 * [FloatingActionButtonLocation.miniCenterDocked]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_center_docked.png)


 * [FloatingActionButtonLocation.miniCenterFloat]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_center_float.png)


 * [FloatingActionButtonLocation.miniCenterTop]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_center_top.png)


 * [FloatingActionButtonLocation.miniEndDocked]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_end_docked.png)


 * [FloatingActionButtonLocation.miniEndFloat]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_end_float.png)


 * [FloatingActionButtonLocation.miniEndTop]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_end_top.png)


 * [FloatingActionButtonLocation.miniStartDocked]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_start_docked.png)


 * [FloatingActionButtonLocation.miniStartFloat]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_start_float.png)


 * [FloatingActionButtonLocation.miniStartTop]:

   ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_start_top.png)


 See also:

  * [FloatingActionButton], which is a circular button typically shown in the
    bottom right corner of the app.
  * [FloatingActionButtonAnimator], which is used to animate the
    [Scaffold.floatingActionButton] from one [FloatingActionButtonLocation] to
    another.
  * [ScaffoldPrelayoutGeometry], the geometry that
    [FloatingActionButtonLocation]s use to position the [FloatingActionButton].

## Members

- **startTop**: `FloatingActionButtonLocation`
  Start-aligned [FloatingActionButton], floating over the transition between
 the [Scaffold.appBar] and the [Scaffold.body].

 To align a floating action button with [CircleAvatar]s in the
 [ListTile.leading] slots of [ListTile]s in a [ListView] in the [Scaffold.body],
 use [miniStartTop] and set [FloatingActionButton.mini] to true.

 This is unlikely to be a useful location for apps that lack a top [AppBar]
 or that use a [SliverAppBar] in the scaffold body itself.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_start_top.png)

- **miniStartTop**: `FloatingActionButtonLocation`
  Start-aligned [FloatingActionButton], floating over the transition between
 the [Scaffold.appBar] and the [Scaffold.body], optimized for mini floating
 action buttons.

 This is intended to be used with [FloatingActionButton.mini] set to true,
 so that the floating action button appears to align with [CircleAvatar]s
 in the [ListTile.leading] slot of a [ListTile] in a [ListView] in the
 [Scaffold.body].

 This is unlikely to be a useful location for apps that lack a top [AppBar]
 or that use a [SliverAppBar] in the scaffold body itself.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_start_top.png)

- **centerTop**: `FloatingActionButtonLocation`
  Centered [FloatingActionButton], floating over the transition between
 the [Scaffold.appBar] and the [Scaffold.body].

 This is unlikely to be a useful location for apps that lack a top [AppBar]
 or that use a [SliverAppBar] in the scaffold body itself.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_center_top.png)

- **miniCenterTop**: `FloatingActionButtonLocation`
  Centered [FloatingActionButton], floating over the transition between
 the [Scaffold.appBar] and the [Scaffold.body], intended to be used with
 [FloatingActionButton.mini] set to true.

 This is unlikely to be a useful location for apps that lack a top [AppBar]
 or that use a [SliverAppBar] in the scaffold body itself.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_center_top.png)

- **endTop**: `FloatingActionButtonLocation`
  End-aligned [FloatingActionButton], floating over the transition between
 the [Scaffold.appBar] and the [Scaffold.body].

 To align a floating action button with [CircleAvatar]s in the
 [ListTile.trailing] slots of [ListTile]s in a [ListView] in the [Scaffold.body],
 use [miniEndTop] and set [FloatingActionButton.mini] to true.

 This is unlikely to be a useful location for apps that lack a top [AppBar]
 or that use a [SliverAppBar] in the scaffold body itself.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_end_top.png)

- **miniEndTop**: `FloatingActionButtonLocation`
  End-aligned [FloatingActionButton], floating over the transition between
 the [Scaffold.appBar] and the [Scaffold.body], optimized for mini floating
 action buttons.

 This is intended to be used with [FloatingActionButton.mini] set to true,
 so that the floating action button appears to align with [CircleAvatar]s
 in the [ListTile.trailing] slot of a [ListTile] in a [ListView] in the
 [Scaffold.body].

 This is unlikely to be a useful location for apps that lack a top [AppBar]
 or that use a [SliverAppBar] in the scaffold body itself.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_end_top.png)

- **startFloat**: `FloatingActionButtonLocation`
  Start-aligned [FloatingActionButton], floating at the bottom of the screen.

 To align a floating action button with [CircleAvatar]s in the
 [ListTile.leading] slots of [ListTile]s in a [ListView] in the [Scaffold.body],
 use [miniStartFloat] and set [FloatingActionButton.mini] to true.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_start_float.png)

- **miniStartFloat**: `FloatingActionButtonLocation`
  Start-aligned [FloatingActionButton], floating at the bottom of the screen,
 optimized for mini floating action buttons.

 This is intended to be used with [FloatingActionButton.mini] set to true,
 so that the floating action button appears to align with [CircleAvatar]s
 in the [ListTile.leading] slot of a [ListTile] in a [ListView] in the
 [Scaffold.body].

 Compared to [FloatingActionButtonLocation.startFloat], floating action
 buttons using this location will move horizontally _and_ vertically
 closer to the edges, by [kMiniButtonOffsetAdjustment] each.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_start_float.png)

- **centerFloat**: `FloatingActionButtonLocation`
  Centered [FloatingActionButton], floating at the bottom of the screen.

 To position a mini floating action button, use [miniCenterFloat] and
 set [FloatingActionButton.mini] to true.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_center_float.png)

- **miniCenterFloat**: `FloatingActionButtonLocation`
  Centered [FloatingActionButton], floating at the bottom of the screen,
 optimized for mini floating action buttons.

 This is intended to be used with [FloatingActionButton.mini] set to true,
 so that the floating action button appears to align horizontally with
 the locations [FloatingActionButtonLocation.miniStartFloat]
 and [FloatingActionButtonLocation.miniEndFloat].

 Compared to [FloatingActionButtonLocation.centerFloat], floating action
 buttons using this location will move vertically down
 by [kMiniButtonOffsetAdjustment].

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_center_float.png)

- **endFloat**: `FloatingActionButtonLocation`
  End-aligned [FloatingActionButton], floating at the bottom of the screen.

 This is the default alignment of [FloatingActionButton]s in Material applications.

 To align a floating action button with [CircleAvatar]s in the
 [ListTile.trailing] slots of [ListTile]s in a [ListView] in the [Scaffold.body],
 use [miniEndFloat] and set [FloatingActionButton.mini] to true.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_end_float.png)

- **miniEndFloat**: `FloatingActionButtonLocation`
  End-aligned [FloatingActionButton], floating at the bottom of the screen,
 optimized for mini floating action buttons.

 This is intended to be used with [FloatingActionButton.mini] set to true,
 so that the floating action button appears to align with [CircleAvatar]s
 in the [ListTile.trailing] slot of a [ListTile] in a [ListView] in the
 [Scaffold.body].

 Compared to [FloatingActionButtonLocation.endFloat], floating action
 buttons using this location will move horizontally _and_ vertically
 closer to the edges, by [kMiniButtonOffsetAdjustment] each.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_end_float.png)

- **startDocked**: `FloatingActionButtonLocation`
  Start-aligned [FloatingActionButton], floating over the
 [Scaffold.bottomNavigationBar] so that the center of the floating
 action button lines up with the top of the bottom navigation bar.

 To align a floating action button with [CircleAvatar]s in the
 [ListTile.leading] slots of [ListTile]s in a [ListView] in the [Scaffold.body],
 use [miniStartDocked] and set [FloatingActionButton.mini] to true.

 If the value of [Scaffold.bottomNavigationBar] is a [BottomAppBar],
 the bottom app bar can include a "notch" in its shape that accommodates
 the overlapping floating action button.

 This is unlikely to be a useful location for apps that lack a bottom
 navigation bar.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_start_docked.png)

- **miniStartDocked**: `FloatingActionButtonLocation`
  Start-aligned [FloatingActionButton], floating over the
 [Scaffold.bottomNavigationBar] so that the center of the floating
 action button lines up with the top of the bottom navigation bar,
 optimized for mini floating action buttons.

 If the value of [Scaffold.bottomNavigationBar] is a [BottomAppBar],
 the bottom app bar can include a "notch" in its shape that accommodates
 the overlapping floating action button.

 This is intended to be used with [FloatingActionButton.mini] set to true,
 so that the floating action button appears to align with [CircleAvatar]s
 in the [ListTile.leading] slot of a [ListTile] in a [ListView] in the
 [Scaffold.body].

 This is unlikely to be a useful location for apps that lack a bottom
 navigation bar.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_start_docked.png)

- **centerDocked**: `FloatingActionButtonLocation`
  Centered [FloatingActionButton], floating over the
 [Scaffold.bottomNavigationBar] so that the center of the floating
 action button lines up with the top of the bottom navigation bar.

 If the value of [Scaffold.bottomNavigationBar] is a [BottomAppBar],
 the bottom app bar can include a "notch" in its shape that accommodates
 the overlapping floating action button.

 This is unlikely to be a useful location for apps that lack a bottom
 navigation bar.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_center_docked.png)

- **miniCenterDocked**: `FloatingActionButtonLocation`
  Centered [FloatingActionButton], floating over the
 [Scaffold.bottomNavigationBar] so that the center of the floating
 action button lines up with the top of the bottom navigation bar;
 intended to be used with [FloatingActionButton.mini] set to true.

 If the value of [Scaffold.bottomNavigationBar] is a [BottomAppBar],
 the bottom app bar can include a "notch" in its shape that accommodates
 the overlapping floating action button.

 This is unlikely to be a useful location for apps that lack a bottom
 navigation bar.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_center_docked.png)

- **endDocked**: `FloatingActionButtonLocation`
  End-aligned [FloatingActionButton], floating over the
 [Scaffold.bottomNavigationBar] so that the center of the floating
 action button lines up with the top of the bottom navigation bar.

 If the value of [Scaffold.bottomNavigationBar] is a [BottomAppBar],
 the bottom app bar can include a "notch" in its shape that accommodates
 the overlapping floating action button.

 This is unlikely to be a useful location for apps that lack a bottom
 navigation bar.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_end_docked.png)

- **miniEndDocked**: `FloatingActionButtonLocation`
  End-aligned [FloatingActionButton], floating over the
 [Scaffold.bottomNavigationBar] so that the center of the floating
 action button lines up with the top of the bottom navigation bar,
 optimized for mini floating action buttons.

 To align a floating action button with [CircleAvatar]s in the
 [ListTile.trailing] slots of [ListTile]s in a [ListView] in the [Scaffold.body],
 use [miniEndDocked] and set [FloatingActionButton.mini] to true.

 If the value of [Scaffold.bottomNavigationBar] is a [BottomAppBar],
 the bottom app bar can include a "notch" in its shape that accommodates
 the overlapping floating action button.

 This is intended to be used with [FloatingActionButton.mini] set to true,
 so that the floating action button appears to align with [CircleAvatar]s
 in the [ListTile.trailing] slot of a [ListTile] in a [ListView] in the
 [Scaffold.body].

 This is unlikely to be a useful location for apps that lack a bottom
 navigation bar.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_mini_end_docked.png)

- **endContained**: `FloatingActionButtonLocation`
  End-aligned [FloatingActionButton], floating over the
 [Scaffold.bottomNavigationBar] so that the floating
 action button lines up with the center of the bottom navigation bar.

 This is unlikely to be a useful location for apps which has a [BottomNavigationBar]
 or a non material 3 [BottomAppBar].

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/floating_action_button_location_end_contained.png)

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

