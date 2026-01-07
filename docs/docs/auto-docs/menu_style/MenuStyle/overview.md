# Overview for `MenuStyle`

## Description

The visual properties that menus have in common.

 Menus created by [MenuBar] and [MenuAnchor] and their themes have a
 [MenuStyle] property which defines the visual properties whose default
 values are to be overridden. The default values are defined by the
 individual menu widgets and are typically based on overall theme's
 [ThemeData.colorScheme] and [ThemeData.textTheme].

 All of the [MenuStyle] properties are null by default.

 Many of the [MenuStyle] properties are [WidgetStateProperty] objects which
 resolve to different values depending on the menu's state. For example the
 [Color] properties are defined with `WidgetStateProperty&lt;Color&gt;` and can
 resolve to different colors depending on if the menu is pressed, hovered,
 focused, disabled, etc.

 These properties can override the default value for just one state or all of
 them. For example to create a [SubmenuButton] whose background color is the
 color scheme’s primary color with 50% opacity, but only when the menu is
 pressed, one could write:

 ```dart
 SubmenuButton(
   menuStyle: MenuStyle(
     backgroundColor: WidgetStateProperty.resolveWith<Color?>(
       (Set&lt;WidgetState&gt; states) ,
     ),
   ),
   menuChildren: const <Widget>[ /* ... */ ],
   child: const Text('Fly me to the moon'),
 ),
 ```

 In this case the background color for all other menu states would fall back
 to the [SubmenuButton]'s default values. To unconditionally set the menu's
 [backgroundColor] for all states one could write:

 ```dart
 const SubmenuButton(
   menuStyle: MenuStyle(
     backgroundColor: WidgetStatePropertyAll&lt;Color&gt;(Colors.green),
   ),
   menuChildren: <Widget>[ /* ... */ ],
   child: Text('Let me play among the stars'),
 ),
 ```

 To configure all of the application's menus in the same way, specify the
 overall theme's `menuTheme`:

 ```dart
 MaterialApp(
   theme: ThemeData(
     menuTheme: const MenuThemeData(
       style: MenuStyle(backgroundColor: WidgetStatePropertyAll&lt;Color&gt;(Colors.red)),
     ),
   ),
   home: const ,
 ),
 ```

 See also:

 * [MenuAnchor], a widget which hosts cascading menus.
 * [MenuBar], a widget which defines a menu bar of buttons hosting cascading
   menus.
 * [MenuButtonTheme], the theme for [SubmenuButton]s and [MenuItemButton]s.
 * [ButtonStyle], a similar configuration object for button styles.

## Dependencies

- Diagnosticable

## Members

- **backgroundColor**: `MaterialStateProperty<Color?>?`
  The menu's background fill color.

- **shadowColor**: `MaterialStateProperty<Color?>?`
  The shadow color of the menu's [Material].

 The material's elevation shadow can be difficult to see for dark themes,
 so by default the menu classes add a semi-transparent overlay to indicate
 elevation. See [ThemeData.applyElevationOverlayColor].

- **surfaceTintColor**: `MaterialStateProperty<Color?>?`
  The surface tint color of the menu's [Material].

 See [Material.surfaceTintColor] for more details.

- **elevation**: `MaterialStateProperty<double?>?`
  The elevation of the menu's [Material].

- **padding**: `MaterialStateProperty<EdgeInsetsGeometry?>?`
  The padding between the menu's boundary and its child.

- **minimumSize**: `MaterialStateProperty<Size?>?`
  The minimum size of the menu itself.

 This value must be less than or equal to [maximumSize].

- **fixedSize**: `MaterialStateProperty<Size?>?`
  The menu's size.

 This size is still constrained by the style's [minimumSize] and
 [maximumSize]. Fixed size dimensions whose value is [double.infinity] are
 ignored.

 To specify menus with a fixed width and the default height use `fixedSize:
 Size.fromWidth(320)`. Similarly, to specify a fixed height and the default
 width use `fixedSize: Size.fromHeight(100)`.

- **maximumSize**: `MaterialStateProperty<Size?>?`
  The maximum size of the menu itself.

 A [Size.infinite] or null value for this property means that the menu's
 maximum size is not constrained.

 This value must be greater than or equal to [minimumSize].

- **side**: `MaterialStateProperty<BorderSide?>?`
  The color and weight of the menu's outline.

 This value is combined with [shape] to create a shape decorated with an
 outline.

- **shape**: `MaterialStateProperty<OutlinedBorder?>?`
  The shape of the menu's underlying [Material].

 This shape is combined with [side] to create a shape decorated with an
 outline.

- **mouseCursor**: `MaterialStateProperty<MouseCursor?>?`
  The cursor for a mouse pointer when it enters or is hovering over this
 menu's [InkWell].

- **visualDensity**: `VisualDensity?`
  Defines how compact the menu's layout will be.

 

 See also:

  * [ThemeData.visualDensity], which specifies the [visualDensity] for all
    widgets within a [Theme].

- **alignment**: `AlignmentGeometry?`
  Determines the desired alignment of the submenu when opened relative to
 the button that opens it.

 If there isn't sufficient space to open the menu with the given alignment,
 and there's space on the other side of the button, then the alignment is
 swapped to it's opposite (1 becomes -1, etc.), and the menu will try to
 appear on the other side of the button. If there isn't enough space there
 either, then the menu will be pushed as far over as necessary to display
 as much of itself as possible, possibly overlapping the parent button.

## Constructors

### Unnamed Constructor
Create a [MenuStyle].

