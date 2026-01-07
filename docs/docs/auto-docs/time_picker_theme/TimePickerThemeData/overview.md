# Overview for `TimePickerThemeData`

## Description

Defines the visual properties of the widget displayed with [showTimePicker].

 Descendant widgets obtain the current [TimePickerThemeData] object using
 `TimePickerTheme.of(context)`. Instances of [TimePickerThemeData]
 can be customized with [TimePickerThemeData.copyWith].

 Typically a [TimePickerThemeData] is specified as part of the overall
 [Theme] with [ThemeData.timePickerTheme].

 All [TimePickerThemeData] properties are `null` by default. When null,
 [showTimePicker] will provide its own defaults.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.
  * [TimePickerTheme], which describes the actual configuration of a time
    picker theme.

## Dependencies

- Diagnosticable

## Members

- **backgroundColor**: `Color?`
  The background color of a time picker.

 If this is null, the time picker defaults to the overall theme's
 [ColorScheme.surfaceContainerHigh].

- **cancelButtonStyle**: `ButtonStyle?`
  The style of the cancel button of a [TimePickerDialog].

- **confirmButtonStyle**: `ButtonStyle?`
  The style of the confirm (OK) button of a [TimePickerDialog].

- **dayPeriodBorderSide**: `BorderSide?`
  The color and weight of the day period's outline.

 If this is null, the time picker defaults to:

 ```dart
 BorderSide(
   color: Color.alphaBlend(
     Theme.of(context).colorScheme.onSurface.withOpacity(0.38),
     Theme.of(context).colorScheme.surface,
   ),
 ),
 ```

- **_dayPeriodColor**: `Color?`
- **dayPeriodShape**: `OutlinedBorder?`
  The shape of the day period that the time picker uses.

 If this is null, the time picker defaults to:

 ```dart
 const RoundedRectangleBorder(
   borderRadius: BorderRadius.all(Radius.circular(4.0)),
   side: ,
 )
 ```

- **dayPeriodTextColor**: `Color?`
  The color of the day period text that represents AM/PM.

 If [dayPeriodTextColor] is a [WidgetStateColor], then the effective
 text color can depend on the [WidgetState.selected] state, i.e. if the
 text is selected or not.

 By default the overall theme's [ColorScheme.primary] color is used when
 the text is selected and `ColorScheme.onSurface.withOpacity(0.60)` when
 it's not selected.

- **dayPeriodTextStyle**: `TextStyle?`
  Used to configure the [TextStyle]s for the day period control.

 If this is null, the time picker defaults to the overall theme's
 [TextTheme.titleMedium].

- **dialBackgroundColor**: `Color?`
  The background color of the time picker dial when the entry mode is
 [TimePickerEntryMode.dial] or [TimePickerEntryMode.dialOnly].

 If this is null and [ThemeData.useMaterial3] is true, the time picker
 dial background color defaults [ColorScheme.surfaceContainerHighest] color.

 If this is null and [ThemeData.useMaterial3] is false, the time picker
 dial background color defaults to [ColorScheme.onSurface] color with
 an opacity of 0.08 when the overall theme's brightness is [Brightness.light]
 and [ColorScheme.onSurface] color with an opacity of 0.12 when the overall
 theme's brightness is [Brightness.dark].

- **dialHandColor**: `Color?`
  The color of the time picker dial's hand when the entry mode is
 [TimePickerEntryMode.dial] or [TimePickerEntryMode.dialOnly].

 If this is null, the time picker defaults to the overall theme's
 [ColorScheme.primary].

- **dialTextColor**: `Color?`
  The color of the dial text that represents specific hours and minutes.

 If [dialTextColor] is a [WidgetStateColor], then the effective
 text color can depend on the [WidgetState.selected] state, i.e. if the
 text is selected or not.

 If this color is null then the dial's text colors are based on the
 theme's [ThemeData.colorScheme].

- **dialTextStyle**: `TextStyle?`
  The [TextStyle] for the numbers on the time selection dial.

 If [dialTextStyle]'s [TextStyle.color] is a [WidgetStateColor], then the
 effective text color can depend on the [WidgetState.selected] state,
 i.e. if the text is selected or not.

 If this style is null then the dial's text style is based on the theme's
 [ThemeData.textTheme].

- **elevation**: `double?`
  The Material elevation for the time picker dialog.

- **entryModeIconColor**: `Color?`
  The color of the entry mode [IconButton].

 If this is null, the time picker defaults to:


 ```dart
 Theme.of(context).colorScheme.onSurface.withOpacity(
   Theme.of(context).colorScheme.brightness == Brightness.dark ? 1.0 : 0.6,
 )
 ```

- **helpTextStyle**: `TextStyle?`
  Used to configure the [TextStyle]s for the helper text in the header.

 If this is null, the time picker defaults to the overall theme's
 [TextTheme.labelSmall].

- **hourMinuteColor**: `Color?`
  The background color of the hour and minute header segments.

 If [hourMinuteColor] is a [WidgetStateColor], then the effective
 background color can depend on the [WidgetState.selected] state, i.e.
 if the segment is selected or not.

 By default, if the segment is selected, the overall theme's
 `ColorScheme.primary.withOpacity(0.12)` is used when the overall theme's
 brightness is [Brightness.light] and
 `ColorScheme.primary.withOpacity(0.24)` is used when the overall theme's
 brightness is [Brightness.dark].
 If the segment is not selected, the overall theme's
 `ColorScheme.onSurface.withOpacity(0.12)` is used.

- **hourMinuteShape**: `ShapeBorder?`
  The shape of the hour and minute controls that the time picker uses.

 If this is null, the time picker defaults to
 `RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)))`.

- **hourMinuteTextColor**: `Color?`
  The color of the header text that represents hours and minutes.

 If [hourMinuteTextColor] is a [WidgetStateColor], then the effective
 text color can depend on the [WidgetState.selected] state, i.e. if the
 text is selected or not.

 By default the overall theme's [ColorScheme.primary] color is used when
 the text is selected and [ColorScheme.onSurface] when it's not selected.

- **hourMinuteTextStyle**: `TextStyle?`
  Used to configure the [TextStyle]s for the hour/minute controls.

 If this is null and entry mode is [TimePickerEntryMode.dial], the time
 picker defaults to the overall theme's [TextTheme.displayLarge] with
 the value of [hourMinuteTextColor].

 If this is null and entry mode is [TimePickerEntryMode.input], the time
 picker defaults to the overall theme's [TextTheme.displayMedium] with
 the value of [hourMinuteTextColor].

 If this is null and [ThemeData.useMaterial3] is false, the time picker
 defaults to the overall theme's [TextTheme.displayMedium].

- **inputDecorationTheme**: `InputDecorationTheme?`
  The input decoration theme for the [TextField]s in the time picker.

 If this is null, the time picker provides its own defaults.

- **padding**: `EdgeInsetsGeometry?`
  The padding around the time picker dialog when the entry mode is
 [TimePickerEntryMode.dial] or [TimePickerEntryMode.dialOnly].

- **shape**: `ShapeBorder?`
  The shape of the [Dialog] that the time picker is presented in.

 If this is null, the time picker defaults to
 `RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)))`.

- **timeSelectorSeparatorColor**: `MaterialStateProperty<Color?>?`
  The color of the time selector separator between the hour and minute controls.

 if this is null, the time picker defaults to the overall theme's
 [ColorScheme.onSurface].

 If this is null and [ThemeData.useMaterial3] is false, then defaults to the value of
 [hourMinuteTextColor].

- **timeSelectorSeparatorTextStyle**: `MaterialStateProperty<TextStyle?>?`
  Used to configure the text style for the time selector separator between the hour
 and minute controls.

 If this is null, the time picker defaults to the overall theme's
 [TextTheme.displayLarge].

 If this is null and [ThemeData.useMaterial3] is false, then defaults to the value of
 [hourMinuteTextStyle].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [TimePickerTheme] or
 [ThemeData.timePickerTheme].

