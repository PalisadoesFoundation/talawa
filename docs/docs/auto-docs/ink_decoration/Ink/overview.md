# Overview for `Ink`

## Description

A convenience widget for drawing images and other decorations on [Material]
 widgets, so that [InkWell] and [InkResponse] splashes will render over them.

 Ink splashes and highlights, as rendered by [InkWell] and [InkResponse],
 draw on the actual underlying [Material], under whatever widgets are drawn
 over the material (such as [Text] and [Icon]s). If an opaque image is drawn
 over the [Material] (maybe using a [Container] or [DecoratedBox]), these ink
 effects will not be visible, as they will be entirely obscured by the opaque
 graphics drawn above the [Material].

 This widget draws the given [Decoration] directly on the [Material], in the
 same way that [InkWell] and [InkResponse] draw there. This allows the
 splashes to be drawn above the otherwise opaque graphics.

 An alternative solution is to use a [MaterialType.transparency] material
 above the opaque graphics, so that the ink responses from [InkWell]s and
 [InkResponse]s will be drawn on the transparent material on top of the
 opaque graphics, rather than under the opaque graphics on the underlying
 [Material].

 ## Limitations

 This widget is subject to the same limitations as other ink effects, as
 described in the documentation for [Material]. Most notably, the position of
 an [Ink] widget must not change during the lifetime of the [Material] object
 unless a [LayoutChangedNotification] is dispatched each frame that the
 position changes. This is done automatically for [ListView] and other
 scrolling widgets, but is not done for animated transitions such as
 [SlideTransition].

 Additionally, if multiple [Ink] widgets paint on the same [Material] in the
 same location, their relative order is not guaranteed. The decorations will
 be painted in the order that they were added to the material, which
 generally speaking will match the order they are given in the widget tree,
 but this order may appear to be somewhat random in more dynamic situations.

 

 This example shows how a [Material] widget can have a yellow rectangle drawn
 on it using [Ink], while still having ink effects over the yellow rectangle:

 ```dart
 Material(
   color: Colors.teal[900],
   child: Center(
     child: Ink(
       color: Colors.yellow,
       width: 200.0,
       height: 100.0,
       child: InkWell(
         onTap:  ,
         child: const Center(
           child: Text('YELLOW'),
         )
       ),
     ),
   ),
 )
 ```
 
 

 The following example shows how an image can be printed on a [Material]
 widget with an [InkWell] above it:

 ```dart
 Material(
   color: Colors.grey[800],
   child: Center(
     child: Ink.image(
       image: const AssetImage('cat.jpeg'),
       fit: BoxFit.cover,
       width: 300.0,
       height: 200.0,
       child: InkWell(
         onTap:  ,
         child: const Align(
           alignment: Alignment.topLeft,
           child: Padding(
             padding: EdgeInsets.all(10.0),
             child: Text(
               'KITTEN',
               style: TextStyle(
                 fontWeight: FontWeight.w900,
                 color: Colors.white,
               ),
             ),
           ),
         )
       ),
     ),
   ),
 )
 ```
 

 What to do if you want to clip this [Ink.image]?

 
 Wrapping the [Ink] in a clipping widget directly will not work since the
 [Material] it will be printed on is responsible for clipping.

 In this example the image is not being clipped as expected. This is because
 it is being rendered onto the Scaffold body Material, which isn't wrapped in
 the [ClipRRect].

 ** See code in examples/api/lib/material/ink/ink.image_clip.0.dart **
 

 
 One solution would be to deliberately wrap the [Ink.image] in a [Material].
 This makes sure the Material that the image is painted on is also responsible
 for clipping said content.

 ** See code in examples/api/lib/material/ink/ink.image_clip.1.dart **
 

 See also:

  * [Container], a more generic form of this widget which paints itself,
    rather that deferring to the nearest [Material] widget.
  * [InkDecoration], the [InkFeature] subclass used by this widget to paint
    on [Material] widgets.
  * [InkWell] and [InkResponse], which also draw on [Material] widgets.

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget?`
  The [child] contained by the container.

 

- **padding**: `EdgeInsetsGeometry?`
  Empty space to inscribe inside the [decoration]. The [child], if any, is
 placed inside this padding.

 This padding is in addition to any padding inherent in the [decoration];
 see [Decoration.padding].

- **decoration**: `Decoration?`
  The decoration to paint on the nearest ancestor [Material] widget.

 A shorthand for specifying just a solid color is available in the
 constructor: set the `color` argument instead of the [decoration]
 argument.

 A shorthand for specifying just an image is also available using the
 [Ink.image] constructor.

- **width**: `double?`
  A width to apply to the [decoration] and the [child]. The width includes
 any [padding].

- **height**: `double?`
  A height to apply to the [decoration] and the [child]. The height includes
 any [padding].

## Constructors

### Unnamed Constructor
Paints a decoration (which can be a simple color) on a [Material].

 The [height] and [width] values include the [padding].

 The `color` argument is a shorthand for
 `decoration: BoxDecoration(color: color)`, which means you cannot supply
 both a `color` and a `decoration` argument. If you want to have both a
 `color` and a `decoration`, you can pass the color as the `color`
 argument to the `BoxDecoration`.

 If there is no intention to render anything on this decoration, consider
 using a [Container] with a [BoxDecoration] instead.

### image
Creates a widget that shows an image (obtained from an [ImageProvider]) on
 a [Material].

 This argument is a shorthand for passing a [BoxDecoration] that has only
 its [BoxDecoration.image] property set to the [Ink] constructor. The
 properties of the [DecorationImage] of that [BoxDecoration] are set
 according to the arguments passed to this method.

 If there is no intention to render anything on this image, consider using
 a [Container] with a [BoxDecoration.image] instead. The `onImageError`
 argument may be provided to listen for errors when resolving the image.

 The `alignment`, `repeat`, and `matchTextDirection` arguments must not
 be null either, but they have default values.

 See [paintImage] for a description of the meaning of these arguments.

#### Parameters

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
