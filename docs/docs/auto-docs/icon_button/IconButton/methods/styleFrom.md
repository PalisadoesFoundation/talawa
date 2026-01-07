# Method: `styleFrom`

## Description

A static convenience method that constructs an icon button
 [ButtonStyle] given simple values. This method is only used for Material 3.

 The [foregroundColor] color is used to create a [WidgetStateProperty]
 [ButtonStyle.foregroundColor] value. Specify a value for [foregroundColor]
 to specify the color of the button's icons. The [hoverColor], [focusColor]
 and [highlightColor] colors are used to indicate the hover, focus,
 and pressed states if [overlayColor] isn't specified.

 If [overlayColor] is specified and its value is [Colors.transparent]
 then the pressed/focused/hovered highlights are effectively defeated.
 Otherwise a [WidgetStateProperty] with the same opacities as the
 default is created.

 Use [backgroundColor] for the button's background fill color. Use [disabledForegroundColor]
 and [disabledBackgroundColor] to specify the button's disabled icon and fill color.

 Similarly, the [enabledMouseCursor] and [disabledMouseCursor]
 parameters are used to construct [ButtonStyle].mouseCursor.

 All of the other parameters are either used directly or used to
 create a [WidgetStateProperty] with a single value for all
 states.

 All parameters default to null, by default this method returns
 a [ButtonStyle] that doesn't override anything.

 For example, to override the default icon color for a
 [IconButton], as well as its overlay color, with all of the
 standard opacity adjustments for the pressed, focused, and
 hovered states, one could write:

 ```dart
 IconButton(
   icon: const Icon(Icons.pets),
   style: IconButton.styleFrom(foregroundColor: Colors.green),
   onPressed:  ,
 ),
 ```

## Return Type
`ButtonStyle`

## Parameters

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
