# Overview for `InputDecorationTheme`

## Description

Defines the default appearance of [InputDecorator]s.

 This class is used to define the value of [ThemeData.inputDecorationTheme].
 The [InputDecorator], [TextField], and [TextFormField] widgets use
 the current input decoration theme to initialize null [InputDecoration]
 properties.

 The [InputDecoration.applyDefaults] method is used to combine an input
 decoration theme with an [InputDecoration] object.

## Dependencies

- Diagnosticable

## Members

- **labelStyle**: `TextStyle?`
  

- **floatingLabelStyle**: `TextStyle?`
  

- **helperStyle**: `TextStyle?`
  The style to use for [InputDecoration.helperText].

 If [helperStyle] is a [WidgetStateTextStyle], then the effective
 text style can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

- **helperMaxLines**: `int?`
  The maximum number of lines the [InputDecoration.helperText] can occupy.

 Defaults to null, which means that the [InputDecoration.helperText] will
 be limited to a single line with [TextOverflow.ellipsis].

 This value is passed along to the [Text.maxLines] attribute
 of the [Text] widget used to display the helper.

 See also:

  * [errorMaxLines], the equivalent but for the [InputDecoration.errorText].

- **hintStyle**: `TextStyle?`
  The style to use for the [InputDecoration.hintText].

 If [hintStyle] is a [WidgetStateTextStyle], then the effective
 text style can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

 Also used for the [InputDecoration.labelText] when the
 [InputDecoration.labelText] is displayed on top of the input field (i.e.,
 at the same location on the screen where text may be entered in the input
 field).

 If null, defaults to a value derived from the base [TextStyle] for the
 input field and the current [Theme].

- **hintFadeDuration**: `Duration?`
  The duration of the [InputDecoration.hintText] fade in and fade out animations.

- **errorStyle**: `TextStyle?`
  

- **errorMaxLines**: `int?`
  The maximum number of lines the [InputDecoration.errorText] can occupy.

 Defaults to null, which means that the [InputDecoration.errorText] will be
 limited to a single line with [TextOverflow.ellipsis].

 This value is passed along to the [Text.maxLines] attribute
 of the [Text] widget used to display the error.

 See also:

  * [helperMaxLines], the equivalent but for the [InputDecoration.helperText].

- **floatingLabelBehavior**: `FloatingLabelBehavior`
  

 Defaults to [FloatingLabelBehavior.auto].

- **floatingLabelAlignment**: `FloatingLabelAlignment`
  

 Defaults to [FloatingLabelAlignment.start].

- **isDense**: `bool`
  Whether the input decorator's child is part of a dense form (i.e., uses
 less vertical space).

 Defaults to false.

- **contentPadding**: `EdgeInsetsGeometry?`
  The padding for the input decoration's container.

 The decoration's container is the area which is filled if
 [InputDecoration.filled] is true and bordered per the [border].
 It's the area adjacent to [InputDecoration.icon] and above the
 [InputDecoration.icon] and above the widgets that contain
 [InputDecoration.helperText], [InputDecoration.errorText], and
 [InputDecoration.counterText].

 By default the [contentPadding] reflects [isDense] and the type of the
 [border]. If [isCollapsed] is true then [contentPadding] is
 [EdgeInsets.zero].

- **isCollapsed**: `bool`
  Whether the decoration is the same size as the input field.

 A collapsed decoration cannot have [InputDecoration.labelText],
 [InputDecoration.errorText], or an [InputDecoration.icon].

- **iconColor**: `Color?`
  The Color to use for the [InputDecoration.icon].

 If [iconColor] is a [WidgetStateColor], then the effective
 color can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

 If null, defaults to the [ColorScheme.primary].

- **prefixStyle**: `TextStyle?`
  The style to use for the [InputDecoration.prefixText].

 If [prefixStyle] is a [WidgetStateTextStyle], then the effective
 text style can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

 If null, defaults to the [hintStyle].

- **prefixIconColor**: `Color?`
  The Color to use for the [InputDecoration.prefixIcon].

 If [prefixIconColor] is a [WidgetStateColor], then the effective
 color can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

 If null, defaults to the [ColorScheme.primary].

- **prefixIconConstraints**: `BoxConstraints?`
  The constraints to use for [InputDecoration.prefixIconConstraints].

 This can be used to modify the [BoxConstraints] surrounding
 [InputDecoration.prefixIcon].

 This property is particularly useful for getting the decoration's height
 less than the minimum tappable height (which is 48px when the visual
 density is set to [VisualDensity.standard]). This can be achieved by
 setting [isDense] to true and setting the constraints' minimum height
 and width to a value lower than the minimum tappable size.

 If null, [BoxConstraints] with a minimum width and height of 48px is
 used.

- **suffixStyle**: `TextStyle?`
  The style to use for the [InputDecoration.suffixText].

 If [suffixStyle] is a [WidgetStateTextStyle], then the effective
 color can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

 If null, defaults to the [hintStyle].

- **suffixIconColor**: `Color?`
  The Color to use for the [InputDecoration.suffixIcon].

 If [suffixIconColor] is a [WidgetStateColor], then the effective
 color can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

 If null, defaults to the [ColorScheme.primary].

- **suffixIconConstraints**: `BoxConstraints?`
  The constraints to use for [InputDecoration.suffixIconConstraints].

 This can be used to modify the [BoxConstraints] surrounding
 [InputDecoration.suffixIcon].

 This property is particularly useful for getting the decoration's height
 less than the minimum tappable height (which is 48px when the visual
 density is set to [VisualDensity.standard]). This can be achieved by
 setting [isDense] to true and setting the constraints' minimum height
 and width to a value lower than the minimum tappable size.

 If null, [BoxConstraints] with a minimum width and height of 48px is
 used.

- **counterStyle**: `TextStyle?`
  The style to use for the [InputDecoration.counterText].

 If [counterStyle] is a [WidgetStateTextStyle], then the effective
 text style can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

 If null, defaults to the [helperStyle].

- **filled**: `bool`
  If true the decoration's container is filled with [fillColor].

 Typically this field set to true if [border] is an
 [UnderlineInputBorder].

 The decoration's container is the area, defined by the border's
 [InputBorder.getOuterPath], which is filled if [filled] is
 true and bordered per the [border].

 This property is false by default.

- **fillColor**: `Color?`
  The color to fill the decoration's container with, if [filled] is true.

 By default the fillColor is based on the current [Theme].

 The decoration's container is the area, defined by the border's
 [InputBorder.getOuterPath], which is filled if [filled] is
 true and bordered per the [border].

- **outlineBorder**: `BorderSide?`
  The borderSide of the OutlineInputBorder with `color` and `weight`.

- **activeIndicatorBorder**: `BorderSide?`
  The borderSide of the UnderlineInputBorder with `color` and `weight`.

- **focusColor**: `Color?`
  The color to blend with the decoration's [fillColor] with, if [filled] is
 true and the container has the input focus.

 By default the [focusColor] is based on the current [Theme].

 The decoration's container is the area, defined by the border's
 [InputBorder.getOuterPath], which is filled if [filled] is
 true and bordered per the [border].

- **hoverColor**: `Color?`
  The color to blend with the decoration's [fillColor] with, if the
 decoration is being hovered over by a mouse pointer.

 By default the [hoverColor] is based on the current [Theme].

 The decoration's container is the area, defined by the border's
 [InputBorder.getOuterPath], which is filled if [filled] is
 true and bordered per the [border].

 The container will be filled when hovered over even if [filled] is false.

- **errorBorder**: `InputBorder?`
  The border to display when the [InputDecorator] does not have the focus and
 is showing an error.

 See also:

  * [InputDecorator.isFocused], which is true if the [InputDecorator]'s child
    has the focus.
  * [InputDecoration.errorText], the error shown by the [InputDecorator], if non-null.
  * [border], for a description of where the [InputDecorator] border appears.
  * [UnderlineInputBorder], an [InputDecorator] border which draws a horizontal
    line at the bottom of the input decorator's container.
  * [OutlineInputBorder], an [InputDecorator] border which draws a
    rounded rectangle around the input decorator's container.
  * [InputBorder.none], which doesn't draw a border.
  * [focusedBorder], displayed when [InputDecorator.isFocused] is true
    and [InputDecoration.errorText] is null.
  * [focusedErrorBorder], displayed when [InputDecorator.isFocused] is true
    and [InputDecoration.errorText] is non-null.
  * [disabledBorder], displayed when [InputDecoration.enabled] is false
    and [InputDecoration.errorText] is null.
  * [enabledBorder], displayed when [InputDecoration.enabled] is true
    and [InputDecoration.errorText] is null.

- **focusedBorder**: `InputBorder?`
  The border to display when the [InputDecorator] has the focus and is not
 showing an error.

 See also:

  * [InputDecorator.isFocused], which is true if the [InputDecorator]'s child
    has the focus.
  * [InputDecoration.errorText], the error shown by the [InputDecorator], if non-null.
  * [border], for a description of where the [InputDecorator] border appears.
  * [UnderlineInputBorder], an [InputDecorator] border which draws a horizontal
    line at the bottom of the input decorator's container.
  * [OutlineInputBorder], an [InputDecorator] border which draws a
    rounded rectangle around the input decorator's container.
  * [InputBorder.none], which doesn't draw a border.
  * [errorBorder], displayed when [InputDecorator.isFocused] is false
    and [InputDecoration.errorText] is non-null.
  * [focusedErrorBorder], displayed when [InputDecorator.isFocused] is true
    and [InputDecoration.errorText] is non-null.
  * [disabledBorder], displayed when [InputDecoration.enabled] is false
    and [InputDecoration.errorText] is null.
  * [enabledBorder], displayed when [InputDecoration.enabled] is true
    and [InputDecoration.errorText] is null.

- **focusedErrorBorder**: `InputBorder?`
  The border to display when the [InputDecorator] has the focus and is
 showing an error.

 See also:

  * [InputDecorator.isFocused], which is true if the [InputDecorator]'s child
    has the focus.
  * [InputDecoration.errorText], the error shown by the [InputDecorator], if non-null.
  * [border], for a description of where the [InputDecorator] border appears.
  * [UnderlineInputBorder], an [InputDecorator] border which draws a horizontal
    line at the bottom of the input decorator's container.
  * [OutlineInputBorder], an [InputDecorator] border which draws a
    rounded rectangle around the input decorator's container.
  * [InputBorder.none], which doesn't draw a border.
  * [errorBorder], displayed when [InputDecorator.isFocused] is false
    and [InputDecoration.errorText] is non-null.
  * [focusedBorder], displayed when [InputDecorator.isFocused] is true
    and [InputDecoration.errorText] is null.
  * [disabledBorder], displayed when [InputDecoration.enabled] is false
    and [InputDecoration.errorText] is null.
  * [enabledBorder], displayed when [InputDecoration.enabled] is true
    and [InputDecoration.errorText] is null.

- **disabledBorder**: `InputBorder?`
  The border to display when the [InputDecorator] is disabled and is not
 showing an error.

 See also:

  * [InputDecoration.enabled], which is false if the [InputDecorator] is disabled.
  * [InputDecoration.errorText], the error shown by the [InputDecorator], if non-null.
  * [border], for a description of where the [InputDecorator] border appears.
  * [UnderlineInputBorder], an [InputDecorator] border which draws a horizontal
    line at the bottom of the input decorator's container.
  * [OutlineInputBorder], an [InputDecorator] border which draws a
    rounded rectangle around the input decorator's container.
  * [InputBorder.none], which doesn't draw a border.
  * [errorBorder], displayed when [InputDecorator.isFocused] is false
    and [InputDecoration.errorText] is non-null.
  * [focusedBorder], displayed when [InputDecorator.isFocused] is true
    and [InputDecoration.errorText] is null.
  * [focusedErrorBorder], displayed when [InputDecorator.isFocused] is true
    and [InputDecoration.errorText] is non-null.
  * [enabledBorder], displayed when [InputDecoration.enabled] is true
    and [InputDecoration.errorText] is null.

- **enabledBorder**: `InputBorder?`
  The border to display when the [InputDecorator] is enabled and is not
 showing an error.

 See also:

  * [InputDecoration.enabled], which is false if the [InputDecorator] is disabled.
  * [InputDecoration.errorText], the error shown by the [InputDecorator], if non-null.
  * [border], for a description of where the [InputDecorator] border appears.
  * [UnderlineInputBorder], an [InputDecorator] border which draws a horizontal
    line at the bottom of the input decorator's container.
  * [OutlineInputBorder], an [InputDecorator] border which draws a
    rounded rectangle around the input decorator's container.
  * [InputBorder.none], which doesn't draw a border.
  * [errorBorder], displayed when [InputDecorator.isFocused] is false
    and [InputDecoration.errorText] is non-null.
  * [focusedBorder], displayed when [InputDecorator.isFocused] is true
    and [InputDecoration.errorText] is null.
  * [focusedErrorBorder], displayed when [InputDecorator.isFocused] is true
    and [InputDecoration.errorText] is non-null.
  * [disabledBorder], displayed when [InputDecoration.enabled] is false
    and [InputDecoration.errorText] is null.

- **border**: `InputBorder?`
  The shape of the border to draw around the decoration's container.

 If [border] is a [MaterialStateUnderlineInputBorder]
 or [MaterialStateOutlineInputBorder], then the effective border can depend on
 the [WidgetState.focused] state, i.e. if the [TextField] is focused or not.

 The decoration's container is the area which is filled if [filled] is
 true and bordered per the [border]. It's the area adjacent to
 [InputDecoration.icon] and above the widgets that contain
 [InputDecoration.helperText], [InputDecoration.errorText], and
 [InputDecoration.counterText].

 The border's bounds, i.e. the value of `border.`, define
 the area to be filled.

 This property is only used when the appropriate one of [errorBorder],
 [focusedBorder], [focusedErrorBorder], [disabledBorder], or [enabledBorder]
 is not specified. This border's [InputBorder.borderSide] property is
 configured by the InputDecorator, depending on the values of
 [InputDecoration.errorText], [InputDecoration.enabled],
 [InputDecorator.isFocused] and the current [Theme].

 Typically one of [UnderlineInputBorder] or [OutlineInputBorder].
 If null, InputDecorator's default is `const `.

 See also:

  * [InputBorder.none], which doesn't draw a border.
  * [UnderlineInputBorder], which draws a horizontal line at the
    bottom of the input decorator's container.
  * [OutlineInputBorder], an [InputDecorator] border which draws a
    rounded rectangle around the input decorator's container.

- **alignLabelWithHint**: `bool`
  Typically set to true when the [InputDecorator] contains a multiline
 [TextField] ([TextField.maxLines] is null or > 1) to override the default
 behavior of aligning the label with the center of the [TextField].

- **constraints**: `BoxConstraints?`
  Defines minimum and maximum sizes for the [InputDecorator].

 Typically the decorator will fill the horizontal space it is given. For
 larger screens, it may be useful to have the maximum width clamped to
 a given value so it doesn't fill the whole screen. This property
 allows you to control how big the decorator will be in its available
 space.

 If null, then the decorator will fill the available width with
 a default height based on text size.

 See also:

  * [InputDecoration.constraints], which can override this setting for a
    given decorator.

## Constructors

### Unnamed Constructor
Creates a value for [ThemeData.inputDecorationTheme] that
 defines default values for [InputDecorator].

