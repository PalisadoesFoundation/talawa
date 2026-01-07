# Method: `isSatisfiedBy`

## Description

Whether the provided [states] satisfy this object's criteria.

 If the constraint is a single [WidgetState] object,
 it's satisfied by the set if the set contains the object.

 The constraint can also be created using one or more operators, for example:

 
 ```dart
 final WidgetStatesConstraint constraint = WidgetState.focused | WidgetState.hovered;
 ```

 In the above case, `constraint.isSatisfiedBy(states)` is equivalent to:

 ```dart
 states.contains(WidgetState.focused) || states.contains(WidgetState.hovered);
 ```
 

## Return Type
`bool`

## Parameters

- `states`: `Set&lt;WidgetState&gt;`
