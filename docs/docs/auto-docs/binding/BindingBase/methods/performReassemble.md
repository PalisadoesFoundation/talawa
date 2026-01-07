# Method: `performReassemble`

## Description

This method is called by [reassembleApplication] to actually cause the
 application to reassemble, e.g. after a hot reload.

 Bindings are expected to use this method to re-register anything that uses
 closures, so that they do not keep pointing to old code, and to flush any
 caches of previously computed values, in case the new code would compute
 them differently. For example, the rendering layer triggers the entire
 application to repaint when this is called.

 Do not call this method directly. Instead, use [reassembleApplication].

## Return Type
`Future&lt;void&gt;`

