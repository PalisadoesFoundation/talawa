# Overview for `Text`

## Description

A run of text with a single style.

 The [Text] widget displays a string of text with single style. The string
 might break across multiple lines or might all be displayed on the same line
 depending on the layout constraints.

 The [style] argument is optional. When omitted, the text will use the style
 from the closest enclosing [DefaultTextStyle]. If the given style's
 [TextStyle.inherit] property is true (the default), the given style will
 be merged with the closest enclosing [DefaultTextStyle]. This merging
 behavior is useful, for example, to make the text bold while using the
 default font family and size.

 

 This example shows how to display text using the [Text] widget with the
 [overflow] set to [TextOverflow.ellipsis].

 ![If the text overflows, the Text widget displays an ellipsis to trim the overflowing text](https://flutter.github.io/assets-for-api-docs/assets/widgets/text_ellipsis.png)

 ```dart
 Container(
   width: 100,
   decoration: BoxDecoration(border: Border.),
   child: Text(overflow: TextOverflow.ellipsis, 'Hello $_name, how are you?'))
 ```
 

 

 Setting [maxLines] to `1` is not equivalent to disabling soft wrapping with
 [softWrap]. This is apparent when using [TextOverflow.fade] as the following
 examples show.

 ![If a second line overflows the Text widget displays a horizontal fade](https://flutter.github.io/assets-for-api-docs/assets/widgets/text_fade_max_lines.png)

 ```dart
 Text(
   overflow: TextOverflow.fade,
   maxLines: 1,
   'Hello $_name, how are you?')
 ```

 Here soft wrapping is enabled and the [Text] widget tries to wrap the words
 "how are you?" to a second line. This is prevented by the [maxLines] value
 of `1`. The result is that a second line overflows and the fade appears in a
 horizontal direction at the bottom.

 ![If a single line overflows the Text widget displays a horizontal fade](https://flutter.github.io/assets-for-api-docs/assets/widgets/text_fade_soft_wrap.png)

 ```dart
 Text(
   overflow: TextOverflow.fade,
   softWrap: false,
   'Hello $_name, how are you?')
 ```

 Here soft wrapping is disabled with `softWrap: false` and the [Text] widget
 attempts to display its text in a single unbroken line. The result is that
 the single line overflows and the fade appears in a vertical direction at
 the right.

 

 Using the [Text.rich] constructor, the [Text] widget can
 display a paragraph with differently styled [TextSpan]s. The sample
 that follows displays "Hello beautiful world" with different styles
 for each word.

 

 ![The word "Hello" is shown with the default text styles. The word "beautiful" is italicized. The word "world" is bold.](https://flutter.github.io/assets-for-api-docs/assets/widgets/text_rich.png)

 ```dart
 const Text.rich(
   TextSpan(
     text: 'Hello', // default text style
     children: <TextSpan>[
       TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
       TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
     ],
   ),
 )
 ```
 

 ## Interactivity

 To make [Text] react to touch events, wrap it in a [GestureDetector] widget
 with a [GestureDetector.onTap] handler.

 In a Material Design application, consider using a [TextButton] instead, or
 if that isn't appropriate, at least using an [InkWell] instead of
 [GestureDetector].

 To make sections of the text interactive, use [RichText] and specify a
 [TapGestureRecognizer] as the [TextSpan.recognizer] of the relevant part of
 the text.

 ## Selection

 [Text] is not selectable by default. To make a [Text] selectable, one can
 wrap a subtree with a [SelectionArea] widget. To exclude a part of a subtree
 under [SelectionArea] from selection, once can also wrap that part of the
 subtree with [SelectionContainer.disabled].

 
 This sample demonstrates how to disable selection for a Text under a
 SelectionArea.

 ** See code in examples/api/lib/material/selection_container/selection_container_disabled.0.dart **
 

 See also:

  * [RichText], which gives you more control over the text styles.
  * [DefaultTextStyle], which sets default styles for [Text] widgets.
  * [SelectableRegion], which provides an overview of the selection system.

## Dependencies

- StatelessWidget

## Members

- **data**: `String?`
  The text to display.

 This will be null if a [textSpan] is provided instead.

- **textSpan**: `InlineSpan?`
  The text to display as a [InlineSpan].

 This will be null if [data] is provided instead.

- **style**: `TextStyle?`
  If non-null, the style to use for this text.

 If the style's "inherit" property is true, the style will be merged with
 the closest enclosing [DefaultTextStyle]. Otherwise, the style will
 replace the closest enclosing [DefaultTextStyle].

- **strutStyle**: `StrutStyle?`
  

- **textAlign**: `TextAlign?`
  How the text should be aligned horizontally.

- **textDirection**: `TextDirection?`
  The directionality of the text.

 This decides how [textAlign] values like [TextAlign.start] and
 [TextAlign.end] are interpreted.

 This is also used to disambiguate how to render bidirectional text. For
 example, if the [data] is an English phrase followed by a Hebrew phrase,
 in a [TextDirection.ltr] context the English phrase will be on the left
 and the Hebrew phrase to its right, while in a [TextDirection.rtl]
 context, the English phrase will be on the right and the Hebrew phrase on
 its left.

 Defaults to the ambient [Directionality], if any.

- **locale**: `Locale?`
  Used to select a font when the same Unicode character can
 be rendered differently, depending on the locale.

 It's rarely necessary to set this property. By default its value
 is inherited from the enclosing app with `Localizations.localeOf(context)`.

 See [RenderParagraph.locale] for more information.

- **softWrap**: `bool?`
  Whether the text should break at soft line breaks.

 If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.

- **overflow**: `TextOverflow?`
  How visual overflow should be handled.

 If this is null [TextStyle.overflow] will be used, otherwise the value
 from the nearest [DefaultTextStyle] ancestor will be used.

- **textScaleFactor**: `double?`
  Deprecated. Will be removed in a future version of Flutter. Use
 [textScaler] instead.

 The number of font pixels for each logical pixel.

 For example, if the text scale factor is 1.5, text will be 50% larger than
 the specified font size.

 The value given to the constructor as textScaleFactor. If null, will
 use the [MediaQueryData.textScaleFactor] obtained from the ambient
 [MediaQuery], or 1.0 if there is no [MediaQuery] in scope.

- **textScaler**: `TextScaler?`
  

- **maxLines**: `int?`
  An optional maximum number of lines for the text to span, wrapping if necessary.
 If the text exceeds the given number of lines, it will be truncated according
 to [overflow].

 If this is 1, text will not wrap. Otherwise, text will be wrapped at the
 edge of the box.

 If this is null, but there is an ambient [DefaultTextStyle] that specifies
 an explicit number for its [DefaultTextStyle.maxLines], then the
 [DefaultTextStyle] value will take precedence. You can use a [RichText]
 widget directly to entirely override the [DefaultTextStyle].

- **semanticsLabel**: `String?`
  
 An alternative semantics label for this text.

 If present, the semantics of this widget will contain this value instead
 of the actual text. This will overwrite any of the semantics labels applied
 directly to the [TextSpan]s.

 This is useful for replacing abbreviations or shorthands with the full
 text value:

 ```dart
 const Text(r'$$', semanticsLabel: 'Double dollars')
 ```
 

- **semanticsIdentifier**: `String?`
  A unique identifier for the semantics node for this widget.

 This is useful for cases where the text widget needs to have a uniquely
 identifiable ID that is recognized through the automation tools without
 having a dependency on the actual content of the text that can possibly be
 dynamic in nature.

- **textWidthBasis**: `TextWidthBasis?`
  

- **textHeightBehavior**: `ui.TextHeightBehavior?`
  

- **selectionColor**: `Color?`
  The color to use when painting the selection.

 This is ignored if [SelectionContainer.maybeOf] returns null
 in the [BuildContext] of the [Text] widget.

 If null, the ambient [DefaultSelectionStyle] is used (if any); failing
 that, the selection color defaults to [DefaultSelectionStyle.defaultColor]
 (semi-transparent grey).

## Constructors

### Unnamed Constructor
Creates a text widget.

 If the [style] argument is null, the text will use the style from the
 closest enclosing [DefaultTextStyle].

 The [overflow] property's behavior is affected by the [softWrap] argument.
 If the [softWrap] is true or null, the glyph causing overflow, and those
 that follow, will not be rendered. Otherwise, it will be shown with the
 given overflow option.

### rich
Creates a text widget with a [InlineSpan].

 The following subclasses of [InlineSpan] may be used to build rich text:

 * [TextSpan]s define text and children [InlineSpan]s.
 * [WidgetSpan]s define embedded inline widgets.

 See [RichText] which provides a lower-level way to draw text.

#### Parameters

- `textSpan`: `InlineSpan`
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
