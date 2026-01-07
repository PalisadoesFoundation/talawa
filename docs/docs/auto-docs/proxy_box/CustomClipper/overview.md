# Overview for `CustomClipper`

## Description

An interface for providing custom clips.

 This class is used by a number of clip widgets (e.g., [ClipRect] and
 [ClipPath]).

 The [getClip] method is called whenever the custom clip needs to be updated.

 The [shouldReclip] method is called when a new instance of the class
 is provided, to check if the new instance actually represents different
 information.

 The most efficient way to update the clip provided by this class is to
 supply a `reclip` argument to the constructor of the [CustomClipper]. The
 custom object will listen to this animation and update the clip whenever the
 animation ticks, avoiding both the build and layout phases of the pipeline.

 See also:

  * [ClipRect], which can be customized with a [CustomClipper&lt;Rect&gt;].
  * [ClipRRect], which can be customized with a [CustomClipper&lt;RRect&gt;].
  * [ClipOval], which can be customized with a [CustomClipper&lt;Rect&gt;].
  * [ClipPath], which can be customized with a [CustomClipper&lt;Path&gt;].
  * [ShapeBorderClipper], for specifying a clip path using a [ShapeBorder].

## Dependencies

- Listenable

## Members

- **_reclip**: `Listenable?`
## Constructors

### Unnamed Constructor
Creates a custom clipper.

 The clipper will update its clip whenever [reclip] notifies its listeners.

