# Method: `shouldNotify`

## Description

Called whenever a [ScrollConfiguration] is rebuilt with a new
 [ScrollBehavior] of the same [runtimeType].

 If the new instance represents different information than the old
 instance, then the method should return true, otherwise it should return
 false.

 If this method returns true, all the widgets that inherit from the
 [ScrollConfiguration] will rebuild using the new [ScrollBehavior]. If this
 method returns false, the rebuilds might be optimized away.

## Return Type
`bool`

## Parameters

- `oldDelegate`: `ScrollBehavior`
