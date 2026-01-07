# Method: `popDisposition`

## Description

Returns whether calling [Navigator.maybePop] when this [Route] is current
 ([isCurrent]) should do anything.

 [Navigator.maybePop] is usually used instead of [Navigator.pop] to handle
 the system back button, when it hasn't been disabled via
 [SystemNavigator.setFrameworkHandlesBack].

 By default, if a [Route] is the first route in the history (i.e., if
 [isFirst]), it reports that pops should be bubbled
 ([RoutePopDisposition.bubble]). This behavior prevents the user from
 popping the first route off the history and being stranded at a blank
 screen; instead, the larger scope is popped (e.g. the application quits,
 so that the user returns to the previous application).

 In other cases, the default behavior is to accept the pop
 ([RoutePopDisposition.pop]).

 The third possible value is [RoutePopDisposition.doNotPop], which causes
 the pop request to be ignored entirely.

 See also:

  * [Form], which provides a [Form.canPop] boolean that is similar.
  * [PopScope], a widget that provides a way to intercept the back button.
  * [Page.canPop], a way for [Page] to affect this property.

## Return Type
`RoutePopDisposition`

