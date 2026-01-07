# Method: `didExceedDeadlineWithEvent`

## Description

Same as [didExceedDeadline] but receives the [event] that initiated the
 gesture.

 You must override this method or [didExceedDeadline] if you supply a
 [deadline]. Subclasses that override this method must _not_ call
 `super.didExceedDeadlineWithEvent(event)`.

## Return Type
`void`

## Parameters

- `event`: `PointerDownEvent`
