# Method: `hasData`

## Description

Returns whether this snapshot contains a non-null [data] value.

 This can be false even when the asynchronous computation has completed
 successfully, if the computation did not return a non-null value. For
 example, a [Future&lt;void&gt;] will complete with the null value even if it
 completes successfully.

## Return Type
`bool`

