# Overview for `JSArray`

## Description

The interceptor class for [List]. The compiler recognizes this
 class as an interceptor, and changes references to [:this:] to
 actually use the receiver of the method, which is generated as an extra
 argument added to each member.

## Dependencies

- JavaScriptObject, List, JSIndexable

## Constructors

### Unnamed Constructor


### fixed
Returns a fresh JavaScript Array, marked as fixed-length. The holes in the
 array yield `undefined`, making the Dart List appear to be filled with
 `null` values.

 [length] must be a non-negative integer.

#### Parameters

- `length`: `int`
### allocateFixed
Returns a fresh JavaScript Array, marked as fixed-length.  The Array is
 allocated but no elements are assigned.

 All elements of the array must be assigned before the array is valid. This
 is essentially the same as `JSArray.fixed` except that global type
 inference starts with bottom for the element type.

 [length] must be a non-negative integer.

#### Parameters

- `length`: `int`
### emptyGrowable
Returns a fresh growable JavaScript Array of zero length length.

### growable
Returns a fresh growable JavaScript Array with initial length. The holes
 in the array yield `undefined`, making the Dart List appear to be filled
 with `null` values.

 [length] must be a non-negative integer.

#### Parameters

- `length`: `int`
### allocateGrowable
Returns a fresh growable JavaScript Array with initial length. The Array
 is allocated but no elements are assigned.

 All elements of the array must be assigned before the array is valid. This
 is essentially the same as `JSArray.growable` except that global type
 inference starts with bottom for the element type.

 [length] must be a non-negative integer.

#### Parameters

- `length`: `int`
### typed
Constructor for adding type parameters to an existing JavaScript Array.
 The compiler specially recognizes this constructor.

     var a = new JSArray&lt;int&gt;.typed(JS('JSExtendableArray', '[]'));
     a is List&lt;int&gt;    --> true
     a is List&lt;String&gt; --> false

 Usually either the [JSArray.markFixed] or [JSArray.markGrowable]
 constructors is used instead.

 The input must be a JavaScript Array.  The JS form is just a re-assertion
 to help type analysis when the input type is sloppy.

#### Parameters

- `allocation`: `dynamic`
### markFixed


#### Parameters

- `allocation`: `dynamic`
### markGrowable


#### Parameters

- `allocation`: `dynamic`
