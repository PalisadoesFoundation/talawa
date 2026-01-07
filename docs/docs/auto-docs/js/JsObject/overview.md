# Overview for `JsObject`

## Description

A proxy on a JavaScript object.

 The properties of the JavaScript object are accessible via the `[]` and
 `[]=` operators. Methods are callable via [callMethod].

## Constructors

### Unnamed Constructor
Constructs a JavaScript object from its native [constructor] and returns
 a proxy to it.

### fromBrowserObject
Constructs a [JsObject] that proxies a native Dart object; _for expert use
 only_.

 Use this constructor only if you wish to get access to JavaScript
 properties attached to a browser host object, such as a Node or Blob, that
 is normally automatically converted into a native Dart object.

 An exception will be thrown if [object] has the type
 `bool`, `num`, or `String`.

#### Parameters

- `object`: `Object`
### jsify
Recursively converts a JSON-like collection of Dart objects to a
 collection of JavaScript objects and returns a [JsObject] proxy to it.

 [object] must be a [Map] or [Iterable], the contents of which are also
 converted. Maps and Iterables are copied to a new JavaScript object.
 Primitives and other transferable values are directly converted to their
 JavaScript type, and all other objects are proxied.

#### Parameters

- `object`: `Object`
