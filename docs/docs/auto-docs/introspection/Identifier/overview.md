# Overview for `Identifier`

## Description

A concrete reference to a named declaration, which may or may not yet be
 resolved.

 These can be passed directly to [Code] objects, which will automatically do
 any necessary prefixing when emitting references.

 Identifier equality/identity is not specified. To check for type equality, a
 [StaticType] should be used.

