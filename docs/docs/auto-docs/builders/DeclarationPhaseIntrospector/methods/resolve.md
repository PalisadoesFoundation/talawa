# Method: `resolve`

## Description

Instantiates a new [StaticType] for a given [type] annotation.

 Throws if [type] is a [RawTypeAnnotationCode], more specific subtypes must
 be used, as raw [Identifier]s are not allowed.

 Throws an error if the [type] object contains [Identifier]s which cannot
 be resolved. This should only happen in the case of incomplete or invalid
 programs, but macros may be asked to run in this state during the
 development cycle. It may be helpful for users if macros provide a best
 effort implementation in that case or handle the error in a useful way.

## Return Type
`Future&lt;StaticType&gt;`

## Parameters

- `type`: `TypeAnnotationCode`
