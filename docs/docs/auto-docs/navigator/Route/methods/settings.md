# Method: `settings`

## Description

The settings for this route.

 See [RouteSettings] for details.

 The settings can change during the route's lifetime. If the settings
 change, the route's overlays will be marked dirty (see
 [changedInternalState]).

 If the route is created from a [Page] in the [Navigator.pages] list, then
 this will be a [Page] subclass, and it will be updated each time its
 corresponding [Page] in the [Navigator.pages] has changed. Once the
 [Route] is removed from the history, this value stops updating (and
 remains with its last value).

## Return Type
`RouteSettings`

