# Method: `rowCount`

## Description

Called to obtain the number of rows to tell the user are available.

 If [isRowCountApproximate] is false, then this must be an accurate number,
 and [getRow] must return a non-null value for all indices in the range 0
 to one less than the row count.

 If [isRowCountApproximate] is true, then the user will be allowed to
 attempt to display rows up to this [rowCount], and the display will
 indicate that the count is approximate. The row count should therefore be
 greater than the actual number of rows if at all possible.

 If the row count changes, call [notifyListeners].

## Return Type
`int`

