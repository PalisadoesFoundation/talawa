# Overview for `EditableText`

## Description

A basic text input field.

 This widget interacts with the [TextInput] service to let the user edit the
 text it contains. It also provides scrolling, selection, and cursor
 movement.

 The [EditableText] widget is a low-level widget that is intended as a
 building block for custom widget sets. For a complete user experience,
 consider using a [TextField] or [CupertinoTextField].

 ## Handling User Input

 Currently the user may change the text this widget contains via keyboard or
 the text selection menu. When the user inserted or deleted text, you will be
 notified of the change and get a chance to modify the new text value:

 * The [inputFormatters] will be first applied to the user input.

 * The [controller]'s [TextEditingController.value] will be updated with the
   formatted result, and the [controller]'s listeners will be notified.

 * The [onChanged] callback, if specified, will be called last.

 ## Input Actions

 A [TextInputAction] can be provided to customize the appearance of the
 action button on the soft keyboard for Android and iOS. The default action
 is [TextInputAction.done].

 Many [TextInputAction]s are common between Android and iOS. However, if a
 [textInputAction] is provided that is not supported by the current
 platform in debug mode, an error will be thrown when the corresponding
 EditableText receives focus. For example, providing iOS's "emergencyCall"
 action when running on an Android device will result in an error when in
 debug mode. In release mode, incompatible [TextInputAction]s are replaced
 either with "unspecified" on Android, or "default" on iOS. Appropriate
 [textInputAction]s can be chosen by checking the current platform and then
 selecting the appropriate action.

 
 ## Lifecycle

 Upon completion of editing, like pressing the "done" button on the keyboard,
 two actions take place:

   1st: Editing is finalized. The default behavior of this step includes
   an invocation of [onChanged]. That default behavior can be overridden.
   See [onEditingComplete] for details.

   2nd: [onSubmitted] is invoked with the user's input value.

 [onSubmitted] can be used to manually move focus to another input widget
 when a user finishes with the currently focused input widget.

 When the widget has focus, it will prevent itself from disposing via
 [AutomaticKeepAliveClientMixin.wantKeepAlive] in order to avoid losing the
 selection. Removing the focus will allow it to be disposed.
 

 Rather than using this widget directly, consider using [TextField], which
 is a full-featured, material-design text input field with placeholder text,
 labels, and [Form] integration.

 ## Text Editing [Intent]s and Their Default [Action]s

 This widget provides default [Action]s for handling common text editing
 [Intent]s such as deleting, copying and pasting in the text field. These
 [Action]s can be directly invoked using [Actions.invoke] or the
 [Actions.maybeInvoke] method. The default text editing keyboard [Shortcuts],
 typically declared in [DefaultTextEditingShortcuts], also use these
 [Intent]s and [Action]s to perform the text editing operations they are
 bound to.

 The default handling of a specific [Intent] can be overridden by placing an
 [Actions] widget above this widget. See the [Action] class and the
 [Action.overridable] constructor for more information on how a pre-defined
 overridable [Action] can be overridden.

 ### Intents for Deleting Text and Their Default Behavior

 | **Intent Class**                 | **Default Behavior when there's selected text**      | **Default Behavior when there is a [caret](https://en.wikipedia.org/wiki/Caret_navigation) (The selection is [TextSelection.collapsed])**  |
 | :------------------------------- | :--------------------------------------------------- | :----------------------------------------------------------------------- |
 | [DeleteCharacterIntent]          | Deletes the selected text                            | Deletes the user-perceived character before or after the caret location. |
 | [DeleteToNextWordBoundaryIntent] | Deletes the selected text and the word before/after the selection's [TextSelection.extent] position | Deletes from the caret location to the previous or the next word boundary |
 | [DeleteToLineBreakIntent]        | Deletes the selected text, and deletes to the start/end of the line from the selection's [TextSelection.extent] position | Deletes from the caret location to the logical start or end of the current line |

 ### Intents for Moving the [Caret](https://en.wikipedia.org/wiki/Caret_navigation)

 | **Intent Class**                                                                     | **Default Behavior when there's selected text**                  | **Default Behavior when there is a caret ([TextSelection.collapsed])**  |
 | :----------------------------------------------------------------------------------- | :--------------------------------------------------------------- | :---------------------------------------------------------------------- |
 | [ExtendSelectionByCharacterIntent](`collapseSelection: true`)                        | Collapses the selection to the logical start/end of the selection | Moves the caret past the user-perceived character before or after the current caret location. |
 | [ExtendSelectionToNextWordBoundaryIntent](`collapseSelection: true`)                 | Collapses the selection to the word boundary before/after the selection's [TextSelection.extent] position | Moves the caret to the previous/next word boundary. |
 | [ExtendSelectionToNextWordBoundaryOrCaretLocationIntent](`collapseSelection: true`)  | Collapses the selection to the word boundary before/after the selection's [TextSelection.extent] position, or [TextSelection.base], whichever is closest in the given direction | Moves the caret to the previous/next word boundary. |
 | [ExtendSelectionToLineBreakIntent](`collapseSelection: true`)                        | Collapses the selection to the start/end of the line at the selection's [TextSelection.extent] position | Moves the caret to the start/end of the current line .|
 | [ExtendSelectionVerticallyToAdjacentLineIntent](`collapseSelection: true`)           | Collapses the selection to the position closest to the selection's [TextSelection.extent], on the previous/next adjacent line | Moves the caret to the closest position on the previous/next adjacent line. |
 | [ExtendSelectionVerticallyToAdjacentPageIntent](`collapseSelection: true`)           | Collapses the selection to the position closest to the selection's [TextSelection.extent], on the previous/next adjacent page | Moves the caret to the closest position on the previous/next adjacent page. |
 | [ExtendSelectionToDocumentBoundaryIntent](`collapseSelection: true`)                 | Collapses the selection to the start/end of the document | Moves the caret to the start/end of the document. |

 #### Intents for Extending the Selection

 | **Intent Class**                                                                     | **Default Behavior when there's selected text**                  | **Default Behavior when there is a caret ([TextSelection.collapsed])**  |
 | :----------------------------------------------------------------------------------- | :--------------------------------------------------------------- | :---------------------------------------------------------------------- |
 | [ExtendSelectionByCharacterIntent](`collapseSelection: false`)                       | Moves the selection's [TextSelection.extent] past the user-perceived character before/after it |
 | [ExtendSelectionToNextWordBoundaryIntent](`collapseSelection: false`)                | Moves the selection's [TextSelection.extent] to the previous/next word boundary |
 | [ExtendSelectionToNextWordBoundaryOrCaretLocationIntent](`collapseSelection: false`) | Moves the selection's [TextSelection.extent] to the previous/next word boundary, or [TextSelection.base] whichever is closest in the given direction | Moves the selection's [TextSelection.extent] to the previous/next word boundary. |
 | [ExtendSelectionToLineBreakIntent](`collapseSelection: false`)                       | Moves the selection's [TextSelection.extent] to the start/end of the line |
 | [ExtendSelectionVerticallyToAdjacentLineIntent](`collapseSelection: false`)          | Moves the selection's [TextSelection.extent] to the closest position on the previous/next adjacent line |
 | [ExtendSelectionVerticallyToAdjacentPageIntent](`collapseSelection: false`)          | Moves the selection's [TextSelection.extent] to the closest position on the previous/next adjacent page |
 | [ExtendSelectionToDocumentBoundaryIntent](`collapseSelection: false`)                | Moves the selection's [TextSelection.extent] to the start/end of the document |
 | [SelectAllTextIntent]  | Selects the entire document |

 ### Other Intents

 | **Intent Class**                        | **Default Behavior**                                 |
 | :-------------------------------------- | :--------------------------------------------------- |
 | [DoNothingAndStopPropagationTextIntent] | Does nothing in the input field, and prevents the key event from further propagating in the widget tree. |
 | [ReplaceTextIntent]                     | Replaces the current [TextEditingValue] in the input field's [TextEditingController], and triggers all related user callbacks and [TextInputFormatter]s. |
 | [UpdateSelectionIntent]                 | Updates the current selection in the input field's [TextEditingController], and triggers the [onSelectionChanged] callback. |
 | [CopySelectionTextIntent]               | Copies or cuts the selected text into the clipboard |
 | [PasteTextIntent]                       | Inserts the current text in the clipboard after the caret location, or replaces the selected text if the selection is not collapsed. |

 ## Text Editing [Shortcuts]

 It's also possible to directly remap keyboard shortcuts to new [Intent]s by
 inserting a [Shortcuts] widget above this in the widget tree. When using
 [WidgetsApp], the large set of default text editing keyboard shortcuts are
 declared near the top of the widget tree in [DefaultTextEditingShortcuts],
 and any [Shortcuts] widget between it and this [EditableText] will override
 those defaults.

 
 ### Interactions Between [Shortcuts] and Text Input

 Shortcuts prevent text input fields from receiving their keystrokes as text
 input. For example, placing a [Shortcuts] widget in the widget tree above
 a text input field and creating a shortcut for [LogicalKeyboardKey.keyA]
 will prevent the field from receiving that key as text input. In other
 words, typing key "A" into the field will trigger the shortcut and will not
 insert a letter "a" into the field.

 This happens because of the way that key strokes are handled in Flutter.
 When a keystroke is received in Flutter's engine, it first gives the
 framework the opportunity to handle it as a raw key event through
 [SystemChannels.keyEvent]. This is what [Shortcuts] listens to indirectly
 through its [FocusNode]. If it is not handled, then it will proceed to try
 handling it as text input through [SystemChannels.textInput], which is what
 [EditableTextState] listens to through [TextInputClient].

 This behavior, where a shortcut prevents text input into some field, can be
 overridden by using another [Shortcuts] widget lower in the widget tree and
 mapping the desired key stroke(s) to [DoNothingAndStopPropagationIntent].
 The key event will be reported as unhandled by the framework and will then
 be sent as text input as usual.
 

 ## Gesture Events Handling

 When [rendererIgnoresPointer] is false (the default), this widget provides
 rudimentary, platform-agnostic gesture handling for user actions such as
 tapping, long-pressing, and scrolling.

 To provide more complete gesture handling, including double-click to select
 a word, drag selection, and platform-specific handling of gestures such as
 long presses, consider setting [rendererIgnoresPointer] to true and using
 [TextSelectionGestureDetectorBuilder].

 
 ## Keep the caret visible when focused

 When focused, this widget will make attempts to keep the text area and its
 caret (even when [showCursor] is `false`) visible, on these occasions:

  * When the user focuses this text field and it is not [readOnly].
  * When the user changes the selection of the text field, or changes the
    text when the text field is not [readOnly].
  * When the virtual keyboard pops up.
 

 ## Scrolling Considerations

 If this [EditableText] is not a descendant of [Scaffold] and is being used
 within a [Scrollable] or nested [Scrollable]s, consider placing a
 [ScrollNotificationObserver] above the root [Scrollable] that contains this
 [EditableText] to ensure proper scroll coordination for [EditableText] and
 its components like [TextSelectionOverlay].

 
 ## Troubleshooting Common Accessibility Issues

 ### Customizing User Input Accessibility Announcements

 To customize user input accessibility announcements triggered by text
 changes, use [SemanticsService.announce] to make the desired
 accessibility announcement.

 On iOS, the on-screen keyboard may announce the most recent input
 incorrectly when a [TextInputFormatter] inserts a thousands separator to
 a currency value text field. The following example demonstrates how to
 suppress the default accessibility announcements by always announcing
 the content of the text field as a US currency value (the `\$` inserts
 a dollar sign, the `$newText` interpolates the `newText` variable):

 ```dart
 onChanged: (String newText) 
 ```

 

 See also:

  * [TextField], which is a full-featured, material-design text input field
    with placeholder text, labels, and [Form] integration.

## Dependencies

- StatefulWidget

## Members

- **controller**: `TextEditingController`
  Controls the text being edited.

- **focusNode**: `FocusNode`
  Controls whether this widget has keyboard focus.

- **obscuringCharacter**: `String`
  
 Character used for obscuring text if [obscureText] is true.

 Must be only a single character.

 Defaults to the character U+2022 BULLET (•).
 

- **obscureText**: `bool`
  
 Whether to hide the text being edited (e.g., for passwords).

 When this is set to true, all the characters in the text field are
 replaced by [obscuringCharacter], and the text in the field cannot be
 copied with copy or cut. If [readOnly] is also true, then the text cannot
 be selected.

 Defaults to false.
 

- **textHeightBehavior**: `TextHeightBehavior?`
  

- **textWidthBasis**: `TextWidthBasis`
  

- **readOnly**: `bool`
  
 Whether the text can be changed.

 When this is set to true, the text cannot be modified
 by any shortcut or keyboard operation. The text is still selectable.

 Defaults to false.
 

- **forceLine**: `bool`
  Whether the text will take the full width regardless of the text width.

 When this is set to false, the width will be based on text width, which
 will also be affected by [textWidthBasis].

 Defaults to true.

 See also:

  * [textWidthBasis], which controls the calculation of text width.

- **toolbarOptions**: `ToolbarOptions`
  Configuration of toolbar options.

 By default, all options are enabled. If [readOnly] is true, paste and cut
 will be disabled regardless. If [obscureText] is true, cut and copy will
 be disabled regardless. If [readOnly] and [obscureText] are both true,
 select all will also be disabled.

- **showSelectionHandles**: `bool`
  Whether to show selection handles.

 When a selection is active, there will be two handles at each side of
 boundary, or one handle if the selection is collapsed. The handles can be
 dragged to adjust the selection.

 See also:

  * [showCursor], which controls the visibility of the cursor.

- **showCursor**: `bool`
  
 Whether to show cursor.

 The cursor refers to the blinking caret when the [EditableText] is focused.
 

 See also:

  * [showSelectionHandles], which controls the visibility of the selection handles.

- **autocorrect**: `bool`
  
 Whether to enable autocorrection.

 Defaults to true.
 

- **smartDashesType**: `SmartDashesType`
  

- **smartQuotesType**: `SmartQuotesType`
  

- **enableSuggestions**: `bool`
  

- **style**: `TextStyle`
  The text style to use for the editable text.

- **undoController**: `UndoHistoryController?`
  Controls the undo state of the current editable text.

 If null, this widget will create its own [UndoHistoryController].

- **_strutStyle**: `StrutStyle?`
- **textAlign**: `TextAlign`
  
 How the text should be aligned horizontally.

 Defaults to [TextAlign.start].
 

- **textDirection**: `TextDirection?`
  
 The directionality of the text.

 This decides how [textAlign] values like [TextAlign.start] and
 [TextAlign.end] are interpreted.

 This is also used to disambiguate how to render bidirectional text. For
 example, if the text is an English phrase followed by a Hebrew phrase,
 in a [TextDirection.ltr] context the English phrase will be on the left
 and the Hebrew phrase to its right, while in a [TextDirection.rtl]
 context, the English phrase will be on the right and the Hebrew phrase on
 its left.

 Defaults to the ambient [Directionality], if any.
 

- **textCapitalization**: `TextCapitalization`
  
 Configures how the platform keyboard will select an uppercase or
 lowercase keyboard.

 Only supports text keyboards, other keyboard types will ignore this
 configuration. Capitalization is locale-aware.

 Defaults to [TextCapitalization.none].

 See also:

  * [TextCapitalization], for a description of each capitalization behavior.

 

- **locale**: `Locale?`
  Used to select a font when the same Unicode character can
 be rendered differently, depending on the locale.

 It's rarely necessary to set this property. By default its value
 is inherited from the enclosing app with `Localizations.localeOf(context)`.

 See [RenderEditable.locale] for more information.

- **textScaleFactor**: `double?`
  
 Deprecated. Will be removed in a future version of Flutter. Use
 [textScaler] instead.

 The number of font pixels for each logical pixel.

 For example, if the text scale factor is 1.5, text will be 50% larger than
 the specified font size.

 Defaults to the [MediaQueryData.textScaleFactor] obtained from the ambient
 [MediaQuery], or 1.0 if there is no [MediaQuery] in scope.
 

- **textScaler**: `TextScaler?`
  

- **cursorColor**: `Color`
  The color to use when painting the cursor.

- **autocorrectionTextRectColor**: `Color?`
  The color to use when painting the autocorrection Rect.

 For [CupertinoTextField]s, the value is set to the ambient
 [CupertinoThemeData.primaryColor] with 20% opacity. For [TextField]s, the
 value is null on non-iOS platforms and the same color used in [CupertinoTextField]
 on iOS.

 Currently the autocorrection Rect only appears on iOS.

 Defaults to null, which disables autocorrection Rect painting.

- **backgroundCursorColor**: `Color`
  The color to use when painting the background cursor aligned with the text
 while rendering the floating cursor.

 Typically this would be set to [CupertinoColors.inactiveGray].

 See also:

  * [FloatingCursorDragState], which explains the floating cursor feature
    in detail.

- **maxLines**: `int?`
  
 The maximum number of lines to show at one time, wrapping if necessary.

 This affects the height of the field itself and does not limit the number
 of lines that can be entered into the field.

 If this is 1 (the default), the text will not wrap, but will scroll
 horizontally instead.

 If this is null, there is no limit to the number of lines, and the text
 container will start with enough vertical space for one line and
 automatically grow to accommodate additional lines as they are entered, up
 to the height of its constraints.

 If this is not null, the value must be greater than zero, and it will lock
 the input to the given number of lines and take up enough horizontal space
 to accommodate that number of lines. Setting [minLines] as well allows the
 input to grow and shrink between the indicated range.

 The full set of behaviors possible with [minLines] and [maxLines] are as
 follows. These examples apply equally to [TextField], [TextFormField],
 [CupertinoTextField], and [EditableText].

 Input that occupies a single line and scrolls horizontally as needed.
 ```dart
 const 
 ```

 Input whose height grows from one line up to as many lines as needed for
 the text that was entered. If a height limit is imposed by its parent, it
 will scroll vertically when its height reaches that limit.
 ```dart
 const TextField(maxLines: null)
 ```

 The input's height is large enough for the given number of lines. If
 additional lines are entered the input scrolls vertically.
 ```dart
 const TextField(maxLines: 2)
 ```

 Input whose height grows with content between a min and max. An infinite
 max is possible with `maxLines: null`.
 ```dart
 const TextField(minLines: 2, maxLines: 4)
 ```

 See also:

  * [minLines], which sets the minimum number of lines visible.
 
  * [expands], which determines whether the field should fill the height of
    its parent.

- **minLines**: `int?`
  
 The minimum number of lines to occupy when the content spans fewer lines.

 This affects the height of the field itself and does not limit the number
 of lines that can be entered into the field.

 If this is null (default), text container starts with enough vertical space
 for one line and grows to accommodate additional lines as they are entered.

 This can be used in combination with [maxLines] for a varying set of behaviors.

 If the value is set, it must be greater than zero. If the value is greater
 than 1, [maxLines] should also be set to either null or greater than
 this value.

 When [maxLines] is set as well, the height will grow between the indicated
 range of lines. When [maxLines] is null, it will grow as high as needed,
 starting from [minLines].

 A few examples of behaviors possible with [minLines] and [maxLines] are as follows.
 These apply equally to [TextField], [TextFormField], [CupertinoTextField],
 and [EditableText].

 Input that always occupies at least 2 lines and has an infinite max.
 Expands vertically as needed.
 ```dart
 TextField(minLines: 2)
 ```

 Input whose height starts from 2 lines and grows up to 4 lines at which
 point the height limit is reached. If additional lines are entered it will
 scroll vertically.
 ```dart
 const TextField(minLines:2, maxLines: 4)
 ```

 Defaults to null.

 See also:

  * [maxLines], which sets the maximum number of lines visible, and has
    several examples of how minLines and maxLines interact to produce
    various behaviors.
 
  * [expands], which determines whether the field should fill the height of
    its parent.

- **expands**: `bool`
  
 Whether this widget's height will be sized to fill its parent.

 If set to true and wrapped in a parent widget like [Expanded] or
 [SizedBox], the input will expand to fill the parent.

 [maxLines] and [minLines] must both be null when this is set to true,
 otherwise an error is thrown.

 Defaults to false.

 See the examples in [maxLines] for the complete picture of how [maxLines],
 [minLines], and [expands] interact to produce various behaviors.

 Input that matches the height of its parent:
 ```dart
 const Expanded(
   child: TextField(maxLines: null, expands: true),
 )
 ```
 

- **autofocus**: `bool`
  
 Whether this text field should focus itself if nothing else is already
 focused.

 If true, the keyboard will open as soon as this text field obtains focus.
 Otherwise, the keyboard is only shown after the user taps the text field.

 Defaults to false.
 

- **selectionColor**: `Color?`
  The color to use when painting the selection.

 If this property is null, this widget gets the selection color from the
 [DefaultSelectionStyle].

 For [CupertinoTextField]s, the value is set to the ambient
 [CupertinoThemeData.primaryColor] with 20% opacity. For [TextField]s, the
 value is set to the ambient [TextSelectionThemeData.selectionColor].

- **selectionControls**: `TextSelectionControls?`
  
 Optional delegate for building the text selection handles.

 Historically, this field also controlled the toolbar. This is now handled
 by [contextMenuBuilder] instead. However, for backwards compatibility, when
 [selectionControls] is set to an object that does not mix in
 [TextSelectionHandleControls], [contextMenuBuilder] is ignored and the
 [TextSelectionControls.buildToolbar] method is used instead.
 

 See also:

  * [CupertinoTextField], which wraps an [EditableText] and which shows the
    selection toolbar upon user events that are appropriate on the iOS
    platform.
  * [TextField], a Material Design themed wrapper of [EditableText], which
    shows the selection toolbar upon appropriate user events based on the
    user's platform set in [ThemeData.platform].

- **keyboardType**: `TextInputType`
  
 The type of keyboard to use for editing the text.

 Defaults to [TextInputType.text] if [maxLines] is one and
 [TextInputType.multiline] otherwise.
 

- **textInputAction**: `TextInputAction?`
  The type of action button to use with the soft keyboard.

- **onChanged**: `ValueChanged&lt;String&gt;?`
  
 Called when the user initiates a change to the TextField's
 value: when they have inserted or deleted text.

 This callback doesn't run when the TextField's text is changed
 programmatically, via the TextField's [controller]. Typically it
 isn't necessary to be notified of such changes, since they're
 initiated by the app itself.

 To be notified of all changes to the TextField's text, cursor,
 and selection, one can add a listener to its [controller] with
 [TextEditingController.addListener].

 [onChanged] is called before [onSubmitted] when user indicates completion
 of editing, such as when pressing the "done" button on the keyboard. That
 default behavior can be overridden. See [onEditingComplete] for details.

 
 This example shows how onChanged could be used to check the TextField's
 current value each time the user inserts or deletes a character.

 ** See code in examples/api/lib/widgets/editable_text/editable_text.on_changed.0.dart **
 
 

 ## Handling emojis and other complex characters
 
 It's important to always use
 [characters](https://pub.dev/packages/characters) when dealing with user
 input text that may contain complex characters. This will ensure that
 extended grapheme clusters and surrogate pairs are treated as single
 characters, as they appear to the user.

 For example, when finding the length of some user input, use
 `string.characters.length`. Do NOT use `string.length` or even
 `string.runes.length`. For the complex character "👨‍👩‍👦", this
 appears to the user as a single character, and `string.characters.length`
 intuitively returns 1. On the other hand, `string.length` returns 8, and
 `string.runes.length` returns 5!
 

 See also:

  * [inputFormatters], which are called before [onChanged]
    runs and can validate and change ("format") the input value.
  * [onEditingComplete], [onSubmitted], [onSelectionChanged]:
    which are more specialized input change notifications.
  * [TextEditingController], which implements the [Listenable] interface
    and notifies its listeners on [TextEditingValue] changes.

- **onEditingComplete**: `VoidCallback?`
  
 Called when the user submits editable content (e.g., user presses the "done"
 button on the keyboard).

 The default implementation of [onEditingComplete] executes 2 different
 behaviors based on the situation:

  - When a completion action is pressed, such as "done", "go", "send", or
    "search", the user's content is submitted to the [controller] and then
    focus is given up.

  - When a non-completion action is pressed, such as "next" or "previous",
    the user's content is submitted to the [controller], but focus is not
    given up because developers may want to immediately move focus to
    another input widget within [onSubmitted].

 Providing [onEditingComplete] prevents the aforementioned default behavior.
 

- **onSubmitted**: `ValueChanged&lt;String&gt;?`
  
 Called when the user indicates that they are done editing the text in the
 field.

 By default, [onSubmitted] is called after [onChanged] when the user
 has finalized editing; or, if the default behavior has been overridden,
 after [onEditingComplete]. See [onEditingComplete] for details.

 ## Testing
 The following is the recommended way to trigger [onSubmitted] in a test:

 ```dart
 await tester.testTextInput.receiveAction(TextInputAction.done);
 ```

 Sending a `LogicalKeyboardKey.enter` via `tester.sendKeyEvent` will not
 trigger [onSubmitted]. This is because on a real device, the engine
 translates the enter key to a done action, but `tester.sendKeyEvent` sends
 the key to the framework only.
 

- **onAppPrivateCommand**: `AppPrivateCommandCallback?`
  
 This is used to receive a private command from the input method.

 Called when the result of [TextInputClient.performPrivateCommand] is
 received.

 This can be used to provide domain-specific features that are only known
 between certain input methods and their clients.

 See also:
   * [performPrivateCommand](https://developer.android.com/reference/android/view/inputmethod/InputConnection#performPrivateCommand\(java.lang.String,%20android.os.Bundle\)),
     which is the Android documentation for performPrivateCommand, used to
     send a command from the input method.
   * [sendAppPrivateCommand](https://developer.android.com/reference/android/view/inputmethod/InputMethodManager#sendAppPrivateCommand),
     which is the Android documentation for sendAppPrivateCommand, used to
     send a command to the input method.
 

- **onSelectionChanged**: `SelectionChangedCallback?`
  
 Called when the user changes the selection of text (including the cursor
 location).
 

- **onSelectionHandleTapped**: `VoidCallback?`
  

- **groupId**: `Object`
  
 The group identifier for the [TextFieldTapRegion] of this text field.

 Text fields with the same group identifier share the same tap region.
 Defaults to the type of [EditableText].

 See also:

  * [TextFieldTapRegion], to give a [groupId] to a widget that is to be
    included in a [EditableText]'s tap region that has [groupId] set.
 

- **onTapOutside**: `TapRegionCallback?`
  
 Called for each tap down that occurs outside of the [TextFieldTapRegion]
 group when the text field is focused.

 If this is null, [EditableTextTapOutsideIntent] will be invoked. In the
 default implementation, [FocusNode.unfocus] will be called on the
 [focusNode] for this text field when a [PointerDownEvent] is received on
 another part of the UI. However, it will not unfocus as a result of mobile
 application touch events (which does not include mouse clicks), to conform
 with the platform conventions. To change this behavior, a callback may be
 set here or [EditableTextTapOutsideIntent] may be overridden.

 When adding additional controls to a text field (for example, a spinner, a
 button that copies the selected text, or modifies formatting), it is
 helpful if tapping on that control doesn't unfocus the text field. In
 order for an external widget to be considered as part of the text field
 for the purposes of tapping "outside" of the field, wrap the control in a
 [TextFieldTapRegion].

 The [PointerDownEvent] passed to the function is the event that caused the
 notification. It is possible that the event may occur outside of the
 immediate bounding box defined by the text field, although it will be
 within the bounding box of a [TextFieldTapRegion] member.
 

 
 This example shows how to use a `TextFieldTapRegion` to wrap a set of
 "spinner" buttons that increment and decrement a value in the [TextField]
 without causing the text field to lose keyboard focus.

 This example includes a generic `SpinnerField&lt;T&gt;` class that you can copy
 into your own project and customize.

 ** See code in examples/api/lib/widgets/tap_region/text_field_tap_region.0.dart **
 

 See also:

  * [TapRegion] for how the region group is determined.
  * [onTapUpOutside] which is called for each tap up.
  * [EditableTextTapOutsideIntent] for the intent that is invoked if
  this is null.

- **onTapUpOutside**: `TapRegionUpCallback?`
  
 Called for each tap up that occurs outside of the [TextFieldTapRegion]
 group when the text field is focused.

 If this is null, [EditableTextTapUpOutsideIntent] will be invoked. In the
 default implementation, this is a no-op. To change this behavior, set a
 callback here or override [EditableTextTapUpOutsideIntent].

 The [PointerUpEvent] passed to the function is the event that caused the
 notification. It is possible that the event may occur outside of the
 immediate bounding box defined by the text field, although it will be
 within the bounding box of a [TextFieldTapRegion] member.
 

 See also:

  * [TapRegion] for how the region group is determined.
  * [onTapOutside], which is called for each tap down.
  * [EditableTextTapOutsideIntent], the intent that is invoked if
  this is null.

- **inputFormatters**: `List&lt;TextInputFormatter&gt;?`
  
 Optional input validation and formatting overrides.

 Formatters are run in the provided order when the user changes the text
 this widget contains. When this parameter changes, the new formatters will
 not be applied until the next time the user inserts or deletes text.
 Similar to the [onChanged] callback, formatters don't run when the text is
 changed programmatically via [controller].

 See also:

  * [TextEditingController], which implements the [Listenable] interface
    and notifies its listeners on [TextEditingValue] changes.
 

- **mouseCursor**: `MouseCursor?`
  The cursor for a mouse pointer when it enters or is hovering over the
 widget.

 If this property is null, [SystemMouseCursors.text] will be used.

 The [mouseCursor] is the only property of [EditableText] that controls the
 appearance of the mouse pointer. All other properties related to "cursor"
 stands for the text cursor, which is usually a blinking vertical line at
 the editing position.

- **rendererIgnoresPointer**: `bool`
  Whether the caller will provide gesture handling (true), or if the
 [EditableText] is expected to handle basic gestures (false).

 When this is false, the [EditableText] (or more specifically, the
 [RenderEditable]) enables some rudimentary gestures (tap to position the
 cursor, long-press to select all, and some scrolling behavior).

 These behaviors are sufficient for debugging purposes but are inadequate
 for user-facing applications. To enable platform-specific behaviors, use a
 [TextSelectionGestureDetectorBuilder] to wrap the [EditableText], and set
 [rendererIgnoresPointer] to true.

 When [rendererIgnoresPointer] is true true, the [RenderEditable] created
 by this widget will not handle pointer events.

 This property is false by default.

 See also:

  * [RenderEditable.ignorePointer], which implements this feature.
  * [TextSelectionGestureDetectorBuilder], which implements platform-specific
    gestures and behaviors.

- **cursorWidth**: `double`
  
 How thick the cursor will be.

 Defaults to 2.0.

 The cursor will draw under the text. The cursor width will extend
 to the right of the boundary between characters for left-to-right text
 and to the left for right-to-left text. This corresponds to extending
 downstream relative to the selected position. Negative values may be used
 to reverse this behavior.
 

- **cursorHeight**: `double?`
  
 How tall the cursor will be.

 If this property is null, [RenderEditable.preferredLineHeight] will be used.
 

- **cursorRadius**: `Radius?`
  
 How rounded the corners of the cursor should be.

 By default, the cursor has no radius.
 

- **cursorOpacityAnimates**: `bool`
  
 Whether the cursor will animate from fully transparent to fully opaque
 during each cursor blink.

 By default, the cursor opacity will animate on iOS platforms and will not
 animate on Android platforms.
 

- **cursorOffset**: `Offset?`
  

- **paintCursorAboveText**: `bool`
  

- **selectionHeightStyle**: `ui.BoxHeightStyle`
  Controls how tall the selection highlight boxes are computed to be.

 See [ui.BoxHeightStyle] for details on available styles.

- **selectionWidthStyle**: `ui.BoxWidthStyle`
  Controls how wide the selection highlight boxes are computed to be.

 See [ui.BoxWidthStyle] for details on available styles.

- **keyboardAppearance**: `Brightness`
  The appearance of the keyboard.

 This setting is only honored on iOS devices.

 Defaults to [Brightness.light].

- **scrollPadding**: `EdgeInsets`
  
 Configures the padding for the edges surrounding a [Scrollable] when the
 text field scrolls into view.

 When this widget receives focus and is not completely visible (for example
 scrolled partially off the screen or overlapped by the keyboard), then it
 will attempt to make itself visible by scrolling a surrounding
 [Scrollable], if one is present. This value controls how far from the
 edges of a [Scrollable] the TextField will be positioned after the scroll.

 Defaults to EdgeInsets.all(20.0).
 

- **enableInteractiveSelection**: `bool`
  
 Whether to enable user interface affordances for changing the
 text selection.

 For example, setting this to true will enable features such as
 long-pressing the TextField to select text and show the
 cut/copy/paste menu, and tapping to move the text caret.

 When this is false, the text selection cannot be adjusted by
 the user, text cannot be copied, and the user cannot paste into
 the text field from the clipboard.

 Defaults to true.
 

- **debugDeterministicCursor**: `bool`
  Setting this property to true makes the cursor stop blinking or fading
 on and off once the cursor appears on focus. This property is useful for
 testing purposes.

 It does not affect the necessity to focus the EditableText for the cursor
 to appear in the first place.

 Defaults to false, resulting in a typical blinking cursor.

- **dragStartBehavior**: `DragStartBehavior`
  

- **scrollController**: `ScrollController?`
  
 The [ScrollController] to use when vertically scrolling the input.

 If null, it will instantiate a new ScrollController.

 See [Scrollable.controller].
 

- **scrollPhysics**: `ScrollPhysics?`
  
 The [ScrollPhysics] to use when vertically scrolling the input.

 If not specified, it will behave according to the current platform.

 See [Scrollable.physics].
 

 If an explicit [ScrollBehavior] is provided to [scrollBehavior], the
 [ScrollPhysics] provided by that behavior will take precedence after
 [scrollPhysics].

- **scribbleEnabled**: `bool`
  
 Whether iOS 14 Scribble features are enabled for this widget.

 Only available on iPads.

 Defaults to true.
 

- **stylusHandwritingEnabled**: `bool`
  
 Whether this input supports stylus handwriting, where the user can write
 directly on top of a field.

 Currently only the following devices are supported:

  * iPads running iOS 14 and above using an Apple Pencil.
  * Android devices running API 34 and above and using an active stylus.
 

 On Android, Scribe gestures are detected outside of [EditableText],
 typically by [TextSelectionGestureDetectorBuilder]. This is handled
 automatically in [TextField].

 See also:

   * [ScribbleClient], which can be mixed into an arbitrary widget to
     provide iOS Scribble functionality.
   * [Scribe], which can be used to interact with Android Scribe directly.

- **autofillHints**: `Iterable&lt;String&gt;?`
  
 A list of strings that helps the autofill service identify the type of this
 text input.

 When set to null, this text input will not send its autofill information
 to the platform, preventing it from participating in autofills triggered
 by a different [AutofillClient], even if they're in the same
 [AutofillScope]. Additionally, on Android and web, setting this to null
 will disable autofill for this text field.

 The minimum platform SDK version that supports Autofill is API level 26
 for Android, and iOS 10.0 for iOS.

 Defaults to an empty list.

 ### Setting up iOS autofill:

 To provide the best user experience and ensure your app fully supports
 password autofill on iOS, follow these steps:

 * Set up your iOS app's
   [associated domains](https://developer.apple.com/documentation/safariservices/supporting_associated_domains_in_your_app).
 * Some autofill hints only work with specific [keyboardType]s. For example,
   [AutofillHints.name] requires [TextInputType.name] and [AutofillHints.email]
   works only with [TextInputType.emailAddress]. Make sure the input field has a
   compatible [keyboardType]. Empirically, [TextInputType.name] works well
   with many autofill hints that are predefined on iOS.

 ### Troubleshooting Autofill

 Autofill service providers rely heavily on [autofillHints]. Make sure the
 entries in [autofillHints] are supported by the autofill service currently
 in use (the name of the service can typically be found in your mobile
 device's system settings).

 #### Autofill UI refuses to show up when I tap on the text field

 Check the device's system settings and make sure autofill is turned on,
 and there are available credentials stored in the autofill service.

 * iOS password autofill: Go to Settings -> Password, turn on "Autofill
   Passwords", and add new passwords for testing by pressing the top right
   "+" button. Use an arbitrary "website" if you don't have associated
   domains set up for your app. As long as there's at least one password
   stored, you should be able to see a key-shaped icon in the quick type
   bar on the software keyboard, when a password related field is focused.

 * iOS contact information autofill: iOS seems to pull contact info from
   the Apple ID currently associated with the device. Go to Settings ->
   Apple ID (usually the first entry, or "Sign in to your iPhone" if you
   haven't set up one on the device), and fill out the relevant fields. If
   you wish to test more contact info types, try adding them in Contacts ->
   My Card.

 * Android autofill: Go to Settings -> System -> Languages & input ->
   Autofill service. Enable the autofill service of your choice, and make
   sure there are available credentials associated with your app.

 Specifying [InputDecoration.hintText] may also help autofill services
 (like Samsung Pass) determine the expected content type of an input field,
 although this is typically not required when autofillHints are present.

 #### I called `TextInput.finishAutofillContext` but the autofill save
 prompt isn't showing

 * iOS: iOS may not show a prompt or any other visual indication when it
   saves user password. Go to Settings -> Password and check if your new
   password is saved. Neither saving password nor auto-generating strong
   password works without properly setting up associated domains in your
   app. To set up associated domains, follow the instructions in
   <https://developer.apple.com/documentation/safariservices/supporting_associated_domains_in_your_app>.

 
 

- **autofillClient**: `AutofillClient?`
  The [AutofillClient] that controls this input field's autofill behavior.

 When null, this widget's [EditableTextState] will be used as the
 [AutofillClient]. This property may override [autofillHints].

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.hardEdge].

- **restorationId**: `String?`
  Restoration ID to save and restore the scroll offset of the
 [EditableText].

 If a restoration id is provided, the [EditableText] will persist its
 current scroll offset and restore it during state restoration.

 The scroll offset is persisted in a [RestorationBucket] claimed from
 the surrounding [RestorationScope] using the provided restoration ID.

 Persisting and restoring the content of the [EditableText] is the
 responsibility of the owner of the [controller], who may use a
 [RestorableTextEditingController] for that purpose.

 See also:

  * [RestorationManager], which explains how state restoration works in
    Flutter.

- **scrollBehavior**: `ScrollBehavior?`
  
 A [ScrollBehavior] that will be applied to this widget individually.

 Defaults to null, wherein the inherited [ScrollBehavior] is copied and
 modified to alter the viewport decoration, like [Scrollbar]s.

 [ScrollBehavior]s also provide [ScrollPhysics]. If an explicit
 [ScrollPhysics] is provided in [scrollPhysics], it will take precedence,
 followed by [scrollBehavior], and then the inherited ancestor
 [ScrollBehavior].
 

 The [ScrollBehavior] of the inherited [ScrollConfiguration] will be
 modified by default to only apply a [Scrollbar] if [maxLines] is greater
 than 1.

- **enableIMEPersonalizedLearning**: `bool`
  

- **contentInsertionConfiguration**: `ContentInsertionConfiguration?`
  
 Configuration of handler for media content inserted via the system input
 method.

 Defaults to null in which case media content insertion will be disabled,
 and the system will display a message informing the user that the text field
 does not support inserting media content.

 Set [ContentInsertionConfiguration.onContentInserted] to provide a handler.
 Additionally, set [ContentInsertionConfiguration.allowedMimeTypes]
 to limit the allowable mime types for inserted content.

 

 This example shows how to access the data for inserted content in your
 `TextField`.

 ** See code in examples/api/lib/widgets/editable_text/editable_text.on_content_inserted.0.dart **
 

 If [contentInsertionConfiguration] is not provided, by default
 an empty list of mime types will be sent to the Flutter Engine.
 A handler function must be provided in order to customize the allowable
 mime types for inserted content.

 If rich content is inserted without a handler, the system will display
 a message informing the user that the current text input does not support
 inserting rich content.
 

- **contextMenuBuilder**: `EditableTextContextMenuBuilder?`
  
 Builds the text selection toolbar when requested by the user.

 The context menu is built when [EditableTextState.showToolbar] is called,
 typically by one of the callbacks installed by the widget created by
 [TextSelectionGestureDetectorBuilder.buildGestureDetector]. The widget
 returned by [contextMenuBuilder] is passed to a [ContextMenuController].

 If no callback is provided, no context menu will be shown.

 The [EditableTextContextMenuBuilder] signature used by the
 [contextMenuBuilder] callback has two parameters, the [BuildContext] of
 the [EditableText] and the [EditableTextState] of the [EditableText].

 The [EditableTextState] has two properties that are especially useful when
 building the widgets for the context menu:

 * [EditableTextState.contextMenuAnchors] specifies the desired anchor
   position for the context menu.

 * [EditableTextState.contextMenuButtonItems] represents the buttons that
   should typically be built for this widget (e.g. cut, copy, paste).

 The [TextSelectionToolbarLayoutDelegate] class may be particularly useful
 in honoring the preferred anchor positions.

 For backwards compatibility, when [EditableText.selectionControls] is set
 to an object that does not mix in [TextSelectionHandleControls],
 [contextMenuBuilder] is ignored and the
 [TextSelectionControls.buildToolbar] method is used instead.

 
 This example shows how to customize the menu, in this case by keeping the
 default buttons for the platform but modifying their appearance.

 ** See code in examples/api/lib/material/context_menu/editable_text_toolbar_builder.0.dart **
 

 
 This example shows how to show a custom button only when an email address
 is currently selected.

 ** See code in examples/api/lib/material/context_menu/editable_text_toolbar_builder.1.dart **
 

 See also:
   * [AdaptiveTextSelectionToolbar], which builds the default text selection
     toolbar for the current platform, but allows customization of the
     buttons.
   * [AdaptiveTextSelectionToolbar.getAdaptiveButtons], which builds the
     button Widgets for the current platform given
     [ContextMenuButtonItem]s.
   * [BrowserContextMenu], which allows the browser's context menu on web
     to be disabled and Flutter-rendered context menus to appear.
 

- **spellCheckConfiguration**: `SpellCheckConfiguration?`
  
 Configuration that details how spell check should be performed.

 Specifies the [SpellCheckService] used to spell check text input and the
 [TextStyle] used to style text with misspelled words.

 If the [SpellCheckService] is left null, spell check is disabled by
 default unless the [DefaultSpellCheckService] is supported, in which case
 it is used. It is currently supported only on Android and iOS.

 If this configuration is left null, then spell check is disabled by default.
 

- **magnifierConfiguration**: `TextMagnifierConfiguration`
  The configuration for the magnifier to use with selections in this text
 field.

 

- **defaultStylusHandwritingEnabled**: `bool`
  The default value for [stylusHandwritingEnabled].

## Constructors

### Unnamed Constructor
Creates a basic text input control.

 The [maxLines] property can be set to null to remove the restriction on
 the number of lines. By default, it is one, meaning this is a single-line
 text field. [maxLines] must be null or greater than zero.

 If [keyboardType] is not set or is null, its value will be inferred from
 [autofillHints], if [autofillHints] is not empty. Otherwise it defaults to
 [TextInputType.text] if [maxLines] is exactly one, and
 [TextInputType.multiline] if [maxLines] is null or greater than one.

 The text cursor is not shown if [showCursor] is false or if [showCursor]
 is null (the default) and [readOnly] is true.

