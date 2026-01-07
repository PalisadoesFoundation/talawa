# Method: `buildAugmentationLibrary`

## Description

Combines multiple [MacroExecutionResult]s into a single library
 augmentation file, and returns a [String] representing that file.

 The [resolveDeclaration] argument should return the [TypeDeclaration] for
 an [Identifier] pointing at a named type in the library being augmented
 (note this could be a type that was added in the "types" phase).

 The [resolveIdentifier] argument should return the import uri to be used
 for that identifier.

 The [inferOmittedType] argument is used to get the inferred type for a
 given [OmittedTypeAnnotation].

 If [omittedTypes] is provided, [inferOmittedType] is allowed to return
 `null` for types that have not yet been inferred. In this case a fresh
 name will be used for the omitted type in the generated library code and
 the omitted type will be mapped to the fresh name in [omittedTypes].

 The generated library files content must be deterministic, including the
 generation of fresh names for import prefixes and omitted types.

 If [spans] is provided, the [Span]s for the generated source are added
 to [spans]. This is used to compute the offset relation between
 intermediate augmentation libraries and the merged augmentation library.

## Return Type
`String`

## Parameters

- `augmentedLibraryUri`: `Uri`
- `macroResults`: `Iterable&lt;MacroExecutionResult&gt;`
- `resolveDeclaration`: `TypeDeclaration Function(Identifier)`
- `resolveIdentifier`: `ResolvedIdentifier Function(Identifier)`
- `inferOmittedType`: `TypeAnnotation? Function(OmittedTypeAnnotation)`
- ``: `dynamic`
- ``: `dynamic`
