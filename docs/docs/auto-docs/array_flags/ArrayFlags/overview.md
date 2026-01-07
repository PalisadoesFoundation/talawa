# Overview for `ArrayFlags`

## Description

Values for the 'array flags' property that is attached to native JSArray and
 typed data objects to encode restrictions.

 We encode the restrictions as two bits - one for potentially growable
 objects that are restricted to be fixed length, and a second for objects
 with potentially modifiable contents that are restricted to have
 unmodifiable contents. We only use three combinations (00 = growable, 01 =
 fixed-length, 11 = unmodifiable), since the core List class does not have a
 variant that is an 'append-only' list (would be 10).

 We use the same scheme for typed data so that the same check works for
 modifiability checks for `a[i] = v` when `a` is a JSarray or Uint8Array.

 `const` JSArray values are tagged with an additional bit for future use in
 avoiding copying. We could also use the `const` bit for unmodifiable typed
 data for which there in no modifable view of the underlying buffer.

 Given the absense of append-only lists, we could have used a more
 numerically compact scheme (0 = growable, 1 = fixed-length, 2 =
 unmodifiable, 3 = const). This compact scheme requires comparison

     if (x.flags > 0)

 rather than mask-testing

     if (x.flags & 1)

 The unrestricted flags (0) are usually encoded as a missing property, i.e.,
 `undefined`, which is converted to NaN for '>', but converted to the more
 comfortable '0' for '&'. We hope that there is less to go potentially go
 wrong with JavaScript engine slow paths with the bitmask.

## Members

- **fixedLength**: `int`
  Value of array flags that marks a JSArray as being fixed-length. This is
 not used on typed data since that is always fixed-length.

- **unmodifiable**: `int`
  Value of array flags that marks a JSArray or typed-data object as
 unmodifiable. Includes the 'fixed-length' bit, since all unmodifiable
 lists are also fixed length.

- **constant**: `int`
  Value of array flags that marks a JSArray as a constant (transitively
 unmodifiable).

- **none**: `int`
  Default value of array flags when there is no flags property. This value
 is not stored on the flags property.

- **fixedLengthCheck**: `int`
  Bit to check for fixed-length JSArray.

- **unmodifiableCheck**: `int`
  Bit to check for unmodifiable JSArray and typed data.

- **constantCheck**: `int`
  Bit to check for constant JSArray.

- **operationNames**: `dynamic`
  A List of operation names for HArrayFlagsCheck, encoded in a string of
 names separated by semicolons.

 The optimizer may replace the string with an index into this
 table. Generally this makes the generated code smaller. A name does not
 need to be in this table. It makes sense for this table to include only
 names that occur in more than one HArrayFlagsCheck, either as written in
 js_runtime, or occuring multiple times via inlining.

- **verbs**: `dynamic`
  A list of 'verbs' for HArrayFlagsCheck, encoded as a string of phrases
 separated by semicolons. The 'verb' fills a span of the error message, for
 example, "remove from" in the message

     Cannot remove from an unmodifiable list.
            ^^^^^^^^^^^

 The optimizer may replace the string with an index into this
 table. Generally this makes the program smaller. A 'verb' does not need to
 be in this table. It makes sense to only have verbs that are used by
 several calls to HArrayFlagsCheck, either as written in js_runtime, or
 occuring multiple times via inlining.

- **operationNameToIndex**: `Map&lt;String, int&gt;`
  A view of [operationNames] as a map from the name to the index of the name
 in the list.

- **verbToIndex**: `Map&lt;String, int&gt;`
  A view of [verbs] as a map from the verb to the index of the verb in the
 list.

