# Method: `reassembleApplication`

## Description

Cause the entire application to redraw, e.g. after a hot reload.

 This is used by development tools when the application code has changed,
 to cause the application to pick up any changed code. It can be triggered
 manually by sending the `ext.flutter.reassemble` service extension signal.

 This method is very computationally expensive and should not be used in
 production code. There is never a valid reason to cause the entire
 application to repaint in production. All aspects of the Flutter framework
 know how to redraw when necessary. It is only necessary in development
 when the code is literally changed on the fly (e.g. in hot reload) or when
 debug flags are being toggled.

 While this method runs, events are locked (e.g. pointer events are not
 dispatched).

 Subclasses (binding classes) should override [performReassemble] to react
 to this method being called. This method itself should not be overridden.

## Return Type
`Future&lt;void&gt;`

