# Overview for `Stdio`

## Description

An interface for presenting text output to the user.

 Although this could have been simplified by calling ``
 from the tool, this abstraction allows unit tests to verify output
 and allows a GUI frontend to provide an alternative implementation.

 User input probably should be part of this class–however it is currently
 part of context.dart.

## Members

- **logs**: `List&lt;String&gt;`
