# Overview for `BottomNavigationBarThemeData`

## Description

Defines default property values for descendant [BottomNavigationBar]
 widgets.

 Descendant widgets obtain the current [BottomNavigationBarThemeData] object
 using `BottomNavigationBarTheme.of(context)`. Instances of
 [BottomNavigationBarThemeData] can be customized with
 [BottomNavigationBarThemeData.copyWith].

 Typically a [BottomNavigationBarThemeData] is specified as part of the
 overall [Theme] with [ThemeData.bottomNavigationBarTheme].

 All [BottomNavigationBarThemeData] properties are `null` by default. When
 null, the [BottomNavigationBar]'s build method provides defaults.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **backgroundColor**: `Color?`
  The color of the [BottomNavigationBar] itself.

 See [BottomNavigationBar.backgroundColor].

- **elevation**: `double?`
  The z-coordinate of the [BottomNavigationBar].

 See [BottomNavigationBar.elevation].

- **selectedIconTheme**: `IconThemeData?`
  The size, opacity, and color of the icon in the currently selected
 [BottomNavigationBarItem.icon].

 If [BottomNavigationBar.selectedIconTheme] is non-null on the widget,
 the whole [IconThemeData] from the widget will be used over this
 [selectedIconTheme].

 See [BottomNavigationBar.selectedIconTheme].

- **unselectedIconTheme**: `IconThemeData?`
  The size, opacity, and color of the icon in the currently unselected
 [BottomNavigationBarItem.icon]s.

 If [BottomNavigationBar.unselectedIconTheme] is non-null on the widget,
 the whole [IconThemeData] from the widget will be used over this
 [unselectedIconTheme].

 See [BottomNavigationBar.unselectedIconTheme].

- **selectedItemColor**: `Color?`
  The color of the selected [BottomNavigationBarItem.icon] and
 [BottomNavigationBarItem.label].

 See [BottomNavigationBar.selectedItemColor].

- **unselectedItemColor**: `Color?`
  The color of the unselected [BottomNavigationBarItem.icon] and
 [BottomNavigationBarItem.label]s.

 See [BottomNavigationBar.unselectedItemColor].

- **selectedLabelStyle**: `TextStyle?`
  The [TextStyle] of the [BottomNavigationBarItem] labels when they are
 selected.

 See [BottomNavigationBar.selectedLabelStyle].

- **unselectedLabelStyle**: `TextStyle?`
  The [TextStyle] of the [BottomNavigationBarItem] labels when they are not
 selected.

 See [BottomNavigationBar.unselectedLabelStyle].

- **showSelectedLabels**: `bool?`
  Whether the labels are shown for the selected [BottomNavigationBarItem].

 See [BottomNavigationBar.showSelectedLabels].

- **showUnselectedLabels**: `bool?`
  Whether the labels are shown for the unselected [BottomNavigationBarItem]s.

 See [BottomNavigationBar.showUnselectedLabels].

- **type**: `BottomNavigationBarType?`
  Defines the layout and behavior of a [BottomNavigationBar].

 See [BottomNavigationBar.type].

- **enableFeedback**: `bool?`
  If specified, defines the feedback property for [BottomNavigationBar].

 If [BottomNavigationBar.enableFeedback] is provided, [enableFeedback] is ignored.

- **landscapeLayout**: `BottomNavigationBarLandscapeLayout?`
  If non-null, overrides the [BottomNavigationBar.landscapeLayout] property.

- **mouseCursor**: `MaterialStateProperty<MouseCursor?>?`
  If specified, overrides the default value of [BottomNavigationBar.mouseCursor].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.bottomNavigationBarTheme].

