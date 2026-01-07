# Overview for `SemanticsAction`

## Description

The possible actions that can be conveyed from the operating system
 accessibility APIs to a semantics node.

## Members

- **index**: `int`
  The numerical value for this action.

 Each action has one bit set in this bit field.

- **name**: `String`
  A human-readable name for this flag, used for debugging purposes.

- **_kTapIndex**: `int`
- **_kLongPressIndex**: `int`
- **_kScrollLeftIndex**: `int`
- **_kScrollRightIndex**: `int`
- **_kScrollUpIndex**: `int`
- **_kScrollDownIndex**: `int`
- **_kIncreaseIndex**: `int`
- **_kDecreaseIndex**: `int`
- **_kShowOnScreenIndex**: `int`
- **_kMoveCursorForwardByCharacterIndex**: `int`
- **_kMoveCursorBackwardByCharacterIndex**: `int`
- **_kSetSelectionIndex**: `int`
- **_kCopyIndex**: `int`
- **_kCutIndex**: `int`
- **_kPasteIndex**: `int`
- **_kDidGainAccessibilityFocusIndex**: `int`
- **_kDidLoseAccessibilityFocusIndex**: `int`
- **_kCustomActionIndex**: `int`
- **_kDismissIndex**: `int`
- **_kMoveCursorForwardByWordIndex**: `int`
- **_kMoveCursorBackwardByWordIndex**: `int`
- **_kSetTextIndex**: `int`
- **_kFocusIndex**: `int`
- **_kScrollToOffsetIndex**: `int`
- **tap**: `SemanticsAction`
  The equivalent of a user briefly tapping the screen with the finger
 without moving it.

- **longPress**: `SemanticsAction`
  The equivalent of a user pressing and holding the screen with the finger
 for a few seconds without moving it.

- **scrollLeft**: `SemanticsAction`
  The equivalent of a user moving their finger across the screen from right
 to left.

 This action should be recognized by controls that are horizontally
 scrollable.

- **scrollRight**: `SemanticsAction`
  The equivalent of a user moving their finger across the screen from left
 to right.

 This action should be recognized by controls that are horizontally
 scrollable.

- **scrollUp**: `SemanticsAction`
  The equivalent of a user moving their finger across the screen from
 bottom to top.

 This action should be recognized by controls that are vertically
 scrollable.

- **scrollDown**: `SemanticsAction`
  The equivalent of a user moving their finger across the screen from top
 to bottom.

 This action should be recognized by controls that are vertically
 scrollable.

- **scrollToOffset**: `SemanticsAction`
  A request to scroll the scrollable container to a given scroll offset.

 The payload of this [SemanticsAction] is a flutter-standard-encoded
 [Float64List] of length 2 containing the target horizontal and vertical
 offsets (in logical pixels) the receiving scrollable container should
 scroll to.

 This action is used by iOS Full Keyboard Access to reveal contents that
 are currently not visible in the viewport.

- **increase**: `SemanticsAction`
  A request to increase the value represented by the semantics node.

 For example, this action might be recognized by a slider control.

- **decrease**: `SemanticsAction`
  A request to decrease the value represented by the semantics node.

 For example, this action might be recognized by a slider control.

- **showOnScreen**: `SemanticsAction`
  A request to fully show the semantics node on screen.

 For example, this action might be send to a node in a scrollable list that
 is partially off screen to bring it on screen.

- **moveCursorForwardByCharacter**: `SemanticsAction`
  Move the cursor forward by one character.

 This is for example used by the cursor control in text fields.

 The action includes a boolean argument, which indicates whether the cursor
 movement should extend (or start) a selection.

- **moveCursorBackwardByCharacter**: `SemanticsAction`
  Move the cursor backward by one character.

 This is for example used by the cursor control in text fields.

 The action includes a boolean argument, which indicates whether the cursor
 movement should extend (or start) a selection.

- **setText**: `SemanticsAction`
  Replaces the current text in the text field.

 This is for example used by the text editing in voice access.

 The action includes a string argument, which is the new text to
 replace.

- **setSelection**: `SemanticsAction`
  Set the text selection to the given range.

 The provided argument is a Map&lt;String, int&gt; which includes the keys `base`
 and `extent` indicating where the selection within the `value` of the
 semantics node should start and where it should end. Values for both
 keys can range from 0 to length of `value` (inclusive).

 Setting `base` and `extent` to the same value will move the cursor to
 that position (without selecting anything).

- **copy**: `SemanticsAction`
  Copy the current selection to the clipboard.

- **cut**: `SemanticsAction`
  Cut the current selection and place it in the clipboard.

- **paste**: `SemanticsAction`
  Paste the current content of the clipboard.

- **didGainAccessibilityFocus**: `SemanticsAction`
  Indicates that the node has gained accessibility focus.

 This handler is invoked when the node annotated with this handler gains
 the accessibility focus. The accessibility focus is the
 green (on Android with TalkBack) or black (on iOS with VoiceOver)
 rectangle shown on screen to indicate what element an accessibility
 user is currently interacting with.

 The accessibility focus is different from the input focus. The input focus
 is usually held by the element that currently responds to keyboard inputs.
 Accessibility focus and input focus can be held by two different nodes!

 See also:

    * [focus], which controls the input focus.

- **didLoseAccessibilityFocus**: `SemanticsAction`
  Indicates that the node has lost accessibility focus.

 This handler is invoked when the node annotated with this handler
 loses the accessibility focus. The accessibility focus is
 the green (on Android with TalkBack) or black (on iOS with VoiceOver)
 rectangle shown on screen to indicate what element an accessibility
 user is currently interacting with.

 The accessibility focus is different from the input focus. The input focus
 is usually held by the element that currently responds to keyboard inputs.
 Accessibility focus and input focus can be held by two different nodes!

- **customAction**: `SemanticsAction`
  Indicates that the user has invoked a custom accessibility action.

 This handler is added automatically whenever a custom accessibility
 action is added to a semantics node.

- **dismiss**: `SemanticsAction`
  A request that the node should be dismissed.

 A [SnackBar], for example, may have a dismiss action to indicate to the
 user that it can be removed after it is no longer relevant. On Android,
 (with TalkBack) special hint text is spoken when focusing the node and
 a custom action is available in the local context menu. On iOS,
 (with VoiceOver) users can perform a standard gesture to dismiss it.

- **moveCursorForwardByWord**: `SemanticsAction`
  Move the cursor forward by one word.

 This is for example used by the cursor control in text fields.

 The action includes a boolean argument, which indicates whether the cursor
 movement should extend (or start) a selection.

- **moveCursorBackwardByWord**: `SemanticsAction`
  Move the cursor backward by one word.

 This is for example used by the cursor control in text fields.

 The action includes a boolean argument, which indicates whether the cursor
 movement should extend (or start) a selection.

- **focus**: `SemanticsAction`
  Move the input focus to the respective widget.

 Most commonly, the input focus determines which widget will receive
 keyboard input. Semantics nodes that can receive this action are expected
 to have [SemanticsFlag.isFocusable] set. Examples of such focusable
 widgets include buttons, checkboxes, switches, and text fields.

 Upon receiving this action, the corresponding widget must move input focus
 to itself. Doing otherwise is likely to lead to a poor user experience,
 such as user input routed to a wrong widget. Text fields in particular,
 must immediately become editable, opening a virtual keyboard, if needed.
 Buttons must respond to tap/click events from the keyboard.

 Widget reaction to this action must be idempotent. It is possible to
 receive this action more than once, or when the widget is already focused.

 Focus behavior is specific to the platform and to the assistive technology
 used. Typically on desktop operating systems, such as Windows, macOS, and
 Linux, moving accessibility focus will also move the input focus. On
 mobile it is more common for the accessibility focus to be detached from
 the input focus. In order to synchronize the two, a user takes an explicit
 action (e.g. double-tap to activate). Sometimes this behavior is
 configurable. For example, VoiceOver on macOS can be configured in the
 global OS user settings to either move the input focus together with the
 VoiceOver focus, or to keep the two detached. For this reason, widgets
 should not expect to receive [didGainAccessibilityFocus] and [focus]
 actions to be reported in any particular combination or order.

 On the web, the DOM "focus" event is equivalent to
 [SemanticsAction.focus]. Accessibility focus is not observable from within
 the browser. Instead, the browser, based on the platform features and user
 preferences, makes the determination on whether input focus should be
 moved to an element and, if so, fires a DOM "focus" event. This event is
 forwarded to the framework as [SemanticsAction.focus]. For this reason, on
 the web, the engine never sends [didGainAccessibilityFocus].

 On Android input focus is observable as `AccessibilityAction#ACTION_FOCUS`
 and is separate from accessibility focus, which is observed as
 `AccessibilityAction#ACTION_ACCESSIBILITY_FOCUS`.

 See also:

    * [didGainAccessibilityFocus], which informs the framework about
      accessibility focus ring, such as the TalkBack (Android) and
      VoiceOver (iOS), moving which does not move the input focus.

- **_kActionById**: `Map&lt;int, SemanticsAction&gt;`
  The possible semantics actions.

 The map's key is the [index] of the action and the value is the action
 itself.

## Constructors

### _


#### Parameters

- `index`: `dynamic`
- `name`: `dynamic`
