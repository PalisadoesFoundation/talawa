# Method: `isRowCountApproximate`

## Description

Called to establish if [rowCount] is a precise number or might be an
 over-estimate. If this returns true (i.e. the count is approximate), and
 then later the exact number becomes available, then call
 [notifyListeners].

## Return Type
`bool`

