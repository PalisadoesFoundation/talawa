# Method: `collapse`

## Description

Collapses the [Expansible] that was built with this controller.

 If the widget is already in the collapsed state (see [isExpanded]),
 calling this method has no effect.

 Calling this method may cause the [Expansible] to rebuild, so it may not
 be called from a build method.

 Calling this method will notify registered listeners of this controller
 that the expansion state has changed.

 See also:

  * [expand], which expands the [Expansible].
  * [isExpanded] to check whether the [Expansible] is expanded.

## Return Type
`void`

