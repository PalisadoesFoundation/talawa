# Overview for `DatePickerThemeData`

## Description

Overrides the default values of visual properties for descendant
 [DatePickerDialog] widgets.

 Descendant widgets obtain the current [DatePickerThemeData] object with
 [DatePickerTheme.of]. Instances of [DatePickerTheme] can
 be customized with [DatePickerThemeData.copyWith].

 Typically a [DatePickerTheme] is specified as part of the overall
 [Theme] with [ThemeData.datePickerTheme].

 All [DatePickerThemeData] properties are null by default. When null,
 the [DatePickerDialog] computes its own default values, typically based on
 the overall theme's [ThemeData.colorScheme], [ThemeData.textTheme], and
 [ThemeData.iconTheme].

## Dependencies

- Diagnosticable

## Members

- **backgroundColor**: `Color?`
  Overrides the default value of [Dialog.backgroundColor].

- **elevation**: `double?`
  Overrides the default value of [Dialog.elevation].

 See also:
   [Material.elevation], which explains how elevation is related to a component's shadow.

- **shadowColor**: `Color?`
  Overrides the default value of [Dialog.shadowColor].

 See also:
   [Material.shadowColor], which explains how the shadow is rendered.

- **surfaceTintColor**: `Color?`
  Overrides the default value of [Dialog.surfaceTintColor].

 See also:
   [Material.surfaceTintColor], which explains how this color is related to
   [elevation] and [backgroundColor].

- **shape**: `ShapeBorder?`
  Overrides the default value of [Dialog.shape].

 If [elevation] is greater than zero then a shadow is shown and the shadow's
 shape mirrors the shape of the dialog.

- **headerBackgroundColor**: `Color?`
  Overrides the header's default background fill color.

 The dialog's header displays the currently selected date.

- **headerForegroundColor**: `Color?`
  Overrides the header's default color used for text labels and icons.

 The dialog's header displays the currently selected date.

 This is used instead of the [TextStyle.color] property of [headerHeadlineStyle]
 and [headerHelpStyle].

- **headerHeadlineStyle**: `TextStyle?`
  Overrides the header's default headline text style.

 The dialog's header displays the currently selected date.

 The [TextStyle.color] of the [headerHeadlineStyle] is not used,
 [headerForegroundColor] is used instead.

- **headerHelpStyle**: `TextStyle?`
  Overrides the header's default help text style.

 The help text (also referred to as "supporting text" in the Material
 spec) is usually a prompt to the user at the top of the header
 (i.e. 'Select date').

 The [TextStyle.color] of the [headerHelpStyle] is not used,
 [headerForegroundColor] is used instead.

 See also:
   [DatePickerDialog.helpText], which specifies the help text.

- **weekdayStyle**: `TextStyle?`
  Overrides the default text style used for the row of weekday
 labels at the top of the date picker grid.

- **dayStyle**: `TextStyle?`
  Overrides the default text style used for each individual day
 label in the grid of the date picker.

 The [TextStyle.color] of the [dayStyle] is not used,
 [dayForegroundColor] is used instead.

- **dayForegroundColor**: `WidgetStateProperty<Color?>?`
  Overrides the default color used to paint the day labels in the
 grid of the date picker.

 This will be used instead of the color provided in [dayStyle].

- **dayBackgroundColor**: `WidgetStateProperty<Color?>?`
  Overrides the default color used to paint the background of the
 day labels in the grid of the date picker.

- **dayOverlayColor**: `WidgetStateProperty<Color?>?`
  Overrides the default highlight color that's typically used to
 indicate that a day in the grid is focused, hovered, or pressed.

- **dayShape**: `WidgetStateProperty<OutlinedBorder?>?`
  Overrides the default shape used to paint the shape decoration of the
 day labels in the grid of the date picker.

 If the selected day is the current day, the provided shape with the
 value of [todayBackgroundColor] is used to paint the shape decoration of
 the day label and the value of [todayBorder] and [todayForegroundColor] is
 used to paint the border.

 If the selected day is not the current day, the provided shape with the
 value of [dayBackgroundColor] is used to paint the shape decoration of
 the day label.

 
 This sample demonstrates how to customize the day selector shape decoration
 using the [dayShape], [todayForegroundColor], [todayBackgroundColor], and
 [todayBorder] properties.

 ** See code in examples/api/lib/material/date_picker/date_picker_theme_day_shape.0.dart **
 

- **todayForegroundColor**: `WidgetStateProperty<Color?>?`
  Overrides the default color used to paint the
 [DatePickerDialog.currentDate] label in the grid of the dialog's
 [CalendarDatePicker] and the corresponding year in the dialog's
 [YearPicker].

 This will be used instead of the [TextStyle.color] provided in [dayStyle].

 
 This sample demonstrates how to customize the day selector shape decoration
 using the [dayShape], [todayForegroundColor], [todayBackgroundColor], and
 [todayBorder] properties.

 ** See code in examples/api/lib/material/date_picker/date_picker_theme_day_shape.0.dart **
 

- **todayBackgroundColor**: `WidgetStateProperty<Color?>?`
  Overrides the default color used to paint the background of the
 [DatePickerDialog.currentDate] label in the grid of the date picker.

- **todayBorder**: `BorderSide?`
  Overrides the border used to paint the
 [DatePickerDialog.currentDate] label in the grid of the date
 picker.

 The border side's [BorderSide.color] is not used,
 [todayForegroundColor] is used instead.

 
 This sample demonstrates how to customize the day selector shape decoration
 using the [dayShape], [todayForegroundColor], [todayBackgroundColor], and
 [todayBorder] properties.

 ** See code in examples/api/lib/material/date_picker/date_picker_theme_day_shape.0.dart **
 

- **yearStyle**: `TextStyle?`
  Overrides the default text style used to paint each of the year
 entries in the year selector of the date picker.

 The [TextStyle.color] of the [yearStyle] is not used,
 [yearForegroundColor] is used instead.

- **yearForegroundColor**: `WidgetStateProperty<Color?>?`
  Overrides the default color used to paint the year labels in the year
 selector of the date picker.

 This will be used instead of the color provided in [yearStyle].

- **yearBackgroundColor**: `WidgetStateProperty<Color?>?`
  Overrides the default color used to paint the background of the
 year labels in the year selector of the of the date picker.

- **yearOverlayColor**: `WidgetStateProperty<Color?>?`
  Overrides the default highlight color that's typically used to
 indicate that a year in the year selector is focused, hovered,
 or pressed.

- **yearShape**: `WidgetStateProperty<OutlinedBorder?>?`
  Overrides the default shape used to paint the shape decoration of the
 year labels in the list of the year picker.

 If the selected year is the current year, the provided shape with the
 value of [todayBackgroundColor] is used to paint the shape decoration of
 the year label and the value of [todayBorder] and [todayForegroundColor] is
 used to paint the border.

 If the selected year is not the current year, the provided shape with the
 value of [yearBackgroundColor] is used to paint the shape decoration of
 the year label.

- **rangePickerBackgroundColor**: `Color?`
  Overrides the default [Scaffold.backgroundColor] for
 [DateRangePickerDialog].

- **rangePickerElevation**: `double?`
  Overrides the default elevation of the full screen
 [DateRangePickerDialog].

 See also:
   [Material.elevation], which explains how elevation is related to a component's shadow.

- **rangePickerShadowColor**: `Color?`
  Overrides the color of the shadow painted below a full screen
 [DateRangePickerDialog].

 See also:
   [Material.shadowColor], which explains how the shadow is rendered.

- **rangePickerSurfaceTintColor**: `Color?`
  Overrides the default color of the surface tint overlay applied
 to the [backgroundColor] of a full screen
 [DateRangePickerDialog]'s to indicate elevation.

 This is not recommended for use. [Material 3 spec](https://m3.material.io/styles/color/the-color-system/color-roles)
 introduced a set of tone-based surfaces and surface containers in its [ColorScheme],
 which provide more flexibility. The intention is to eventually remove surface tint color from
 the framework.

 See also:
   [Material.surfaceTintColor], which explains how this color is related to
   [elevation].

- **rangePickerShape**: `ShapeBorder?`
  Overrides the default overall shape of a full screen
 [DateRangePickerDialog].

 If [elevation] is greater than zero then a shadow is shown and the shadow's
 shape mirrors the shape of the dialog.

   [Material.surfaceTintColor], which explains how this color is related to
   [elevation].

- **rangePickerHeaderBackgroundColor**: `Color?`
  Overrides the default background fill color for [DateRangePickerDialog].

 The dialog's header displays the currently selected date range.

- **rangePickerHeaderForegroundColor**: `Color?`
  Overrides the default color used for text labels and icons in
 the header of a full screen [DateRangePickerDialog]

 The dialog's header displays the currently selected date range.

 This is used instead of any colors provided by
 [rangePickerHeaderHeadlineStyle] or [rangePickerHeaderHelpStyle].

- **rangePickerHeaderHeadlineStyle**: `TextStyle?`
  Overrides the default text style used for the headline text in
 the header of a full screen [DateRangePickerDialog].

 The dialog's header displays the currently selected date range.

 The [TextStyle.color] of [rangePickerHeaderHeadlineStyle] is not used,
 [rangePickerHeaderForegroundColor] is used instead.

- **rangePickerHeaderHelpStyle**: `TextStyle?`
  Overrides the default text style used for the help text of the
 header of a full screen [DateRangePickerDialog].

 The help text (also referred to as "supporting text" in the Material
 spec) is usually a prompt to the user at the top of the header
 (i.e. 'Select date').

 The [TextStyle.color] of the [rangePickerHeaderHelpStyle] is not used,
 [rangePickerHeaderForegroundColor] is used instead.

 See also:
   [DateRangePickerDialog.helpText], which specifies the help text.

- **rangeSelectionBackgroundColor**: `Color?`
  Overrides the default background color used to paint days
 selected between the start and end dates in a
 [DateRangePickerDialog].

- **rangeSelectionOverlayColor**: `WidgetStateProperty<Color?>?`
  Overrides the default highlight color that's typically used to
 indicate that a date in the selected range of a
 [DateRangePickerDialog] is focused, hovered, or pressed.

- **dividerColor**: `Color?`
  Overrides the default color used to paint the horizontal divider
 below the header text when dialog is in portrait orientation
 and vertical divider when the dialog is in landscape orientation.

- **inputDecorationTheme**: `InputDecorationTheme?`
  Overrides the [InputDatePickerFormField]'s input decoration theme.
 If this is null, [ThemeData.inputDecorationTheme] is used instead.

- **cancelButtonStyle**: `ButtonStyle?`
  Overrides the default style of the cancel button of a [DatePickerDialog].

- **confirmButtonStyle**: `ButtonStyle?`
  Overrides the default style of the confirm (OK) button of a [DatePickerDialog].

- **locale**: `Locale?`
  An optional [locale] argument can be used to set the locale for the date
 picker. It defaults to the ambient locale provided by [Localizations].

## Constructors

### Unnamed Constructor
Creates a [DatePickerThemeData] that can be used to override default properties
 in a [DatePickerTheme] widget.

