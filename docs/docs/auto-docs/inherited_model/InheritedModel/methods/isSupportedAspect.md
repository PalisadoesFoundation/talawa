# Method: `isSupportedAspect`

## Description

Returns true if this model supports the given [aspect].

 Returns true by default: this model supports all aspects.

 Subclasses may override this method to indicate that they do not support
 all model aspects. This is typically done when a model can be used
 to "shadow" some aspects of an ancestor.

## Return Type
`bool`

## Parameters

- `aspect`: `Object`
