# Method: `fromImageProvider`

## Description

Generate a [ColorScheme] derived from the given `imageProvider`.

 Material Color Utilities extracts the dominant color from the
 supplied [ImageProvider]. Using this color, a [ColorScheme] is generated
 with harmonious colors that meet contrast requirements for accessibility.

 If any of the optional color parameters are non-null, they will be
 used in place of the generated colors for that field in the resulting
 [ColorScheme]. This allows apps to override specific colors for their
 needs.

 Given the nature of the algorithm, the most dominant color of the
 `imageProvider` may not wind up as one of the [ColorScheme] colors.

 The provided image will be scaled down to a maximum size of 112x112 pixels
 during color extraction.

 
 This sample shows how to use [ColorScheme.fromImageProvider] to create
 content-based dynamic color schemes.

 ** See code in examples/api/lib/material/color_scheme/dynamic_content_color.0.dart **
 

 See also:

  * [M3 Guidelines: Dynamic color from content](https://m3.material.io/styles/color/dynamic-color/user-generated-color#8af550b9-a19e-4e9f-bb0a-7f611fed5d0f)
  * <https://pub.dev/packages/dynamic_color>, a package to create
    [ColorScheme]s based on a platform's implementation of dynamic color.
  * <https://m3.material.io/styles/color/the-color-system/color-roles>, the
    Material 3 Color system specification.
  * <https://pub.dev/packages/material_color_utilities>, the package
    used to algorithmically determine the dominant color and to generate
    the [ColorScheme].

## Return Type
`Future&lt;ColorScheme&gt;`

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
