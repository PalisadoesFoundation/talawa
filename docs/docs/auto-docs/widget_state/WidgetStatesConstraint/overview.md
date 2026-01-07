# Overview for `WidgetStatesConstraint`

## Description

This class allows [WidgetState] enum values to be combined
 using [WidgetStateOperators].

 A [Map] with [WidgetStatesConstraint] objects as keys can be used
 in the [WidgetStateProperty.fromMap] constructor to resolve to
 one of its values, based on the first key that [isSatisfiedBy]
 the current set of states.

 

