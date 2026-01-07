# Method: `overlayEntry`

## Description

The magnifier's [OverlayEntry], if currently in the overlay.

 This is exposed so that other overlay entries can be positioned above or
 below this [overlayEntry]. Anything in the paint order after the
 [RawMagnifier] in this [OverlayEntry] will not be displayed in the
 magnifier; if it is desired for an overlay entry to be displayed in the
 magnifier, it _must_ be positioned below the magnifier.

 
 ```dart
 void magnifierShowExample(BuildContext context) 
 ```
 

 To check if a magnifier is in the overlay, use [shown]. The [overlayEntry]
 field may be non-null even when the magnifier is not visible.

## Return Type
`OverlayEntry?`

