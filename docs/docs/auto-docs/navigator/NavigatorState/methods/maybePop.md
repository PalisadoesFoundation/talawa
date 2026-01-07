# Method: `maybePop`

## Description

Consults the current route's [Route.popDisposition] method, and acts
 accordingly, potentially popping the route as a result; returns whether
 the pop request should be considered handled.

 

 See also:

  * [Form], which provides a [Form.canPop] boolean that enables the
    form to prevent any [pop]s initiated by the app's back button.
  * [ModalRoute], which provides a `scopedOnPopCallback` that can be used
    to define the route's `willPop` method.

## Return Type
`Future&lt;bool&gt;`

## Parameters

- ``: `dynamic`
