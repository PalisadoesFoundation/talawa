# Method: `shouldInherit`

## Description

Returns true if this PrimaryScrollController is configured to be
 automatically inherited for the current [TargetPlatform] and the given
 [Axis].

 This method is typically not called directly. [ScrollView] will call this
 method if it has not been provided a [ScrollController] and
 [ScrollView.primary] is unset.

 If a ScrollController has already been provided to
 [ScrollView.controller], or [ScrollView.primary] is set, this is method is
 not called by ScrollView as it will have determined whether or not to
 inherit the PrimaryScrollController.

## Return Type
`bool`

## Parameters

- `context`: `BuildContext`
- `scrollDirection`: `Axis`
