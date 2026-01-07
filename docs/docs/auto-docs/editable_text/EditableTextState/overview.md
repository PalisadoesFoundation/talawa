# Overview for `EditableTextState`

## Description

State for an [EditableText].

## Dependencies

- State, AutomaticKeepAliveClientMixin, WidgetsBindingObserver, TickerProviderStateMixin, TextSelectionDelegate, TextInputClient, AutofillClient

## Members

- **_cursorTimer**: `Timer?`
- **_backingCursorBlinkOpacityController**: `AnimationController?`
- **_iosBlinkCursorSimulation**: `Simulation`
- **_cursorVisibilityNotifier**: `ValueNotifier&lt;bool&gt;`
- **_editableKey**: `GlobalKey`
- **clipboardStatus**: `ClipboardStatusNotifier`
  Detects whether the clipboard can paste.

- **_liveTextInputStatus**: `LiveTextInputStatusNotifier?`
  Detects whether the Live Text input is enabled.

 See also:
  * [LiveText], where the availability of Live Text input can be obtained.

- **_textInputConnection**: `TextInputConnection?`
- **_selectionOverlay**: `TextSelectionOverlay?`
- **_scrollNotificationObserver**: `ScrollNotificationObserverState?`
- **_dataWhenToolbarShowScheduled**: `?`
- **_listeningToScrollNotificationObserver**: `bool`
- **_scrollableKey**: `GlobalKey`
- **_internalScrollController**: `ScrollController?`
- **_toolbarLayerLink**: `LayerLink`
- **_startHandleLayerLink**: `LayerLink`
- **_endHandleLayerLink**: `LayerLink`
- **_didAutoFocus**: `bool`
- **_currentAutofillScope**: `AutofillGroupState?`
- **_spellCheckConfiguration**: `SpellCheckConfiguration`
- **_style**: `TextStyle`
- **spellCheckResults**: `SpellCheckResults?`
  The most up-to-date spell check results for text input.

 These results will be updated via calls to spell check through a
 [SpellCheckService] and used by this widget to build the [TextSpan] tree
 for text input and menus for replacement suggestions of misspelled words.

- **_processTextService**: `ProcessTextService`
  The text processing service used to retrieve the native text processing actions.

- **_processTextActions**: `List&lt;ProcessTextAction&gt;`
  The list of native text processing actions provided by the engine.

- **_floatingCursorResetTime**: `Duration`
- **_floatingCursorResetController**: `AnimationController?`
- **_lastOrientation**: `Orientation?`
- **_appLifecycleListener**: `AppLifecycleListener`
- **_justResumed**: `bool`
- **_tickersEnabled**: `bool`
- **_lastKnownRemoteTextEditingValue**: `TextEditingValue?`
  The last known [TextEditingValue] of the platform text input plugin.

 This value is updated when the platform text input plugin sends a new
 update via [updateEditingValue], or when [EditableText] calls
 [TextInputConnection.setEditingState] to overwrite the platform text input
 plugin's [TextEditingValue].

 Used in [_updateRemoteEditingValueIfNeeded] to determine whether the
 remote value is outdated and needs updating.

- **_startCaretCenter**: `Offset?`
- **_lastTextPosition**: `TextPosition?`
- **_pointOffsetOrigin**: `Offset?`
- **_lastBoundedOffset**: `Offset?`
- **_batchEditDepth**: `int`
- **_hadFocusOnTapDown**: `bool`
  Flag to track whether this [EditableText] was in focus when [onTapOutside]
 was called.

 This is used to determine whether [onTapUpOutside] should be called.
 The reason [_hasFocus] can't be used directly is because [onTapOutside]
 might unfocus this [EditableText] and block the [onTapUpOutside] call.

- **_restartConnectionScheduled**: `bool`
- **_nextFocusChangeIsInternal**: `bool`
- **_platformSupportsFadeOnScroll**: `bool`
- **_showToolbarOnScreenScheduled**: `bool`
- **_caretAnimationDuration**: `Duration`
- **_caretAnimationCurve**: `Curve`
- **_showCaretOnScreenScheduled**: `bool`
- **_lastBottomViewInset**: `double`
- **_obscureShowCharTicksPending**: `int`
- **_obscureLatestCharIndex**: `int?`
- **_scribbleCacheKey**: `_ScribbleCacheKey?`
- **renderEditable**: `RenderEditable`
  The renderer for this widget's descendant.

 This property is typically used to notify the renderer of input gestures
 when [RenderEditable.ignorePointer] is true.

- **_placeholderLocation**: `int`
- **_viewId**: `int?`
- **_currentPromptRectRange**: `TextRange?`
- **_transposeCharactersAction**: `Action&lt;TransposeCharactersIntent&gt;`
- **_replaceTextAction**: `Action&lt;ReplaceTextIntent&gt;`
- **_updateSelectionAction**: `Action&lt;UpdateSelectionIntent&gt;`
- **_verticalSelectionUpdateAction**: `_UpdateTextSelectionVerticallyAction&lt;DirectionalCaretMovementIntent&gt;`
- **_actions**: `Map&lt;Type, Action&lt;Intent&gt;&gt;`
