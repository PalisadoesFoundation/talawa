# Method: `resolveStreamForKey`

## Description

Called by [resolve] with the key returned by [obtainKey].

 Subclasses should override this method rather than calling [obtainKey] if
 they need to use a key directly. The [resolve] method installs appropriate
 error handling guards so that errors will bubble up to the right places in
 the framework, and passes those guards along to this method via the
 [handleError] parameter.

 It is safe for the implementation of this method to call [handleError]
 multiple times if multiple errors occur, or if an error is thrown both
 synchronously into the current part of the stack and thrown into the
 enclosing [Zone].

 The default implementation uses the key to interact with the [ImageCache],
 calling [ImageCache.putIfAbsent] and notifying listeners of the [stream].
 Implementers that do not call super are expected to correctly use the
 [ImageCache].

## Return Type
`void`

## Parameters

- `configuration`: `ImageConfiguration`
- `stream`: `ImageStream`
- `key`: `T`
- `handleError`: `ImageErrorListener`
