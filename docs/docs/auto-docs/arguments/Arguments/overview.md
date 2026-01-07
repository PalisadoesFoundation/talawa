# Overview for `Arguments`

## Description

The arguments passed to a macro constructor.

 All argument instances must be of type [Code] or a built-in value type that
 is serializable (num, bool, String, null, etc).

## Dependencies

- Serializable

## Members

- **positional**: `List&lt;Argument&gt;`
- **named**: `Map&lt;String, Argument&gt;`
## Constructors

### Unnamed Constructor


### deserialize


#### Parameters

- `deserializer`: `Deserializer`
