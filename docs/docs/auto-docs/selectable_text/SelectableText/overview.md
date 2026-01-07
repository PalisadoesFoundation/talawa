# Overview for `SelectableText`

## Description

A run of selectable text with a single style.

 Consider using [SelectionArea] or [SelectableRegion] instead, which enable
 selection on a widget subtree, including but not limited to [Text] widgets.

 The [SelectableText] widget displays a string of text with a single style.
 The string might break across multiple lines or might all be displayed on
 the same line depending on the layout constraints.

 

 The [style] argument is optional. When omitted, the text will use the style
 from the closest enclosing [DefaultTextStyle]. If the given style's
 [TextStyle.inherit] property is true (the default), the given style will
 be merged with the closest enclosing [DefaultTextStyle]. This merging
 behavior is useful, for example, to make the text bold while using the
 default font family and size.

 

 

 ```dart
 const SelectableText(
   'Hello! How are you?',
   textAlign: TextAlign.center,
   style: TextStyle(fontWeight: FontWeight.bold),
 )
 ```
 

 Using the [SelectableText.rich] constructor, the [SelectableText] widget can
 display a paragraph with differently styled [TextSpan]s. The sample
 that follows displays "Hello beautiful world" with different styles
 for each word.

 

 ```dart
 const SelectableText.rich(
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

 To make [SelectableText] react to touch events, use callback [onTap] to achieve
 the desired behavior.

 ## Scrolling Considerations

 If this [SelectableText] is not a descendant of [Scaffold] and is being used
 within a [Scrollable] or nested [Scrollable]s, consider placing a
 [ScrollNotificationObserver] above the root [Scrollable] that contains this
 [SelectableText] to ensure proper scroll coordination for [SelectableText]
 and its components like [TextSelectionOverlay].

 See also:

  * [Text], which is the non selectable version of this widget.
  * [TextField], which is the editable version of this widget.
  * [SelectionArea], which enables the selection of multiple [Text] widgets
    and of other widgets.

## Dependencies

- StatefulWidget

## Members

- **data**: `String?`
  The text to display.

 This will be null if a [textSpan] is provided instead.

- **textSpan**: `TextSpan?`
  The text to display as a [TextSpan].

 This will be null if [data] is provided instead.

- **focusNode**: `FocusNode?`
  Defines the focus for this widget.

 Text is only selectable when widget is focused.

 The [focusNode] is a long-lived object that's typically managed by a
 [StatefulWidget] parent. See [FocusNode] for more information.

 To give the focus to this widget, provide a [focusNode] and then
 use the current [FocusScope] to request the focus:

 ```dart
 FocusScope.of(context).requestFocus(myFocusNode);
 ```

 This happens automatically when the widget is tapped.

 To be notified when the widget gains or loses the focus, add a listener
 to the [focusNode]:

 ```dart
 myFocusNode.addListener( );
 ```

 If null, this widget will create its own [FocusNode] with
 [FocusNode.skipTraversal] parameter set to `true`, which causes the widget
 to be skipped over during focus traversal.

- **style**: `TextStyle?`
  The style to use for the text.

 If null, defaults [DefaultTextStyle] of context.

- **strutStyle**: `StrutStyle?`
  

- **textAlign**: `TextAlign?`
  

- **textDirection**: `TextDirection?`
  

- **textScaleFactor**: `double?`
  

- **textScaler**: `TextScaler?`
  

- **autofocus**: `bool`
  

- **minLines**: `int?`
  

- **maxLines**: `int?`
  

- **showCursor**: `bool`
  

- **cursorWidth**: `double`
  

- **cursorHeight**: `double?`
  

- **cursorRadius**: `Radius?`
  

- **cursorColor**: `Color?`
  The color of the cursor.

 The cursor indicates the current text insertion point.

 If null then [DefaultSelectionStyle.cursorColor] is used. If that is also
 null and [ThemeData.platform] is [TargetPlatform.iOS] or
 [TargetPlatform.macOS], then [CupertinoThemeData.primaryColor] is used.
 Otherwise [ColorScheme.primary] of [ThemeData.colorScheme] is used.

- **selectionColor**: `Color?`
  The color to use when painting the selection.

 If this property is null, this widget gets the selection color from the
 inherited [DefaultSelectionStyle] (if any); if none, the selection
 color is derived from the [CupertinoThemeData.primaryColor] on
 Apple platforms and [ColorScheme.primary] of [ThemeData.colorScheme] on
 other platforms.

- **selectionHeightStyle**: `ui.BoxHeightStyle`
  Controls how tall the selection highlight boxes are computed to be.

 See [ui.BoxHeightStyle] for details on available styles.

- **selectionWidthStyle**: `ui.BoxWidthStyle`
  Controls how wide the selection highlight boxes are computed to be.

 See [ui.BoxWidthStyle] for details on available styles.

- **enableInteractiveSelection**: `bool`
  

- **selectionControls**: `TextSelectionControls?`
  

- **dragStartBehavior**: `DragStartBehavior`
  

- **toolbarOptions**: `ToolbarOptions?`
  Configuration of toolbar options.

 Paste and cut will be disabled regardless.

 If not set, select all and copy will be enabled by default.

- **onTap**: `GestureTapCallback?`
  Called when the user taps on this selectable text.

 The selectable text builds a [GestureDetector] to handle input events like tap,
 to trigger focus requests, to move the caret, adjust the selection, etc.
 Handling some of those events by wrapping the selectable text with a competing
 GestureDetector is problematic.

 To unconditionally handle taps, without interfering with the selectable text's
 internal gesture detector, provide this callback.

 To be notified when the text field gains or loses the focus, provide a
 [focusNode] and add a listener to that.

 To listen to arbitrary pointer events without competing with the
 selectable text's internal gesture detector, use a [Listener].

- **scrollPhysics**: `ScrollPhysics?`
  

- **scrollBehavior**: `ScrollBehavior?`
  

- **semanticsLabel**: `String?`
  

- **textHeightBehavior**: `TextHeightBehavior?`
  

- **textWidthBasis**: `TextWidthBasis?`
  

- **onSelectionChanged**: `SelectionChangedCallback?`
  

- **contextMenuBuilder**: `EditableTextContextMenuBuilder?`
  

- **magnifierConfiguration**: `TextMagnifierConfiguration?`
  The configuration for the magnifier used when the text is selected.

 By default, builds a [CupertinoTextMagnifier] on iOS and [TextMagnifier]
 on Android, and builds nothing on all other platforms. To suppress the
 magnifier, consider passing [TextMagnifierConfiguration.disabled].

 

## Constructors

### Unnamed Constructor
Creates a selectable text widget.

 If the [style] argument is null, the text will use the style from the
 closest enclosing [DefaultTextStyle].

 If the [showCursor], [autofocus], [dragStartBehavior],
 [selectionHeightStyle], [selectionWidthStyle] and [data] arguments are
 specified, the [maxLines] argument must be greater than zero.

### rich
Creates a selectable text widget with a [TextSpan].

 The [TextSpan.children] attribute of the [textSpan] parameter must only
 contain [TextSpan]s. Other types of [InlineSpan] are not allowed.

#### Parameters

- `textSpan`: `TextSpan`
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
