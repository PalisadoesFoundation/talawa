# Method: `physicalConstraints`

## Description

The sizing constraints in physical pixels for this view.

 The view can take on any [Size] that fulfills these constraints. These
 constraints are typically used by an UI framework as the input for its
 layout algorithm to determine an approrpiate size for the view. To size
 the view, the selected size must be provided to the [render] method and it
 must satisfy the constraints.

 When this changes, [PlatformDispatcher.onMetricsChanged] is called.

 At startup, the constraints for the view may not be known before Dart code
 runs. If this value is observed early in the application lifecycle, it may
 report constraints with all dimensions set to zero.

 This value does not take into account any on-screen keyboards or other
 system UI. If the constraints are tight, the [padding] and [viewInsets]
 properties provide information about how much of each side of the view may
 be obscured by system UI. If the constraints are loose, this information
 is not known upfront.

 See also:

  * [physicalSize], which returns the current size of the view.

## Return Type
`ViewConstraints`

