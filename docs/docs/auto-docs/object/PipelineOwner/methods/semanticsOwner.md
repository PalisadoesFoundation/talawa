# Method: `semanticsOwner`

## Description

The object that is managing semantics for this pipeline owner, if any.

 An owner is created by [ensureSemantics] or when the [PipelineManifold] to
 which this owner is connected has [PipelineManifold.semanticsEnabled] set
 to true. The owner is valid for as long as
 [PipelineManifold.semanticsEnabled] remains true or while there are
 outstanding [SemanticsHandle]s from calls to [ensureSemantics]. The
 [semanticsOwner] field will revert to null once both conditions are no
 longer met.

 When [semanticsOwner] is null, the [PipelineOwner] skips all steps
 relating to semantics.

## Return Type
`SemanticsOwner?`

