# Overview for `TextSpan`

## Description

An immutable span of text.

 A [TextSpan] object can be styled using its [style] property. The style will
 be applied to the [text] and the [children].

 A [TextSpan] object can just have plain text, or it can have children
 [TextSpan] objects with their own styles that (possibly only partially)
 override the [style] of this object. If a [TextSpan] has both [text] and
 [children], then the [text] is treated as if it was an un-styled [TextSpan]
 at the start of the [children] list. Leaving the [TextSpan.text] field null
 results in the [TextSpan] acting as an empty node in the [InlineSpan] tree
 with a list of children.

 To paint a [TextSpan] on a [Canvas], use a [TextPainter]. To display a text
 span in a widget, use a [RichText]. For text with a single style, consider
 using the [Text] widget.

 

 The text "Hello world!", in black:

 ```dart
 const TextSpan(
   text: 'Hello world!',
   style: TextStyle(color: Colors.black),
 )
 ```
 

 _There is some more detailed sample code in the documentation for the
 [recognizer] property._

 The [TextSpan.text] will be used as the semantics label unless overridden
 by the [TextSpan.semanticsLabel] property. Any [PlaceholderSpan]s in the
 [TextSpan.children] list will separate the text before and after it into two
 semantics nodes.

 See also:

  * [WidgetSpan], a leaf node that represents an embedded inline widget in an
    [InlineSpan] tree. Specify a widget within the [children] list by
    wrapping the widget with a [WidgetSpan]. The widget will be laid out
    inline within the paragraph.
  * [Text], a widget for showing uniformly-styled text.
  * [RichText], a widget for finer control of text rendering.
  * [TextPainter], a class for painting [TextSpan] objects on a [Canvas].

## Dependencies

- InlineSpan, HitTestTarget, MouseTrackerAnnotation

## Members

- **text**: `String?`
  The text contained in this span.

 If both [text] and [children] are non-null, the text will precede the
 children.

 This getter does not include the contents of its children.

- **children**: `List&lt;InlineSpan&gt;?`
  Additional spans to include as children.

 If both [text] and [children] are non-null, the text will precede the
 children.

 Modifying the list after the [TextSpan] has been created is not supported
 and may have unexpected results.

 The list must not contain any nulls.

- **recognizer**: `GestureRecognizer?`
  A gesture recognizer that will receive events that hit this span.

 [InlineSpan] itself does not implement hit testing or event dispatch. The
 object that manages the [InlineSpan] painting is also responsible for
 dispatching events. In the rendering library, that is the
 [RenderParagraph] object, which corresponds to the [RichText] widget in
 the widgets layer; these objects do not bubble events in [InlineSpan]s,
 so a [recognizer] is only effective for events that directly hit the
 [text] of that [InlineSpan], not any of its [children].

 [InlineSpan] also does not manage the lifetime of the gesture recognizer.
 The code that owns the [GestureRecognizer] object must call
 [GestureRecognizer.dispose] when the [InlineSpan] object is no longer
 used.

 

 This example shows how to manage the lifetime of a gesture recognizer
 provided to an [InlineSpan] object. It defines a `BuzzingText` widget
 which uses the [HapticFeedback] class to vibrate the device when the user
 long-presses the "find the" span, which is underlined in wavy green. The
 hit-testing is handled by the [RichText] widget. It also changes the
 hovering mouse cursor to `precise`.

 ```dart
 class BuzzingText extends StatefulWidget 

 class _BuzzingTextState extends State&lt;BuzzingText&gt; 
 ```
 

- **mouseCursor**: `MouseCursor`
  Mouse cursor when the mouse hovers over this span.

 The default value is [SystemMouseCursors.click] if [recognizer] is not
 null, or [MouseCursor.defer] otherwise.

 [TextSpan] itself does not implement hit testing or cursor changing.
 The object that manages the [TextSpan] painting is responsible
 to return the [TextSpan] in its hit test, as well as providing the
 correct mouse cursor when the [TextSpan]'s mouse cursor is
 [MouseCursor.defer].

- **onEnter**: `PointerEnterEventListener?`
- **onExit**: `PointerExitEventListener?`
- **semanticsLabel**: `String?`
  An alternative semantics label for this [TextSpan].

 If present, the semantics of this span will contain this value instead
 of the actual text.

 This is useful for replacing abbreviations or shorthands with the full
 text value:

 ```dart
 const TextSpan(text: r'$$', semanticsLabel: 'Double dollars')
 ```

- **semanticsIdentifier**: `String?`
  A unique identifier for the semantics node for this [TextSpan].

 This is useful for cases where the text content of the [TextSpan] needs
 to be uniquely identified through the automation tools without having
 a dependency on the actual content of the text that can possibly be
 dynamic in nature.

- **locale**: `ui.Locale?`
  The language of the text in this span and its span children.

 Setting the locale of this text span affects the way that assistive
 technologies, such as VoiceOver or TalkBack, pronounce the text.

 If this span contains other text span children, they also inherit the
 locale from this span unless explicitly set to different locales.

- **spellOut**: `bool?`
  Whether the assistive technologies should spell out this text character
 by character.

 If the text is 'hello world', setting this to true causes the assistive
 technologies, such as VoiceOver or TalkBack, to pronounce
 'h-e-l-l-o-space-w-o-r-l-d' instead of complete words. This is useful for
 texts, such as passwords or verification codes.

 If this span contains other text span children, they also inherit the
 property from this span unless explicitly set.

 If the property is not set, this text span inherits the spell out setting
 from its parent. If this text span does not have a parent or the parent
 does not have a spell out setting, this text span does not spell out the
 text by default.

## Constructors

### Unnamed Constructor
Creates a [TextSpan] with the given values.

 For the object to be useful, at least one of [text] or
 [children] should be set.

