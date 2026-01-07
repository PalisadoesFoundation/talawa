# Overview for `SliverAppBar`

## Description

A Material Design app bar that integrates with a [CustomScrollView].

 An app bar consists of a toolbar and potentially other widgets, such as a
 [TabBar] and a [FlexibleSpaceBar]. App bars typically expose one or more
 common actions with [IconButton]s which are optionally followed by a
 [PopupMenuButton] for less common operations.

 

 Sliver app bars are typically used as the first child of a
 [CustomScrollView], which lets the app bar integrate with the scroll view so
 that it can vary in height according to the scroll offset or float above the
 other content in the scroll view. For a fixed-height app bar at the top of
 the screen see [AppBar], which is used in the [Scaffold.appBar] slot.

 The AppBar displays the toolbar widgets, [leading], [title], and
 [actions], above the [bottom] (if any). If a [flexibleSpace] widget is
 specified then it is stacked behind the toolbar and the bottom widget.

 

 This is an example that could be included in a [CustomScrollView]'s
 [CustomScrollView.slivers] list:

 ```dart
 SliverAppBar(
   expandedHeight: 150.0,
   flexibleSpace: const FlexibleSpaceBar(
     title: Text('Available seats'),
   ),
   actions: <Widget>[
     IconButton(
       icon: const Icon(Icons.add_circle),
       tooltip: 'Add new entry',
       onPressed:  ,
     ),
   ]
 )
 ```
 

 
 Here is an example of [SliverAppBar] when using [stretch] and [onStretchTrigger].

  ** See code in examples/api/lib/material/app_bar/sliver_app_bar.4.dart **
 


 
 This sample shows a [SliverAppBar] and it's behavior when using the
 [pinned], [snap] and [floating] parameters.

 ** See code in examples/api/lib/material/app_bar/sliver_app_bar.1.dart **
 

 ## Animated Examples

 The following animations show how app bars with different configurations
 behave when a user scrolls up and then down again.

 * App bar with [floating]: false, [pinned]: false, [snap]: false:
   

 * App bar with [floating]: true, [pinned]: false, [snap]: false:
   

 * App bar with [floating]: true, [pinned]: false, [snap]: true:
   

 * App bar with [floating]: true, [pinned]: true, [snap]: false:
   

 * App bar with [floating]: true, [pinned]: true, [snap]: true:
   

 * App bar with [floating]: false, [pinned]: true, [snap]: false:
   

 The property [snap] can only be set to true if [floating] is also true.

 See also:

  * [CustomScrollView], which integrates the [SliverAppBar] into its
    scrolling.
  * [AppBar], which is a fixed-height app bar for use in [Scaffold.appBar].
  * [TabBar], which is typically placed in the [bottom] slot of the [AppBar]
    if the screen has multiple pages arranged in tabs.
  * [IconButton], which is used with [actions] to show buttons on the app bar.
  * [PopupMenuButton], to show a popup menu on the app bar, via [actions].
  * [FlexibleSpaceBar], which is used with [flexibleSpace] when the app bar
    can expand and collapse.
  * <https://material.io/design/components/app-bars-top.html>

## Dependencies

- StatefulWidget

## Members

- **leading**: `Widget?`
  

 This property is used to configure an [AppBar].

- **automaticallyImplyLeading**: `bool`
  

 This property is used to configure an [AppBar].

- **title**: `Widget?`
  

 This property is used to configure an [AppBar].

- **actions**: `List&lt;Widget&gt;?`
  

 This property is used to configure an [AppBar].

- **flexibleSpace**: `Widget?`
  

 This property is used to configure an [AppBar].

- **bottom**: `PreferredSizeWidget?`
  

 This property is used to configure an [AppBar].

- **elevation**: `double?`
  

 This property is used to configure an [AppBar].

- **scrolledUnderElevation**: `double?`
  

 This property is used to configure an [AppBar].

- **shadowColor**: `Color?`
  

 This property is used to configure an [AppBar].

- **surfaceTintColor**: `Color?`
  

 This property is used to configure an [AppBar].

- **forceElevated**: `bool`
  Whether to show the shadow appropriate for the [elevation] even if the
 content is not scrolled under the [AppBar].

 Defaults to false, meaning that the [elevation] is only applied when the
 [AppBar] is being displayed over content that is scrolled under it.

 When set to true, the [elevation] is applied regardless.

 Ignored when [elevation] is zero.

- **backgroundColor**: `Color?`
  

 This property is used to configure an [AppBar].

- **foregroundColor**: `Color?`
  

 This property is used to configure an [AppBar].

- **iconTheme**: `IconThemeData?`
  

 This property is used to configure an [AppBar].

- **actionsIconTheme**: `IconThemeData?`
  

 This property is used to configure an [AppBar].

- **primary**: `bool`
  

 This property is used to configure an [AppBar].

- **centerTitle**: `bool?`
  

 This property is used to configure an [AppBar].

- **excludeHeaderSemantics**: `bool`
  

 This property is used to configure an [AppBar].

- **titleSpacing**: `double?`
  

 This property is used to configure an [AppBar].

- **collapsedHeight**: `double?`
  Defines the height of the app bar when it is collapsed.

 By default, the collapsed height is [toolbarHeight]. If [bottom] widget is
 specified, then its height from [PreferredSizeWidget.preferredSize] is
 added to the height. If [primary] is true, then the [MediaQuery] top
 padding, [EdgeInsets.top] of [MediaQueryData.padding], is added as well.

 If [pinned] and [floating] are true, with [bottom] set, the default
 collapsed height is only the height of [PreferredSizeWidget.preferredSize]
 with the [MediaQuery] top padding.

- **expandedHeight**: `double?`
  The size of the app bar when it is fully expanded.

 By default, the total height of the toolbar and the bottom widget (if
 any). If a [flexibleSpace] widget is specified this height should be big
 enough to accommodate whatever that widget contains.

 This does not include the status bar height (which will be automatically
 included if [primary] is true).

- **floating**: `bool`
  Whether the app bar should become visible as soon as the user scrolls
 towards the app bar.

 Otherwise, the user will need to scroll near the top of the scroll view to
 reveal the app bar.

 If [snap] is true then a scroll that exposes the app bar will trigger an
 animation that slides the entire app bar into view. Similarly if a scroll
 dismisses the app bar, the animation will slide it completely out of view.

 ## Animated Examples

 The following animations show how the app bar changes its scrolling
 behavior based on the value of this property.

 * App bar with [floating] set to false:
   
 * App bar with [floating] set to true:
   

 See also:

  * [SliverAppBar] for more animated examples of how this property changes the
    behavior of the app bar in combination with [pinned] and [snap].

- **pinned**: `bool`
  Whether the app bar should remain visible at the start of the scroll view.

 The app bar can still expand and contract as the user scrolls, but it will
 remain visible rather than being scrolled out of view.

 ## Animated Examples

 The following animations show how the app bar changes its scrolling
 behavior based on the value of this property.

 * App bar with [pinned] set to false:
   
 * App bar with [pinned] set to true:
   

 See also:

  * [SliverAppBar] for more animated examples of how this property changes the
    behavior of the app bar in combination with [floating].

- **shape**: `ShapeBorder?`
  

 This property is used to configure an [AppBar].

- **snap**: `bool`
  If [snap] and [floating] are true then the floating app bar will "snap"
 into view.

 If [snap] is true then a scroll that exposes the floating app bar will
 trigger an animation that slides the entire app bar into view. Similarly
 if a scroll dismisses the app bar, the animation will slide the app bar
 completely out of view. Additionally, setting [snap] to true will fully
 expand the floating app bar when the framework tries to reveal the
 contents of the app bar by calling [RenderObject.showOnScreen]. For
 example, when a [TextField] in the floating app bar gains focus, if [snap]
 is true, the framework will always fully expand the floating app bar, in
 order to reveal the focused [TextField].

 Snapping only applies when the app bar is floating, not when the app bar
 appears at the top of its scroll view.

 ## Animated Examples

 The following animations show how the app bar changes its scrolling
 behavior based on the value of this property.

 * App bar with [snap] set to false:
   
 * App bar with [snap] set to true:
   

 See also:

  * [SliverAppBar] for more animated examples of how this property changes the
    behavior of the app bar in combination with [pinned] and [floating].

- **stretch**: `bool`
  Whether the app bar should stretch to fill the over-scroll area.

 The app bar can still expand and contract as the user scrolls, but it will
 also stretch when the user over-scrolls.

- **stretchTriggerOffset**: `double`
  The offset of overscroll required to activate [onStretchTrigger].

 This defaults to 100.0.

- **onStretchTrigger**: `AsyncCallback?`
  The callback function to be executed when a user over-scrolls to the
 offset specified by [stretchTriggerOffset].

- **toolbarHeight**: `double`
  

 This property is used to configure an [AppBar].

- **leadingWidth**: `double?`
  

 This property is used to configure an [AppBar].

- **toolbarTextStyle**: `TextStyle?`
  

 This property is used to configure an [AppBar].

- **titleTextStyle**: `TextStyle?`
  

 This property is used to configure an [AppBar].

- **systemOverlayStyle**: `SystemUiOverlayStyle?`
  

 This property is used to configure an [AppBar].

- **forceMaterialTransparency**: `bool`
  

 This property is used to configure an [AppBar].

- **useDefaultSemanticsOrder**: `bool`
  

 This property is used to configure an [AppBar].

- **clipBehavior**: `Clip?`
  

- **actionsPadding**: `EdgeInsetsGeometry?`
  

 This property is used to configure an [AppBar].

- **_variant**: `_SliverAppVariant`
## Constructors

### Unnamed Constructor
Creates a Material Design app bar that can be placed in a [CustomScrollView].

### medium
Creates a Material Design medium top app bar that can be placed
 in a [CustomScrollView].

 Returns a [SliverAppBar] configured with appropriate defaults
 for a medium top app bar as defined in Material 3. It starts fully
 expanded with the title in an area underneath the main row of icons.
 When the [CustomScrollView] is scrolled, the title will be scrolled
 under the main row. When it is fully collapsed, a smaller version of the
 title will fade in on the main row. The reverse will happen if it is
 expanded again.

 
 This sample shows how to use [SliverAppBar.medium] in a [CustomScrollView].

 ** See code in examples/api/lib/material/app_bar/sliver_app_bar.2.dart **
 

 See also:

   * [AppBar], for a small or center-aligned top app bar.
   * [SliverAppBar.large], for a large top app bar.
   * https://m3.material.io/components/top-app-bar/overview, the Material 3
     app bar specification.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### large
Creates a Material Design large top app bar that can be placed
 in a [CustomScrollView].

 Returns a [SliverAppBar] configured with appropriate defaults
 for a large top app bar as defined in Material 3. It starts fully
 expanded with the title in an area underneath the main row of icons.
 When the [CustomScrollView] is scrolled, the title will be scrolled
 under the main row. When it is fully collapsed, a smaller version of the
 title will fade in on the main row. The reverse will happen if it is
 expanded again.

 
 This sample shows how to use [SliverAppBar.large] in a [CustomScrollView].

 ** See code in examples/api/lib/material/app_bar/sliver_app_bar.3.dart **
 

 See also:

   * [AppBar], for a small or center-aligned top app bar.
   * [SliverAppBar.medium], for a medium top app bar.
   * https://m3.material.io/components/top-app-bar/overview, the Material 3
     app bar specification.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
