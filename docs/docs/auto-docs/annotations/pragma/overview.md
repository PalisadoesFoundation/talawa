# Overview for `pragma`

## Description

A hint to tools.

 Tools that work with Dart programs may accept hints to guide their behavior
 as `pragma` annotations on declarations.
 Each tool decides which hints it accepts, what they mean, and whether and
 how they apply to sub-parts of the annotated entity.

 Tools that recognize pragma hints should pick a pragma prefix to identify
 the tool. They should recognize any hint with a [name] starting with their
 prefix followed by `:` as if it was intended for that tool. A hint with a
 prefix for another tool should be ignored (unless compatibility with that
 other tool is a goal).

 A tool may recognize unprefixed names as well, if they would recognize that
 name with their own prefix in front.

 If the hint can be parameterized,
 an extra [options] object can be added as well.

 For example:

 ```dart template:top
 @pragma('Tool:pragma-name', [param1, param2, ...])
 class Foo 

 @pragma('OtherTool:other-pragma')
 void  
 ```

 Here class `Foo` is annotated with a Tool specific pragma 'pragma-name' and
 function `foo` is annotated with a pragma 'other-pragma'
 specific to OtherTool.

## Members

- **name**: `String`
  The name of the hint.

 A string that is recognized by one or more tools, or such a string prefixed
 by a tool identifier and a colon, which is only recognized by that
 particular tool.

- **options**: `Object?`
  Optional extra data parameterizing the hint.

## Constructors

### Unnamed Constructor
Creates a hint named [name] with optional [options].

### _


#### Parameters

- `name`: `dynamic`
- ``: `dynamic`
