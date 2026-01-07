# Method: `debugAssertIsValid`

## Description

Asserts that the constraints are valid.

 This might involve checks more detailed than [isNormalized].

 For example, the [BoxConstraints] subclass verifies that the constraints
 are not [double.nan].

 If the `isAppliedConstraint` argument is true, then even stricter rules
 are enforced. This argument is set to true when checking constraints that
 are about to be applied to a [RenderObject] during layout, as opposed to
 constraints that may be further affected by other constraints. For
 example, the asserts for verifying the validity of
 [RenderConstrainedBox.additionalConstraints] do not set this argument, but
 the asserts for verifying the argument passed to the [RenderObject.layout]
 method do.

 The `informationCollector` argument takes an optional callback which is
 called when an exception is to be thrown. The collected information is
 then included in the message after the error line.

 Returns the same as [isNormalized] if asserts are disabled.

## Return Type
`bool`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
