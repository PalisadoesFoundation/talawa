# Overview for `SemanticsFlag`

## Description

A Boolean value that can be associated with a semantics node.

## Members

- **index**: `int`
  The numerical value for this flag.

 Each flag has one bit set in this bit field.

- **name**: `String`
  A human-readable name for this flag, used for debugging purposes.

- **_kHasCheckedStateIndex**: `int`
- **_kIsCheckedIndex**: `int`
- **_kIsSelectedIndex**: `int`
- **_kIsButtonIndex**: `int`
- **_kIsTextFieldIndex**: `int`
- **_kIsFocusedIndex**: `int`
- **_kHasEnabledStateIndex**: `int`
- **_kIsEnabledIndex**: `int`
- **_kIsInMutuallyExclusiveGroupIndex**: `int`
- **_kIsHeaderIndex**: `int`
- **_kIsObscuredIndex**: `int`
- **_kScopesRouteIndex**: `int`
- **_kNamesRouteIndex**: `int`
- **_kIsHiddenIndex**: `int`
- **_kIsImageIndex**: `int`
- **_kIsLiveRegionIndex**: `int`
- **_kHasToggledStateIndex**: `int`
- **_kIsToggledIndex**: `int`
- **_kHasImplicitScrollingIndex**: `int`
- **_kIsMultilineIndex**: `int`
- **_kIsReadOnlyIndex**: `int`
- **_kIsFocusableIndex**: `int`
- **_kIsLinkIndex**: `int`
- **_kIsSliderIndex**: `int`
- **_kIsKeyboardKeyIndex**: `int`
- **_kIsCheckStateMixedIndex**: `int`
- **_kHasExpandedStateIndex**: `int`
- **_kIsExpandedIndex**: `int`
- **_kHasSelectedStateIndex**: `int`
- **_kHasRequiredStateIndex**: `int`
- **_kIsRequiredIndex**: `int`
- **hasCheckedState**: `SemanticsFlag`
  The semantics node has the quality of either being "checked" or "unchecked".

 This flag is mutually exclusive with [hasToggledState].

 For example, a checkbox or a radio button widget has checked state.

 See also:

   * [SemanticsFlag.isChecked], which controls whether the node is "checked" or "unchecked".

- **isChecked**: `SemanticsFlag`
  Whether a semantics node that [hasCheckedState] is checked.

 If true, the semantics node is "checked". If false, the semantics node is
 "unchecked".

 For example, if a checkbox has a visible checkmark, [isChecked] is true.

 See also:

   * [SemanticsFlag.hasCheckedState], which enables a checked state.

- **isCheckStateMixed**: `SemanticsFlag`
  Whether a tristate checkbox is in its mixed state.

 If this is true, the check box this semantics node represents
 is in a mixed state.

 For example, a [Checkbox] with [Checkbox.tristate] set to true
 can have checked,  unchecked, or mixed state.

 Must be false when the checkbox is either checked or unchecked.

- **hasSelectedState**: `SemanticsFlag`
  The semantics node has the quality of either being "selected" or "unselected".

 Whether the widget corresponding to this node is currently selected or not
 is determined by the [isSelected] flag.

 When this flag is not set, the corresponding widget cannot be selected by
 the user, and the presence or the lack of [isSelected] does not carry any
 meaning.

- **isSelected**: `SemanticsFlag`
  Whether a semantics node is selected.

 This flag only has meaning in nodes that have [hasSelectedState] flag set.

 If true, the semantics node is "selected". If false, the semantics node is
 "unselected".

 For example, the active tab in a tab bar has [isSelected] set to true.

- **isButton**: `SemanticsFlag`
  Whether the semantic node represents a button.

 Platforms have special handling for buttons, for example Android's TalkBack
 and iOS's VoiceOver provides an additional hint when the focused object is
 a button.

- **isTextField**: `SemanticsFlag`
  Whether the semantic node represents a text field.

 Text fields are announced as such and allow text input via accessibility
 affordances.

- **isSlider**: `SemanticsFlag`
  Whether the semantic node represents a slider.

- **isKeyboardKey**: `SemanticsFlag`
  Whether the semantic node represents a keyboard key.

- **isReadOnly**: `SemanticsFlag`
  Whether the semantic node is read only.

 Only applicable when [isTextField] is true.

- **isLink**: `SemanticsFlag`
  Whether the semantic node is an interactive link.

 Platforms have special handling for links, for example iOS's VoiceOver
 provides an additional hint when the focused object is a link, as well as
 the ability to parse the links through another navigation menu.

- **isFocusable**: `SemanticsFlag`
  Whether the semantic node is able to hold the user's focus.

 The focused element is usually the current receiver of keyboard inputs.

- **isFocused**: `SemanticsFlag`
  Whether the semantic node currently holds the user's focus.

 The focused element is usually the current receiver of keyboard inputs.

- **hasEnabledState**: `SemanticsFlag`
  The semantics node has the quality of either being "enabled" or
 "disabled".

 For example, a button can be enabled or disabled and therefore has an
 "enabled" state. Static text is usually neither enabled nor disabled and
 therefore does not have an "enabled" state.

- **isEnabled**: `SemanticsFlag`
  Whether a semantic node that [hasEnabledState] is currently enabled.

 A disabled element does not respond to user interaction. For example, a
 button that currently does not respond to user interaction should be
 marked as disabled.

- **isInMutuallyExclusiveGroup**: `SemanticsFlag`
  Whether a semantic node is in a mutually exclusive group.

 For example, a radio button is in a mutually exclusive group because
 only one radio button in that group can be marked as [isChecked].

- **isHeader**: `SemanticsFlag`
  Whether a semantic node is a header that divides content into sections.

 For example, headers can be used to divide a list of alphabetically
 sorted words into the sections A, B, C, etc. as can be found in many
 address book applications.

- **isObscured**: `SemanticsFlag`
  Whether the value of the semantics node is obscured.

 This is usually used for text fields to indicate that its content
 is a password or contains other sensitive information.

- **isMultiline**: `SemanticsFlag`
  Whether the value of the semantics node is coming from a multi-line text
 field.

 This is used for text fields to distinguish single-line text fields from
 multi-line ones.

- **scopesRoute**: `SemanticsFlag`
  Whether the semantics node is the root of a subtree for which a route name
 should be announced.

 When a node with this flag is removed from the semantics tree, the
 framework will select the last in depth-first, paint order node with this
 flag.  When a node with this flag is added to the semantics tree, it is
 selected automatically, unless there were multiple nodes with this flag
 added.  In this case, the last added node in depth-first, paint order
 will be selected.

 From this selected node, the framework will search in depth-first, paint
 order for the first node with a [namesRoute] flag and a non-null,
 non-empty label. The [namesRoute] and [scopesRoute] flags may be on the
 same node. The label of the found node will be announced as an edge
 transition. If no non-empty, non-null label is found then:

   * VoiceOver will make a chime announcement.
   * TalkBack will make no announcement

 Semantic nodes annotated with this flag are generally not a11y focusable.

 This is used in widgets such as Routes, Drawers, and Dialogs to
 communicate significant changes in the visible screen.

- **namesRoute**: `SemanticsFlag`
  Whether the semantics node label is the name of a visually distinct
 route.

 This is used by certain widgets like Drawers and Dialogs, to indicate
 that the node's semantic label can be used to announce an edge triggered
 semantics update.

 Semantic nodes annotated with this flag will still receive a11y focus.

 Updating this label within the same active route subtree will not cause
 additional announcements.

- **isHidden**: `SemanticsFlag`
  Whether the semantics node is considered hidden.

 Hidden elements are currently not visible on screen. They may be covered
 by other elements or positioned outside of the visible area of a viewport.

 Hidden elements cannot gain accessibility focus though regular touch. The
 only way they can be focused is by moving the focus to them via linear
 navigation.

 Platforms are free to completely ignore hidden elements and new platforms
 are encouraged to do so.

 Instead of marking an element as hidden it should usually be excluded from
 the semantics tree altogether. Hidden elements are only included in the
 semantics tree to work around platform limitations and they are mainly
 used to implement accessibility scrolling on iOS.

 See also:

 * [RenderObject.describeSemanticsClip]

- **isImage**: `SemanticsFlag`
  Whether the semantics node represents an image.

 Both TalkBack and VoiceOver will inform the user the semantics node
 represents an image.

- **isLiveRegion**: `SemanticsFlag`
  Whether the semantics node is a live region.

 A live region indicates that updates to semantics node are important.
 Platforms may use this information to make polite announcements to the
 user to inform them of updates to this node.

 An example of a live region is a [SnackBar] widget. On Android and iOS,
 live region causes a polite announcement to be generated automatically,
 even if the widget does not have accessibility focus. This announcement
 may not be spoken if the OS accessibility services are already
 announcing something else, such as reading the label of a focused
 widget or providing a system announcement.

- **hasToggledState**: `SemanticsFlag`
  The semantics node has the quality of either being "on" or "off".

 This flag is mutually exclusive with [hasCheckedState].

 For example, a switch has toggled state.

 See also:

    * [SemanticsFlag.isToggled], which controls whether the node is "on" or "off".

- **isToggled**: `SemanticsFlag`
  If true, the semantics node is "on". If false, the semantics node is
 "off".

 For example, if a switch is in the on position, [isToggled] is true.

 See also:

   * [SemanticsFlag.hasToggledState], which enables a toggled state.

- **hasImplicitScrolling**: `SemanticsFlag`
  Whether the platform can scroll the semantics node when the user attempts
 to move focus to an offscreen child.

 For example, a [ListView] widget has implicit scrolling so that users can
 easily move the accessibility focus to the next set of children. A
 [PageView] widget does not have implicit scrolling, so that users don't
 navigate to the next page when reaching the end of the current one.

- **hasExpandedState**: `SemanticsFlag`
  The semantics node has the quality of either being "expanded" or "collapsed".

 For example, a [SubmenuButton] widget has expanded state.

 See also:

   * [SemanticsFlag.isExpanded], which controls whether the node is "expanded" or "collapsed".

- **isExpanded**: `SemanticsFlag`
  Whether a semantics node is expanded.

 If true, the semantics node is "expanded". If false, the semantics node is
 "collapsed".

 For example, if a [SubmenuButton] shows its children, [isExpanded] is true.

 See also:

   * [SemanticsFlag.hasExpandedState], which enables an expanded/collapsed state.

- **hasRequiredState**: `SemanticsFlag`
  The semantics node has the quality of either being required or not.

 See also:

   * [SemanticsFlag.isRequired], which controls whether the node is required.

- **isRequired**: `SemanticsFlag`
  Whether a semantics node is required.

 If true, user input is required on the semantics node before a form can
 be submitted.

 For example, a login form requires its email text field to be non-empty.

 See also:

   * [SemanticsFlag.hasRequiredState], which enables a required state state.

- **_kFlagById**: `Map&lt;int, SemanticsFlag&gt;`
  The possible semantics flags.

 The map's key is the [index] of the flag and the value is the flag itself.

## Constructors

### _


#### Parameters

- `index`: `dynamic`
- `name`: `dynamic`
