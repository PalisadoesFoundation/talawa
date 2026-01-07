# Overview for `ActionIconThemeData`

## Description

A [ActionIconThemeData] that overrides the default icons of
 [BackButton], [CloseButton], [DrawerButton], and [EndDrawerButton] with
 [ActionIconTheme.of] or the overall [Theme]'s [ThemeData.actionIconTheme].

## Dependencies

- Diagnosticable

## Members

- **backButtonIconBuilder**: `WidgetBuilder?`
  Overrides [BackButtonIcon]'s icon.

 If [backButtonIconBuilder] is null, then [BackButtonIcon]
 fallbacks to the platform's default back button icon.

- **closeButtonIconBuilder**: `WidgetBuilder?`
  Overrides [CloseButtonIcon]'s icon.

 If [closeButtonIconBuilder] is null, then [CloseButtonIcon]
 fallbacks to the platform's default close button icon.

- **drawerButtonIconBuilder**: `WidgetBuilder?`
  Overrides [DrawerButtonIcon]'s icon.

 If [drawerButtonIconBuilder] is null, then [DrawerButtonIcon]
 fallbacks to the platform's default drawer button icon.

- **endDrawerButtonIconBuilder**: `WidgetBuilder?`
  Overrides [EndDrawerButtonIcon]'s icon.

 If [endDrawerButtonIconBuilder] is null, then [EndDrawerButtonIcon]
 fallbacks to the platform's default end drawer button icon.

## Constructors

### Unnamed Constructor
Creates an [ActionIconThemeData].

 The builders [backButtonIconBuilder], [closeButtonIconBuilder],
 [drawerButtonIconBuilder], [endDrawerButtonIconBuilder] may be null.

