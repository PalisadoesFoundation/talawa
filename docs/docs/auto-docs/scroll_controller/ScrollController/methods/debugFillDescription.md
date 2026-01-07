# Method: `debugFillDescription`

## Description

Add additional information to the given description for use by [toString].

 This method makes it easier for subclasses to coordinate to provide a
 high-quality [toString] implementation. The [toString] implementation on
 the [ScrollController] base class calls [debugFillDescription] to collect
 useful information from subclasses to incorporate into its return value.

 Implementations of this method should start with a call to the inherited
 method, as in `super.debugFillDescription(description)`.

## Return Type
`void`

## Parameters

- `description`: `List&lt;String&gt;`
