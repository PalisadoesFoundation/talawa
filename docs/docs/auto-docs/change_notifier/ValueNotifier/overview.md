# Overview for `ValueNotifier`

## Description

A [ChangeNotifier] that holds a single value.

 When [value] is replaced with something that is not equal to the old
 value as evaluated by the equality operator ==, this class notifies its
 listeners.

 ## Limitations

 Because this class only notifies listeners when the [value]'s _identity_
 changes, listeners will not be notified when mutable state within the
 value itself changes.

 For example, a `ValueNotifier&lt;List&lt;int&gt;&gt;` will not notify its listeners
 when the _contents_ of the list are changed.

 As a result, this class is best used with only immutable data types.

 For mutable data types, consider extending [ChangeNotifier] directly.

## Dependencies

- ChangeNotifier, ValueListenable

## Members

- **_value**: `T`
## Constructors

### Unnamed Constructor
Creates a [ChangeNotifier] that wraps this value.

