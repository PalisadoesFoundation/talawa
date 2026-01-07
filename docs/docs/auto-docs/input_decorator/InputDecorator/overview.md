# Overview for `InputDecorator`

## Description

Defines the appearance of a Material Design text field.

 [InputDecorator] displays the visual elements of a Material Design text
 field around its input [child]. The visual elements themselves are defined
 by an [InputDecoration] object and their layout and appearance depend
 on the `baseStyle`, `textAlign`, `isFocused`, and `isEmpty` parameters.

 [TextField] uses this widget to decorate its [EditableText] child.

 [InputDecorator] can be used to create widgets that look and behave like a
 [TextField] but support other kinds of input.

 Requires one of its ancestors to be a [Material] widget. The [child] widget,
 as well as the decorative widgets specified in [decoration], must have
 non-negative baselines.

 See also:

  * [TextField], which uses an [InputDecorator] to display a border,
    labels, and icons, around its [EditableText] child.
  * [Decoration] and [DecoratedBox], for drawing arbitrary decorations
    around other widgets.

## Dependencies

- StatefulWidget

## Members

- **decoration**: `InputDecoration`
  The text and styles to use when decorating the child.

 Null [InputDecoration] properties are initialized with the corresponding
 values from [ThemeData.inputDecorationTheme].

- **baseStyle**: `TextStyle?`
  The style on which to base the label, hint, counter, and error styles
 if the [decoration] does not provide explicit styles.

 If null, [baseStyle] defaults to the `titleMedium` style from the
 current [Theme], see [ThemeData.textTheme].

 The [TextStyle.textBaseline] of the [baseStyle] is used to determine
 the baseline used for text alignment.

- **textAlign**: `TextAlign?`
  How the text in the decoration should be aligned horizontally.

- **textAlignVertical**: `TextAlignVertical?`
  
 How the text should be aligned vertically.

 Determines the alignment of the baseline within the available space of
 the input (typically a TextField). For example, TextAlignVertical.top will
 place the baseline such that the text, and any attached decoration like
 prefix and suffix, is as close to the top of the input as possible without
 overflowing. The heights of the prefix and suffix are similarly included
 for other alignment values. If the height is greater than the height
 available, then the prefix and suffix will be allowed to overflow first
 before the text scrolls.
 

- **isFocused**: `bool`
  Whether the input field has focus.

 Determines the position of the label text and the color and weight of the
 border.

 Defaults to false.

 See also:

  * [InputDecoration.hoverColor], which is also blended into the focus
    color and fill color when the [isHovering] is true to produce the final
    color.

- **isHovering**: `bool`
  Whether the input field is being hovered over by a mouse pointer.

 Determines the container fill color, which is a blend of
 [InputDecoration.hoverColor] with [InputDecoration.fillColor] when
 true, and [InputDecoration.fillColor] when not.

 Defaults to false.

- **expands**: `bool`
  If true, the height of the input field will be as large as possible.

 If wrapped in a widget that constrains its child's height, like Expanded
 or SizedBox, the input field will only be affected if [expands] is set to
 true.

 See [TextField.minLines] and [TextField.maxLines] for related ways to
 affect the height of an input. When [expands] is true, both must be null
 in order to avoid ambiguity in determining the height.

 Defaults to false.

- **isEmpty**: `bool`
  Whether the input field is empty.

 Determines the position of the label text and whether to display the hint
 text.

 Defaults to false.

- **child**: `Widget?`
  The widget below this widget in the tree.

 Typically an [EditableText], [DropdownButton], or [InkWell].

## Constructors

### Unnamed Constructor
Creates a widget that displays a border, labels, and icons,
 for a [TextField].

 The [isFocused], [isHovering], [expands], and [isEmpty] arguments must not
 be null.

