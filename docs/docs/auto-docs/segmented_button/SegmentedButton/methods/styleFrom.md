# Method: `styleFrom`

## Description

A static convenience method that constructs a segmented button
 [ButtonStyle] given simple values.

 The [foregroundColor], [selectedForegroundColor], and [disabledForegroundColor]
 colors are used to create a [WidgetStateProperty] [ButtonStyle.foregroundColor],
 and a derived [ButtonStyle.overlayColor] if [overlayColor] isn't specified.

 If [overlayColor] is specified and its value is [Colors.transparent]
 then the pressed/focused/hovered highlights are effectively defeated.
 Otherwise a [WidgetStateProperty] with the same opacities as the
 default is created.

 The [backgroundColor], [selectedBackgroundColor] and [disabledBackgroundColor]
 colors are used to create a [WidgetStateProperty] [ButtonStyle.backgroundColor].

 Similarly, the [enabledMouseCursor] and [disabledMouseCursor]
 parameters are used to construct [ButtonStyle.mouseCursor].

 The [iconColor], [disabledIconColor] are used to construct
 [ButtonStyle.iconColor] and [iconSize] is used to construct
 [ButtonStyle.iconSize].

 All of the other parameters are either used directly or used to
 create a [WidgetStateProperty] with a single value for all
 states.

 All parameters default to null. By default this method returns
 a [ButtonStyle] that doesn't override anything.

 

 For example, to override the default text and icon colors for a
 [SegmentedButton], as well as its overlay color, with all of the
 standard opacity adjustments for the pressed, focused, and
 hovered states, one could write:

 ** See code in examples/api/lib/material/segmented_button/segmented_button.1.dart **

 ```dart
 SegmentedButton&lt;int&gt;(
   style: SegmentedButton.styleFrom(
     foregroundColor: Colors.black,
     selectedForegroundColor: Colors.white,
     backgroundColor: Colors.amber,
     selectedBackgroundColor: Colors.red,
   ),
   segments: const <ButtonSegment&lt;int>&gt;[
     ButtonSegment&lt;int&gt;(
       value: 0,
       label: Text('0'),
       icon: Icon(Icons.calendar_view_day),
     ),
     ButtonSegment&lt;int&gt;(
       value: 1,
       label: Text('1'),
       icon: Icon(Icons.calendar_view_week),
     ),
   ],
   selected: const <int>,
   onSelectionChanged: (Set&lt;int&gt; selection) ,
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
- ``: `dynamic`
- ``: `dynamic`
