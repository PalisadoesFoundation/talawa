# Overview for `AsyncSnapshot`

## Description

Immutable representation of the most recent interaction with an asynchronous
 computation.

 See also:

  * [StreamBuilder], which builds itself based on a snapshot from interacting
    with a [Stream].
  * [FutureBuilder], which builds itself based on a snapshot from interacting
    with a [Future].

## Members

- **connectionState**: `ConnectionState`
  Current state of connection to the asynchronous computation.

- **data**: `T?`
  The latest data received by the asynchronous computation.

 If this is non-null, [hasData] will be true.

 If [error] is not null, this will be null. See [hasError].

 If the asynchronous computation has never returned a value, this may be
 set to an initial data value specified by the relevant widget. See
 [FutureBuilder.initialData] and [StreamBuilder.initialData].

- **error**: `Object?`
  The latest error object received by the asynchronous computation.

 If this is non-null, [hasError] will be true.

 If [data] is not null, this will be null.

- **stackTrace**: `StackTrace?`
  The latest stack trace object received by the asynchronous computation.

 This will not be null iff [error] is not null. Consequently, [stackTrace]
 will be non-null when [hasError] is true.

 However, even when not null, [stackTrace] might be empty. The stack trace
 is empty when there is an error but no stack trace has been provided.

## Constructors

### _
Creates an [AsyncSnapshot] with the specified [connectionState],
 and optionally either [data] or [error] with an optional [stackTrace]
 (but not both data and error).

#### Parameters

- `connectionState`: `dynamic`
- `data`: `dynamic`
- `error`: `dynamic`
- `stackTrace`: `dynamic`
### nothing
Creates an [AsyncSnapshot] in [ConnectionState.none] with null data and error.

### waiting
Creates an [AsyncSnapshot] in [ConnectionState.waiting] with null data and error.

### withData
Creates an [AsyncSnapshot] in the specified [state] and with the specified [data].

#### Parameters

- `state`: `ConnectionState`
- `data`: `T`
### withError
Creates an [AsyncSnapshot] in the specified [state] with the specified [error]
 and a [stackTrace].

 If no [stackTrace] is explicitly specified, [StackTrace.empty] will be used instead.

#### Parameters

- `state`: `ConnectionState`
- `error`: `Object`
- ``: `dynamic`
