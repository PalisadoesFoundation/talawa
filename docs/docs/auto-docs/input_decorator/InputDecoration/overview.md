# Overview for `InputDecoration`

## Description

The border, labels, icons, and styles used to decorate a Material
 Design text field.

 The [TextField] and [InputDecorator] classes use [InputDecoration] objects
 to describe their decoration. (In fact, this class is merely the
 configuration of an [InputDecorator], which does all the heavy lifting.)

 
 This sample shows how to style a `TextField` using an `InputDecorator`. The
 TextField displays a "send message" icon to the left of the input area,
 which is surrounded by a border an all sides. It displays the `hintText`
 inside the input area to help the user understand what input is required. It
 displays the `helperText` and `counterText` below the input area.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/input_decoration.png)

 ** See code in examples/api/lib/material/input_decorator/input_decoration.0.dart **
 

 
 This sample shows how to style a "collapsed" `TextField` using an
 `InputDecorator`. The collapsed `TextField` surrounds the hint text and
 input area with a border, but does not add padding around them.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/input_decoration_collapsed.png)

 ** See code in examples/api/lib/material/input_decorator/input_decoration.1.dart **
 

 
 This sample shows how to create a `TextField` with hint text, a red border
 on all sides, and an error message. To display a red border and error
 message, provide `errorText` to the [InputDecoration] constructor.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/input_decoration_error.png)

 ** See code in examples/api/lib/material/input_decorator/input_decoration.2.dart **
 

 
 This sample shows how to style a `TextField` with a round border and
 additional text before and after the input area. It displays "Prefix" before
 the input area, and "Suffix" after the input area.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/input_decoration_prefix_suffix.png)

 ** See code in examples/api/lib/material/input_decorator/input_decoration.3.dart **
 

 
 This sample shows how to style a `TextField` with a prefixIcon that changes color
 based on the `WidgetState`. The color defaults to gray and is green while focused.

 ** See code in examples/api/lib/material/input_decorator/input_decoration.widget_state.0.dart **
 

 
 This sample shows how to style a `TextField` with a prefixIcon that changes color
 based on the `WidgetState` through the use of `ThemeData`. The color defaults
 to gray, be blue while focused and red if in an error state.

 ** See code in examples/api/lib/material/input_decorator/input_decoration.widget_state.1.dart **
 

 See also:

  * [TextField], which is a text input widget that uses an
    [InputDecoration].
  * [InputDecorator], which is a widget that draws an [InputDecoration]
    around an input child widget.
  * [Decoration] and [DecoratedBox], for drawing borders and backgrounds
    around a child widget.

## Members

- **icon**: `Widget?`
  An icon to show before the input field and outside of the decoration's
 container.

 The size and color of the icon is configured automatically using an
 [IconTheme] and therefore does not need to be explicitly given in the
 icon widget.

 The trailing edge of the icon is padded by 16dps.

 The decoration's container is the area which is filled if [filled] is
 true and bordered per the [border]. It's the area adjacent to
 [icon] and above the widgets that contain [helperText],
 [errorText], and [counterText].

 See [Icon], [ImageIcon].

- **iconColor**: `Color?`
  The color of the [icon].

 If [iconColor] is a [WidgetStateColor], then the effective
 color can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

- **label**: `Widget?`
  Optional widget that describes the input field.

 
 When the input field is empty and unfocused, the label is displayed on
 top of the input field (i.e., at the same location on the screen where
 text may be entered in the input field). When the input field receives
 focus (or if the field is non-empty), depending on [floatingLabelAlignment],
 the label moves above, either vertically adjacent to, or to the center of
 the input field.
 

 This can be used, for example, to add multiple [TextStyle]'s to a label that would
 otherwise be specified using [labelText], which only takes one [TextStyle].

 
 This example shows a `TextField` with a [Text.rich] widget as the [label].
 The widget contains multiple [Text] widgets with different [TextStyle]'s.

 ** See code in examples/api/lib/material/input_decorator/input_decoration.label.0.dart **
 

 Only one of [label] and [labelText] can be specified.

- **labelText**: `String?`
  Optional text that describes the input field.

 

 If a more elaborate label is required, consider using [label] instead.
 Only one of [label] and [labelText] can be specified.

- **labelStyle**: `TextStyle?`
  
 The style to use for [InputDecoration.labelText] when the label is on top
 of the input field.

 If [labelStyle] is a [WidgetStateTextStyle], then the effective
 text style can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

 When the [InputDecoration.labelText] is above (i.e., vertically adjacent to)
 the input field, the text uses the [floatingLabelStyle] instead.

 If null, defaults to a value derived from the base [TextStyle] for the
 input field and the current [Theme].

 Specifying this style will override the default behavior
 of [InputDecoration] that changes the color of the label to the
 [InputDecoration.errorStyle] color or [ColorScheme.error].

 
 It's possible to override the label style for just the error state, or
 just the default state, or both.

 In this example the [labelStyle] is specified with a [WidgetStateProperty]
 which resolves to a text style whose color depends on the decorator's
 error state.

 ** See code in examples/api/lib/material/input_decorator/input_decoration.label_style_error.0.dart **
 
 

- **floatingLabelStyle**: `TextStyle?`
  
 The style to use for [InputDecoration.labelText] when the label is
 above (i.e., vertically adjacent to) the input field.

 When the [InputDecoration.labelText] is on top of the input field, the
 text uses the [labelStyle] instead.

 If [floatingLabelStyle] is a [WidgetStateTextStyle], then the effective
 text style can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

 If null, defaults to [labelStyle].

 Specifying this style will override the default behavior
 of [InputDecoration] that changes the color of the label to the
 [InputDecoration.errorStyle] color or [ColorScheme.error].

 When the input field receives focus, the font size of [InputDecoration.label] is
 scaled down by 75%.

 
 It's possible to override the label style for just the error state, or
 just the default state, or both.

 In this example the [floatingLabelStyle] is specified with a
 [WidgetStateProperty] which resolves to a text style whose color depends
 on the decorator's error state.

 ** See code in examples/api/lib/material/input_decorator/input_decoration.floating_label_style_error.0.dart **
 
 

- **helper**: `Widget?`
  Optional widget that appears below the [InputDecorator.child].

 If non-null, the [helper] is displayed below the [InputDecorator.child], in
 the same location as [error]. If a non-null [error] or [errorText] value is
 specified then the [helper] is not shown.

 
 This example shows a `TextField` with a [Text.rich] widget as the [helper].
 The widget contains [Text] and [Icon] widgets with different styles.

 ** See code in examples/api/lib/material/input_decorator/input_decoration.helper.0.dart **
 

 Only one of [helper] and [helperText] can be specified.

- **helperText**: `String?`
  Text that provides context about the [InputDecorator.child]'s value, such
 as how the value will be used.

 If non-null, the text is displayed below the [InputDecorator.child], in
 the same location as [errorText]. If a non-null [errorText] value is
 specified then the helper text is not shown.

 If a more elaborate helper text is required, consider using [helper] instead.

 Only one of [helper] and [helperText] can be specified.

- **helperStyle**: `TextStyle?`
  The style to use for the [helperText].

 If [helperStyle] is a [WidgetStateTextStyle], then the effective
 text style can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

- **helperMaxLines**: `int?`
  The maximum number of lines the [helperText] can occupy.

 Defaults to null, which means that soft line breaks in [helperText] are
 truncated with an ellipse while hard line breaks are respected.
 For example, a [helperText] that overflows the width of the field will be
 truncated with an ellipse. However, a [helperText] with explicit linebreak
 characters (\n) will display on multiple lines.

 To cause a long [helperText] to wrap, either set [helperMaxLines] or use
 [helper] which offers more flexibility. For instance, it can be set to a
 [Text] widget with a specific overflow value.

 This value is passed along to the [Text.maxLines] attribute
 of the [Text] widget used to display the helper.

 See also:

  * [errorMaxLines], the equivalent but for the [errorText].

- **hintText**: `String?`
  Text that suggests what sort of input the field accepts.

 Displayed on top of the [InputDecorator.child] (i.e., at the same location
 on the screen where text may be entered in the [InputDecorator.child]),
 when [InputDecorator.isEmpty] is true and either (a) [labelText] is null
 or (b) the input has the focus.

- **hint**: `Widget?`
  The widget to use in place of the [hintText].

 Either [hintText] or [hint] can be specified, but not both.

- **hintStyle**: `TextStyle?`
  The style to use for the [hintText].

 If [hintStyle] is a [WidgetStateTextStyle], then the effective
 text style can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

 Also used for the [labelText] when the [labelText] is displayed on
 top of the input field (i.e., at the same location on the screen where
 text may be entered in the [InputDecorator.child]).

 If null, defaults to a value derived from the base [TextStyle] for the
 input field and the current [Theme].

- **hintTextDirection**: `TextDirection?`
  The direction to use for the [hintText].

 If null, defaults to a value derived from [Directionality] for the
 input field and the current context.

- **hintMaxLines**: `int?`
  The maximum number of lines the [hintText] can occupy.

 Defaults to the value of [TextField.maxLines] attribute.

 This value is passed along to the [Text.maxLines] attribute
 of the [Text] widget used to display the hint text. [TextOverflow.ellipsis] is
 used to handle the overflow when it is limited to single line.

- **hintFadeDuration**: `Duration?`
  The duration of the [hintText] fade in and fade out animations.

 If null, defaults to [InputDecorationTheme.hintFadeDuration].
 If [InputDecorationTheme.hintFadeDuration] is null defaults to 20ms.

- **maintainHintHeight**: `bool`
  Whether the input field's height should always be greater than or equal to
 the height of the [hintText], even if the [hintText] is not visible.

 The [InputDecorator] widget ignores [hintText] during layout when
 it's not visible, if this flag is set to false.

 Defaults to true.

- **maintainHintSize**: `bool`
  Whether the input field's size should always be greater than or equal to
 the size of the [hintText], even if the [hintText] is not visible.

 The [InputDecorator] widget ignores [hintText] during layout when
 it's not visible, if this flag is set to false.

 Defaults to true.

- **error**: `Widget?`
  Optional widget that appears below the [InputDecorator.child] and the border.

 If non-null, the border's color animates to red and the [helperText] is not shown.

 Only one of [error] and [errorText] can be specified.

- **errorText**: `String?`
  Text that appears below the [InputDecorator.child] and the border.

 If non-null, the border's color animates to red and the [helperText] is
 not shown.

 In a [TextFormField], this is overridden by the value returned from
 [TextFormField.validator], if that is not null.

 If a more elaborate error is required, consider using [error] instead.

 Only one of [error] and [errorText] can be specified.

- **errorStyle**: `TextStyle?`
  
 The style to use for the [InputDecoration.errorText].

 If null, defaults of a value derived from the base [TextStyle] for the
 input field and the current [Theme].

 By default the color of style will be used by the label of
 [InputDecoration] if [InputDecoration.errorText] is not null. See
 [InputDecoration.labelStyle] or [InputDecoration.floatingLabelStyle] for
 an example of how to replicate this behavior when specifying those
 styles.
 

- **errorMaxLines**: `int?`
  The maximum number of lines the [errorText] can occupy.

 Defaults to null, which means that soft line breaks in [errorText] are
 truncated with an ellipse while hard line breaks are respected.
 For example, an [errorText] that overflows the width of the field will be
 truncated with an ellipse. However, an [errorText] with explicit linebreak
 characters (\n) will display on multiple lines.

 To cause a long [errorText] to wrap, either set [errorMaxLines] or use
 [error] which offers more flexibility. For instance, it can be set to a
 [Text] widget with a specific overflow value.

 This value is passed along to the [Text.maxLines] attribute
 of the [Text] widget used to display the error.

 See also:

  * [helperMaxLines], the equivalent but for the [helperText].

- **floatingLabelBehavior**: `FloatingLabelBehavior?`
  
 Defines **how** the floating label should behave.

 When [FloatingLabelBehavior.auto] the label will float to the top only when
 the field is focused or has some text content, otherwise it will appear
 in the field in place of the content.

 When [FloatingLabelBehavior.always] the label will always float at the top
 of the field above the content.

 When [FloatingLabelBehavior.never] the label will always appear in an empty
 field in place of the content.
 

 If null, [InputDecorationTheme.floatingLabelBehavior] will be used.

 See also:

  * [floatingLabelAlignment] which defines **where** the floating label
    should be displayed.

- **floatingLabelAlignment**: `FloatingLabelAlignment?`
  
 Defines **where** the floating label should be displayed.

 [FloatingLabelAlignment.start] aligns the floating label to the leftmost
 (when [TextDirection.ltr]) or rightmost (when [TextDirection.rtl]),
 possible position, which is vertically adjacent to the label, on top of
 the field.

 [FloatingLabelAlignment.center] aligns the floating label to the center on
 top of the field.
 

 If null, [InputDecorationTheme.floatingLabelAlignment] will be used.

 See also:

  * [floatingLabelBehavior] which defines **how** the floating label should
    behave.

- **isDense**: `bool?`
  Whether the [InputDecorator.child] is part of a dense form (i.e., uses less vertical
 space).

 Defaults to false.

- **contentPadding**: `EdgeInsetsGeometry?`
  The padding for the input decoration's container.

 

 By default the [contentPadding] reflects [isDense] and the type of the
 [border].

 If [isCollapsed] is true then [contentPadding] is [EdgeInsets.zero].

 ### Material 3 default content padding

 If `isOutline` property of [border] is false and if [filled] is true then
 [contentPadding] is `EdgeInsets.fromLTRB(12, 4, 12, 4)` when [isDense]
 is true and `EdgeInsets.fromLTRB(12, 8, 12, 8)` when [isDense] is false.

 If `isOutline` property of [border] is false and if [filled] is false then
 [contentPadding] is `EdgeInsets.fromLTRB(0, 4, 0, 4)` when [isDense] is
 true and `EdgeInsets.fromLTRB(0, 8, 0, 8)` when [isDense] is false.

 If `isOutline` property of [border] is true then [contentPadding] is
 `EdgeInsets.fromLTRB(12, 16, 12, 8)` when [isDense] is true
 and `EdgeInsets.fromLTRB(12, 20, 12, 12)` when [isDense] is false.

 ### Material 2 default content padding

 If `isOutline` property of [border] is false and if [filled] is true then
 [contentPadding] is `EdgeInsets.fromLTRB(12, 8, 12, 8)` when [isDense]
 is true and `EdgeInsets.fromLTRB(12, 12, 12, 12)` when [isDense] is false.

 If `isOutline` property of [border] is false and if [filled] is false then
 [contentPadding] is `EdgeInsets.fromLTRB(0, 8, 0, 8)` when [isDense] is
 true and `EdgeInsets.fromLTRB(0, 12, 0, 12)` when [isDense] is false.

 If `isOutline` property of [border] is true then [contentPadding] is
 `EdgeInsets.fromLTRB(12, 20, 12, 12)` when [isDense] is true
 and `EdgeInsets.fromLTRB(12, 24, 12, 16)` when [isDense] is false.

- **isCollapsed**: `bool?`
  Whether the decoration is the same size as the input field.

 A collapsed decoration cannot have [labelText], [errorText], [counter],
 [icon], prefixes, and suffixes.

 To create a collapsed input decoration, use [InputDecoration.collapsed].

- **prefixIcon**: `Widget?`
  An icon that appears before the [prefix] or [prefixText] and before
 the editable part of the text field, within the decoration's container.

 The size and color of the prefix icon is configured automatically using an
 [IconTheme] and therefore does not need to be explicitly given in the
 icon widget.

 The prefix icon is constrained with a minimum size of 48px by 48px, but
 can be expanded beyond that. Anything larger than 24px will require
 additional padding to ensure it matches the Material Design spec of 12px
 padding between the left edge of the input and leading edge of the prefix
 icon. The following snippet shows how to pad the leading edge of the
 prefix icon:

 ```dart
 prefixIcon: Padding(
   padding: const EdgeInsetsDirectional.only(start: 12.0),
   child: _myIcon, // _myIcon is a 48px-wide widget.
 )
 ```

 

 The prefix icon alignment can be changed using [Align] with a fixed `widthFactor` and
 `heightFactor`.

 
 This example shows how the prefix icon alignment can be changed using [Align] with
 a fixed `widthFactor` and `heightFactor`.

 ** See code in examples/api/lib/material/input_decorator/input_decoration.prefix_icon.0.dart **
 

 See also:

  * [Icon] and [ImageIcon], which are typically used to show icons.
  * [prefix] and [prefixText], which are other ways to show content
    before the text field (but after the icon).
  * [suffixIcon], which is the same but on the trailing edge.
  * [Align] A widget that aligns its child within itself and optionally
    sizes itself based on the child's size.

- **prefixIconConstraints**: `BoxConstraints?`
  The constraints for the prefix icon.

 This can be used to modify the [BoxConstraints] surrounding [prefixIcon].

 This property is particularly useful for getting the decoration's height
 less than the minimum tappable height (which is 48px when the visual
 density is set to [VisualDensity.standard]). This can be achieved by
 setting [isDense] to true and setting the constraints' minimum height
 and width to a value lower than the minimum tappable size.

 
 This example shows the differences between two `TextField` widgets when
 [prefixIconConstraints] is set to the default value and when one is not.

 The [isDense] property must be set to true to be able to
 set the constraints smaller than 48px.

 If null, [BoxConstraints] with a minimum width and height of 48px is
 used.

 ** See code in examples/api/lib/material/input_decorator/input_decoration.prefix_icon_constraints.0.dart **
 

- **prefix**: `Widget?`
  Optional widget to place on the line before the input.

 This can be used, for example, to add some padding to text that would
 otherwise be specified using [prefixText], or to add a custom widget in
 front of the input. The widget's baseline is lined up with the input
 baseline.

 Only one of [prefix] and [prefixText] can be specified.

 The [prefix] appears after the [prefixIcon], if both are specified.

 See also:

  * [suffix], the equivalent but on the trailing edge.

- **prefixText**: `String?`
  Optional text prefix to place on the line before the input.

 Uses the [prefixStyle]. Uses [hintStyle] if [prefixStyle] isn't specified.
 The prefix text is not returned as part of the user's input.

 If a more elaborate prefix is required, consider using [prefix] instead.
 Only one of [prefix] and [prefixText] can be specified.

 The [prefixText] appears after the [prefixIcon], if both are specified.

 See also:

  * [suffixText], the equivalent but on the trailing edge.

- **prefixStyle**: `TextStyle?`
  The style to use for the [prefixText].

 If [prefixStyle] is a [WidgetStateTextStyle], then the effective
 text style can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

 If null, defaults to the [hintStyle].

 See also:

  * [suffixStyle], the equivalent but on the trailing edge.

- **prefixIconColor**: `Color?`
  Optional color of the prefixIcon

 Defaults to [iconColor]

 If [prefixIconColor] is a [WidgetStateColor], then the effective
 color can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

- **suffixIcon**: `Widget?`
  An icon that appears after the editable part of the text field and
 after the [suffix] or [suffixText], within the decoration's container.

 The size and color of the suffix icon is configured automatically using an
 [IconTheme] and therefore does not need to be explicitly given in the
 icon widget.

 The suffix icon is constrained with a minimum size of 48px by 48px, but
 can be expanded beyond that. Anything larger than 24px will require
 additional padding to ensure it matches the Material Design spec of 12px
 padding between the right edge of the input and trailing edge of the
 prefix icon. The following snippet shows how to pad the trailing edge of
 the suffix icon:

 ```dart
 suffixIcon: Padding(
   padding: const EdgeInsetsDirectional.only(end: 12.0),
   child: _myIcon, // myIcon is a 48px-wide widget.
 )
 ```

 The decoration's container is the area which is filled if [filled] is
 true and bordered per the [border]. It's the area adjacent to
 [icon] and above the widgets that contain [helperText],
 [errorText], and [counterText].

 The suffix icon alignment can be changed using [Align] with a fixed `widthFactor` and
 `heightFactor`.

 
 This example shows how the suffix icon alignment can be changed using [Align] with
 a fixed `widthFactor` and `heightFactor`.

 ** See code in examples/api/lib/material/input_decorator/input_decoration.suffix_icon.0.dart **
 

 See also:

  * [Icon] and [ImageIcon], which are typically used to show icons.
  * [suffix] and [suffixText], which are other ways to show content
    after the text field (but before the icon).
  * [prefixIcon], which is the same but on the leading edge.
  * [Align] A widget that aligns its child within itself and optionally
    sizes itself based on the child's size.

- **suffix**: `Widget?`
  Optional widget to place on the line after the input.

 This can be used, for example, to add some padding to the text that would
 otherwise be specified using [suffixText], or to add a custom widget after
 the input. The widget's baseline is lined up with the input baseline.

 Only one of [suffix] and [suffixText] can be specified.

 The [suffix] appears before the [suffixIcon], if both are specified.

 See also:

  * [prefix], the equivalent but on the leading edge.

- **suffixText**: `String?`
  Optional text suffix to place on the line after the input.

 Uses the [suffixStyle]. Uses [hintStyle] if [suffixStyle] isn't specified.
 The suffix text is not returned as part of the user's input.

 If a more elaborate suffix is required, consider using [suffix] instead.
 Only one of [suffix] and [suffixText] can be specified.

 The [suffixText] appears before the [suffixIcon], if both are specified.

 See also:

  * [prefixText], the equivalent but on the leading edge.

- **suffixStyle**: `TextStyle?`
  The style to use for the [suffixText].

 If [suffixStyle] is a [WidgetStateTextStyle], then the effective text
 style can depend on the [WidgetState.focused] state, i.e. if the
 [TextField] is focused or not.

 If null, defaults to the [hintStyle].

 See also:

  * [prefixStyle], the equivalent but on the leading edge.

- **suffixIconColor**: `Color?`
  Optional color of the [suffixIcon].

 Defaults to [iconColor]

 If [suffixIconColor] is a [WidgetStateColor], then the effective
 color can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

- **suffixIconConstraints**: `BoxConstraints?`
  The constraints for the suffix icon.

 This can be used to modify the [BoxConstraints] surrounding [suffixIcon].

 This property is particularly useful for getting the decoration's height
 less than the minimum tappable height (which is 48px when the visual
 density is set to [VisualDensity.standard]). This can be achieved by
 setting [isDense] to true and setting the constraints' minimum height
 and width to a value lower than the minimum tappable size.

 If null, a [BoxConstraints] with a minimum width and height of 48px is
 used.

 
 This example shows the differences between two `TextField` widgets when
 [suffixIconConstraints] is set to the default value and when one is not.

 The [isDense] property must be set to true to be able to
 set the constraints smaller than 48px.

 If null, [BoxConstraints] with a minimum width and height of 48px is
 used.

 ** See code in examples/api/lib/material/input_decorator/input_decoration.suffix_icon_constraints.0.dart **
 

- **counterText**: `String?`
  Optional text to place below the line as a character count.

 Rendered using [counterStyle]. Uses [helperStyle] if [counterStyle] is
 null.

 The semantic label can be replaced by providing a [semanticCounterText].

 If null or an empty string and [counter] isn't specified, then nothing
 will appear in the counter's location.

- **counter**: `Widget?`
  Optional custom counter widget to go in the place otherwise occupied by
 [counterText]. If this property is non null, then [counterText] is
 ignored.

- **counterStyle**: `TextStyle?`
  The style to use for the [counterText].

 If [counterStyle] is a [WidgetStateTextStyle], then the effective
 text style can depend on the [WidgetState.focused] state, i.e.
 if the [TextField] is focused or not.

 If null, defaults to the [helperStyle].

- **filled**: `bool?`
  If true the decoration's container is filled with [fillColor].

 When [InputDecorator.isHovering] is true, the [hoverColor] is also blended
 into the final fill color.

 Typically this field set to true if [border] is an [UnderlineInputBorder].

 
 The decoration's container is the area which is filled if [filled] is true
 and bordered per the [border]. It's the area adjacent to [icon] and above
 the widgets that contain [helperText], [errorText], and [counterText].
 

 This property is false by default.

- **fillColor**: `Color?`
  The base fill color of the decoration's container color.

 When [InputDecorator.isHovering] is true, the [hoverColor] is also blended
 into the final fill color.

 By default the [fillColor] is based on the current
 [InputDecorationTheme.fillColor].

 

- **focusColor**: `Color?`
  The fill color of the decoration's container when it has the input focus.

 By default the [focusColor] is based on the current
 [InputDecorationTheme.focusColor].

 This [focusColor] is ignored by [TextField] and [TextFormField] because
 they don't respond to focus changes by changing their decorator's
 container color, they respond by changing their border to the
 [focusedBorder], which you can change the color of.

 

- **hoverColor**: `Color?`
  The color of the highlight for the decoration shown if the container
 is being hovered over by a mouse.

 If [filled] is true, the [hoverColor] is blended with [fillColor] and
 fills the decoration's container.

 If [filled] is false, and [InputDecorator.isFocused] is false, the color
 is blended over the [enabledBorder]'s color.

 By default the [hoverColor] is based on the current [Theme].

 

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

 If [border] is a [WidgetStateInputBorder] then the effective border is resolved
 in the following states:
  * [WidgetState.disabled].
  * [WidgetState.error].
  * [WidgetState.focused].
  * [WidgetState.hovered].

 If [border] derives from [InputBorder] the border's [InputBorder.borderSide],
 i.e. the border's color and width, will be overridden to reflect the input
 decorator's state. Only the border's shape is used. If custom  [BorderSide]
 values are desired for a given state, all five borders – [errorBorder],
 [focusedBorder], [enabledBorder], [disabledBorder], [focusedErrorBorder] – must be set.

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

- **enabled**: `bool`
  If false the opacity of the visual elements is reduced, including [helperText],[errorText], and [counterText].

 This property is true by default.

- **semanticCounterText**: `String?`
  A semantic label for the [counterText].

 Defaults to null.

 If provided, this replaces the semantic label of the [counterText].

- **alignLabelWithHint**: `bool?`
  Typically set to true when the [InputDecorator] contains a multiline
 [TextField] ([TextField.maxLines] is null or > 1) to override the default
 behavior of aligning the label with the center of the [TextField].

 Defaults to false.

- **constraints**: `BoxConstraints?`
  Defines minimum and maximum sizes for the [InputDecorator].

 Typically the decorator will fill the horizontal space it is given. For
 larger screens, it may be useful to have the maximum width clamped to
 a given value so it doesn't fill the whole screen. This property
 allows you to control how big the decorator will be in its available
 space.

 If null, then the ambient [ThemeData.inputDecorationTheme]'s
 [InputDecorationTheme.constraints] will be used. If that
 is null then the decorator will fill the available width with
 a default height based on text size.

## Constructors

### Unnamed Constructor
Creates a bundle of the border, labels, icons, and styles used to
 decorate a Material Design text field.

 Unless specified by [ThemeData.inputDecorationTheme], [InputDecorator]
 defaults [isDense] to false and [filled] to false. The default border is
 an instance of [UnderlineInputBorder]. If [border] is [InputBorder.none]
 then no border is drawn.

 Only one of [prefix] and [prefixText] can be specified.

 Similarly, only one of [suffix] and [suffixText] can be specified.

### collapsed
Defines an [InputDecorator] that is the same size as the input field.

 This type of input decoration does not include a border by default.

 A collapsed decoration cannot have [labelText], [errorText], [counter],
 [icon], prefixes, and suffixes.

 Sets the [isCollapsed] property to true.
 Sets the [contentPadding] property to [EdgeInsets.zero].

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
