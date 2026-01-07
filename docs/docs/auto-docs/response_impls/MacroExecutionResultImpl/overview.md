# Overview for `MacroExecutionResultImpl`

## Description

Implementation of [MacroExecutionResult].

## Dependencies

- MacroExecutionResult

## Members

- **diagnostics**: `List&lt;Diagnostic&gt;`
- **exception**: `MacroExceptionImpl?`
- **enumValueAugmentations**: `Map&lt;IdentifierImpl, List&lt;DeclarationCode&gt;&gt;`
- **extendsTypeAugmentations**: `Map&lt;IdentifierImpl, NamedTypeAnnotationCode&gt;`
- **interfaceAugmentations**: `Map&lt;IdentifierImpl, List&lt;TypeAnnotationCode&gt;&gt;`
- **libraryAugmentations**: `List&lt;DeclarationCode&gt;`
- **mixinAugmentations**: `Map&lt;IdentifierImpl, List&lt;TypeAnnotationCode&gt;&gt;`
- **newTypeNames**: `List&lt;String&gt;`
- **typeAugmentations**: `Map&lt;IdentifierImpl, List&lt;DeclarationCode&gt;&gt;`
## Constructors

### Unnamed Constructor


### deserialize


#### Parameters

- `deserializer`: `Deserializer`
