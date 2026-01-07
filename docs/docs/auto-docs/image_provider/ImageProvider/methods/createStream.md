# Method: `createStream`

## Description

Called by [resolve] to create the [ImageStream] it returns.

 Subclasses should override this instead of [resolve] if they need to
 return some subclass of [ImageStream]. The stream created here will be
 passed to [resolveStreamForKey].

## Return Type
`ImageStream`

## Parameters

- `configuration`: `ImageConfiguration`
