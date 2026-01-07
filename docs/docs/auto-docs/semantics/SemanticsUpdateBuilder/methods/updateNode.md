# Method: `updateNode`

## Description

Update the information associated with the node with the given `id`.

 The semantics nodes form a tree, with the root of the tree always having
 an id of zero. The `childrenInTraversalOrder` and `childrenInHitTestOrder`
 are the ids of the nodes that are immediate children of this node. The
 former enumerates children in traversal order, and the latter enumerates
 the same children in the hit test order. The two lists must have the same
 length and contain the same ids. They may only differ in the order the
 ids are listed in. For more information about different child orders, see
 [DebugSemanticsDumpOrder].

 The system retains the nodes that are currently reachable from the root.
 A given update need not contain information for nodes that do not change
 in the update. If a node is not reachable from the root after an update,
 the node will be discarded from the tree.

 The `flags` are a bit field of [SemanticsFlag]s that apply to this node.

 The `actions` are a bit field of [SemanticsAction]s that can be undertaken
 by this node. If the user wishes to undertake one of these actions on this
 node, the [PlatformDispatcher.onSemanticsActionEvent] will be called with
 a [SemanticsActionEvent] specifying the action to be performed. Because
 the semantics tree is maintained asynchronously, the
 [PlatformDispatcher.onSemanticsActionEvent] callback might be called with
 an action that is no longer possible.

 The `identifier` is a string that describes the node for UI automation
 tools that work by querying the accessibility hierarchy, such as Android
 UI Automator, iOS XCUITest, or Appium. It's not exposed to users.

 The `label` is a string that describes this node. The `value` property
 describes the current value of the node as a string. The `increasedValue`
 string will become the `value` string after a [SemanticsAction.increase]
 action is performed. The `decreasedValue` string will become the `value`
 string after a [SemanticsAction.decrease] action is performed. The `hint`
 string describes what result an action performed on this node has. The
 reading direction of all these strings is given by `textDirection`.

 The `labelAttributes`, `valueAttributes`, `hintAttributes`,
 `increasedValueAttributes`, and `decreasedValueAttributes` are the lists of
 [StringAttribute] carried by the `label`, `value`, `hint`, `increasedValue`,
 and `decreasedValue` respectively. Their contents must not be changed during
 the semantics update.

 The `tooltip` is a string that describe additional information when user
 hover or long press on the backing widget of this semantics node.

 The fields `textSelectionBase` and `textSelectionExtent` describe the
 currently selected text within `value`. A value of -1 indicates no
 current text selection base or extent.

 The field `maxValueLength` is used to indicate that an editable text
 field has a limit on the number of characters entered. If it is -1 there
 is no limit on the number of characters entered. The field
 `currentValueLength` indicates how much of that limit has already been
 used up. When `maxValueLength` is >= 0, `currentValueLength` must also be
 >= 0, otherwise it should be specified to be -1.

 The field `platformViewId` references the platform view, whose semantics
 nodes will be added as children to this node. If a platform view is
 specified, `childrenInHitTestOrder` and `childrenInTraversalOrder` must
 be empty. A value of -1 indicates that this node is not associated with a
 platform view.

 For scrollable nodes `scrollPosition` describes the current scroll
 position in logical pixel. `scrollExtentMax` and `scrollExtentMin`
 describe the maximum and minimum in-range values that `scrollPosition` can
 be. Both or either may be infinity to indicate unbound scrolling. The
 value for `scrollPosition` can (temporarily) be outside this range, for
 example during an overscroll. `scrollChildren` is the count of the
 total number of child nodes that contribute semantics and `scrollIndex`
 is the index of the first visible child node that contributes semantics.

 The `rect` is the region occupied by this node in its own coordinate
 system.

 The `transform` is a matrix that maps this node's coordinate system into
 its parent's coordinate system.

 The `elevation` describes the distance in z-direction between this node
 and the `elevation` of the parent.

 The `thickness` describes how much space this node occupies in the
 z-direction starting at `elevation`. Basically, in the z-direction the
 node starts at `elevation` above the parent and ends at `elevation` +
 `thickness` above the parent.

 The `headingLevel` describes that this node is a heading and the hierarchy
 level this node represents as a heading. A value of 0 indicates that this
 node is not a heading. A value of 1 or greater indicates that this node is
 a heading at the specified level. The valid value range is from 1 to 6,
 inclusive. This attribute is only used for Web platform, and it will have
 no effect on other platforms.

 The `linkUrl` describes the URI that this node links to. If the node is
 not a link, this should be an empty string.

 The `role` describes the role of this node. Defaults to
 [SemanticsRole.none] if not set.

 If `validationResult` is not null, indicates the result of validating a
 form field. If null, indicates that the node is not being validated, or
 that the result is unknown. Form fields that validate user input but do
 not use this argument should use other ways to communicate validation
 errors to the user, such as embedding validation error text in the label.

 See also:

  * https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/heading_role
  * https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-level
  * [SemanticsValidationResult], that describes possible values for the
    `validationResult` argument.

## Return Type
`void`

## Parameters

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
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
