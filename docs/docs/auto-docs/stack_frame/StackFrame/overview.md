# Overview for `StackFrame`

## Description

A object representation of a frame from a stack trace.

 

 This example creates a traversable list of parsed [StackFrame] objects from
 the current [StackTrace].

 ```dart
 final List&lt;StackFrame&gt; currentFrames = StackFrame.fromStackTrace(StackTrace.current);
 ```
 

## Members

- **asynchronousSuspension**: `StackFrame`
  A stack frame representing an asynchronous suspension.

- **stackOverFlowElision**: `StackFrame`
  A stack frame representing a Dart elided stack overflow frame.

- **_webNonDebugFramePattern**: `RegExp`
- **source**: `String`
  The original source of this stack frame.

- **number**: `int`
  The zero-indexed frame number.

 This value may be -1 to indicate an unknown frame number.

- **packageScheme**: `String`
  The scheme of the package for this frame, e.g. "dart" for
 dart:core/errors_patch.dart or "package" for
 package:flutter/src/widgets/text.dart.

 The path property refers to the source file.

- **package**: `String`
  The package for this frame, e.g. "core" for
 dart:core/errors_patch.dart or "flutter" for
 package:flutter/src/widgets/text.dart.

- **packagePath**: `String`
  The path of the file for this frame, e.g. "errors_patch.dart" for
 dart:core/errors_patch.dart or "src/widgets/text.dart" for
 package:flutter/src/widgets/text.dart.

- **line**: `int`
  The source line number.

- **column**: `int`
  The source column number.

- **className**: `String`
  The class name, if any, for this frame.

 This may be null for top level methods in a library or anonymous closure
 methods.

- **method**: `String`
  The method name for this frame.

 This will be an empty string if the stack frame is from the default
 constructor.

- **isConstructor**: `bool`
  Whether or not this was thrown from a constructor.

## Constructors

### Unnamed Constructor
Creates a new StackFrame instance.

 The [className] may be the empty string if there is no class (e.g. for a
 top level library method).

