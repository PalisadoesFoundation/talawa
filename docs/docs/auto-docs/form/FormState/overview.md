# Overview for `FormState`

## Description

State associated with a [Form] widget.

 A [FormState] object can be used to [save], [reset], and [validate] every
 [FormField] that is a descendant of the associated [Form].

 Typically obtained via [Form.of].

## Dependencies

- State

## Members

- **_generation**: `int`
- **_hasInteractedByUser**: `bool`
- **_fields**: `Set&lt;FormFieldState&lt;dynamic&gt;&gt;`
