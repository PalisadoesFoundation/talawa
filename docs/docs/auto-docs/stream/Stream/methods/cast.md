# Method: `cast`

## Description

Adapt this stream to be a `Stream&lt;R&gt;`.

 This stream is wrapped as a `Stream&lt;R&gt;` which checks at run-time that
 each data event emitted by this stream is also an instance of [R].

## Return Type
`Stream&lt;R&gt;`

