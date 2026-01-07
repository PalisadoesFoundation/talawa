# Overview for `DiagnosticMessage`

## Description

A message and optional target for a [Diagnostic] reported by a [Macro].

## Members

- **message**: `String`
  The primary message for this diagnostic message.

- **target**: `DiagnosticTarget?`
  The optional target for this diagnostic message.

 If provided, the diagnostic should be linked to this target.

 If not provided, it should be implicitly linked to the macro application
 that generated this diagnostic.

## Constructors

### Unnamed Constructor


