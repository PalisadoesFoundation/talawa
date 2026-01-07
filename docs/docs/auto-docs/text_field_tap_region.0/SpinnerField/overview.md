# Overview for `SpinnerField`

## Description

A generic "spinner" field example which adds extra buttons next to a
 [TextField] to increment and decrement the value.

 This widget uses [TextFieldTapRegion] to indicate that tapping on the
 spinner buttons should not cause the text field to lose focus.

## Dependencies

- StatefulWidget

## Members

- **value**: `T`
- **increment**: `T Function(T value)?`
- **decrement**: `T Function(T value)?`
- **asString**: `String Function(T value)`
- **fromString**: `T Function(String value)`
- **onChanged**: `ValueChanged&lt;T&gt;?`
- **inputFormatters**: `List&lt;TextInputFormatter&gt;`
- **autofocus**: `bool`
## Constructors

### Unnamed Constructor


