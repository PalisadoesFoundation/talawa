# Method: `delegate`

## Description

When the delegate is changed to a new delegate with the same runtimeType
 as the old delegate, this object will call the delegate's
 [FlowDelegate.shouldRelayout] and [FlowDelegate.shouldRepaint] functions
 to determine whether the new delegate requires this object to update its
 layout or painting.

## Parameters

- `newDelegate`: `FlowDelegate`
