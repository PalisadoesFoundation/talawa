# Method: `notificationContext`

## Description

The [BuildContext] that should be used when dispatching
 [ScrollNotification]s.

 This context is typically different that the context of the scrollable
 widget itself. For example, [Scrollable] uses a context outside the
 [Viewport] but inside the widgets created by
 [ScrollBehavior.buildOverscrollIndicator] and [ScrollBehavior.buildScrollbar].

## Return Type
`BuildContext?`

