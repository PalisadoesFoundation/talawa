# Overview for `InkWell`

## Description

A rectangular area of a [Material] that responds to touch.

 For a variant of this widget that does not clip splashes, see [InkResponse].

 The following diagram shows how an [InkWell] looks when tapped, when using
 default values.

 ![The highlight is a rectangle the size of the box.](https://flutter.github.io/assets-for-api-docs/assets/material/ink_well.png)

 The [InkWell] widget must have a [Material] widget as an ancestor. The
 [Material] widget is where the ink reactions are actually painted. This
 matches the Material Design premise wherein the [Material] is what is
 actually reacting to touches by spreading ink.

 If a Widget uses this class directly, it should include the following line
 at the top of its build function to call [debugCheckHasMaterial]:

 ```dart
 assert(debugCheckHasMaterial(context));
 ```

 ## Troubleshooting

 ### The ink splashes aren't visible!

 If there is an opaque graphic, e.g. painted using a [Container], [Image], or
 [DecoratedBox], between the [Material] widget and the [InkWell] widget, then
 the splash won't be visible because it will be under the opaque graphic.
 This is because ink splashes draw on the underlying [Material] itself, as
 if the ink was spreading inside the material.

 The [Ink] widget can be used as a replacement for [Image], [Container], or
 [DecoratedBox] to ensure that the image or decoration also paints in the
 [Material] itself, below the ink.

 If this is not possible for some reason, e.g. because you are using an
 opaque [CustomPaint] widget, alternatively consider using a second
 [Material] above the opaque widget but below the [InkWell] (as an
 ancestor to the ink well). The [MaterialType.transparency] material
 kind can be used for this purpose.

 ### InkWell isn't clipping properly

 If you want to clip an InkWell or any [Ink] widgets you need to keep in mind
 that the [Material] that the Ink will be printed on is responsible for clipping.
 This means you can't wrap the [Ink] widget in a clipping widget directly,
 since this will leave the [Material] not clipped (and by extension the printed
 [Ink] widgets as well).

 An easy solution is to deliberately wrap the [Ink] widgets you want to clip
 in a [Material], and wrap that in a clipping widget instead. See [Ink] for
 an example.

 ### The ink splashes don't track the size of an animated container
 If the size of an InkWell's [Material] ancestor changes while the InkWell's
 splashes are expanding, you may notice that the splashes aren't clipped
 correctly. This can't be avoided.

 An example of this situation is as follows:

 
 Tap the container to cause it to grow. Then, tap it again and hold before
 the widget reaches its maximum size to observe the clipped ink splash.

 ** See code in examples/api/lib/material/ink_well/ink_well.0.dart **
 

 An InkWell's splashes will not properly update to conform to changes if the
 size of its underlying [Material], where the splashes are rendered, changes
 during animation. You should avoid using InkWells within [Material] widgets
 that are changing size.

 See also:

  * [GestureDetector], for listening for gestures without ink splashes.
  * [ElevatedButton] and [TextButton], two kinds of buttons in Material Design.
  * [InkResponse], a variant of [InkWell] that doesn't force a rectangular
    shape on the ink reaction.

## Dependencies

- InkResponse

## Constructors

### Unnamed Constructor
Creates an ink well.

 Must have an ancestor [Material] widget in which to cause ink reactions.

