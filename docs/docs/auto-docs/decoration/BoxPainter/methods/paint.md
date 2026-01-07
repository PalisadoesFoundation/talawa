# Method: `paint`

## Description

Paints the [Decoration] for which this object was created on the
 given canvas using the given configuration.

 The [ImageConfiguration] object passed as the third argument must, at a
 minimum, have a non-null [Size].

 If this object caches resources for painting (e.g. [Paint] objects), the
 cache may be flushed when [paint] is called with a new configuration. For
 this reason, it may be more efficient to call
 [Decoration.createBoxPainter] for each different rectangle that is being
 painted in a particular frame.

 For example, if a decoration's owner wants to paint a particular
 decoration once for its whole size, and once just in the bottom
 right, it might get two [BoxPainter] instances, one for each.
 However, when its size changes, it could continue using those
 same instances, since the previous resources would no longer be
 relevant and thus losing them would not be an issue.

 Implementations should paint their decorations on the canvas in a
 rectangle whose top left corner is at the given `offset` and whose size is
 given by `configuration.size`.

 When a [Decoration] is painted in a [Container] or [DecoratedBox] (which
 is what [Container] uses), the [ImageConfiguration.textDirection] property
 will be populated based on the ambient [Directionality].

## Return Type
`void`

## Parameters

- `canvas`: `Canvas`
- `offset`: `Offset`
- `configuration`: `ImageConfiguration`
