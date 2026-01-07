# Overview for `Diagnostic`

## Description

A diagnostic reported from a [Macro].

## Members

- **contextMessages**: `Iterable&lt;DiagnosticMessage&gt;`
  Additional [DiagnosticMessage]s related to this one, to help with the
 context.

- **correctionMessage**: `String?`
  An optional message describing to the user how they might fix this
 diagnostic.

- **message**: `DiagnosticMessage`
  The primary message for this diagnostic.

- **severity**: `Severity`
  The severity of this diagnostic.

## Constructors

### Unnamed Constructor
General diagnostics for the current macro application.

 These will be attached to the macro application itself.

