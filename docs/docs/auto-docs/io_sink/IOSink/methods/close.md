# Method: `close`

## Description

Close the target consumer.

 NOTE: Writes to the [IOSink] may be buffered, and may not be flushed by
 a call to ``. To flush all buffered writes, call `` before
 calling ``.

## Return Type
`Future`

