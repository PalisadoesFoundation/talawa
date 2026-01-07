# Method: `maximumSizeBytes`

## Description

Changes the maximum cache bytes.

 If the new size is smaller than the current size in bytes, the
 extraneous elements are evicted immediately. Setting this to zero and then
 returning it to its original value will therefore immediately clear the
 cache.

## Parameters

- `value`: `int`
