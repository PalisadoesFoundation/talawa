# Overview for `DiagnosticsDebugCreator`

## Description

A class that creates [DiagnosticsNode] by wrapping [RenderObject.debugCreator].

 Attach a [DiagnosticsDebugCreator] into [FlutterErrorDetails.informationCollector]
 when a [RenderObject.debugCreator] is available. This will lead to improved
 error message.

## Dependencies

- DiagnosticsProperty

## Constructors

### Unnamed Constructor
Create a [DiagnosticsProperty] with its [value] initialized to input
 [RenderObject.debugCreator].

