# Method: `getDefaultMaxLengthEnforcement`

## Description

Returns a [MaxLengthEnforcement] that follows the specified [platform]'s
 convention.

 
 ### Platform specific behaviors

 Different platforms follow different behaviors by default, according to
 their native behavior.
  * Android, Windows: [MaxLengthEnforcement.enforced]. The native behavior
    of these platforms is enforced. The composing will be handled by the
    IME while users are entering CJK characters.
  * iOS: [MaxLengthEnforcement.truncateAfterCompositionEnds]. iOS has no
    default behavior and it requires users implement the behavior
    themselves. Allow the composition to exceed to avoid breaking CJK input.
  * Web, macOS, linux, fuchsia:
    [MaxLengthEnforcement.truncateAfterCompositionEnds]. These platforms
    allow the composition to exceed by default.
 

## Return Type
`MaxLengthEnforcement`

## Parameters

- ``: `dynamic`
