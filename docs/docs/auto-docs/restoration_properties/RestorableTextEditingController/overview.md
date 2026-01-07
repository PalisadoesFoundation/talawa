# Overview for `RestorableTextEditingController`

## Description

A [RestorableProperty] that knows how to store and restore a
 [TextEditingController].

 The [TextEditingController] is accessible via the [value] getter. During
 state restoration, the property will restore [TextEditingController.text] to
 the value it had when the restoration data it is getting restored from was
 collected.

## Dependencies

- RestorableChangeNotifier

## Members

- **_initialValue**: `TextEditingValue`
## Constructors

### Unnamed Constructor
Creates a [RestorableTextEditingController].

 This constructor treats a null `text` argument as if it were the empty
 string.

### fromValue
Creates a [RestorableTextEditingController] from an initial
 [TextEditingValue].

 This constructor treats a null `value` argument as if it were
 [TextEditingValue.empty].

#### Parameters

- `value`: `TextEditingValue`
