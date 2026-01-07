# Overview for `ScrollAction`

## Description

An [Action] that scrolls the relevant [Scrollable] by the amount configured
 in the [ScrollIntent] given to it.

 If a Scrollable cannot be found above the given [BuildContext], the
 [PrimaryScrollController] will be considered for default handling of
 [ScrollAction]s.

 If [Scrollable.incrementCalculator] is null for the scrollable, the default
 for a [ScrollIntent.type] set to [ScrollIncrementType.page] is 80% of the
 size of the scroll window, and for [ScrollIncrementType.line], 50 logical
 pixels.

## Dependencies

- ContextAction

