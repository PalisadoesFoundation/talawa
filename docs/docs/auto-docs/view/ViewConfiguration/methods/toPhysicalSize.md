# Method: `toPhysicalSize`

## Description

Transforms the provided [Size] in logical pixels to physical pixels.

 The [ui.FlutterView.render] method accepts only sizes in physical pixels, but
 the framework operates in logical pixels. This method is used to transform
 the logical size calculated for a [RenderView] back to a physical size
 suitable to be passed to [ui.FlutterView.render].

 By default, this method just multiplies the provided [Size] with the
 [devicePixelRatio] and constraints the results to the
 [physicalConstraints].

## Return Type
`Size`

## Parameters

- `logicalSize`: `Size`
