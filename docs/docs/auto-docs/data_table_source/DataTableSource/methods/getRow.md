# Method: `getRow`

## Description

Called to obtain the data about a particular row.

 Rows should be keyed so that state can be maintained when the data source
 is sorted (e.g. in response to [DataColumn.onSort]). Keys should be
 consistent for a given [DataRow] regardless of the sort order (i.e. the
 key represents the data's identity, not the row position).

 The [DataRow.byIndex] constructor provides a convenient way to construct
 [DataRow] objects for this method's purposes without having to worry about
 independently keying each row. The index passed to that constructor is the
 index of the underlying data, which is different than the `index`
 parameter for [getRow], which represents the _sorted_ position.

 If the given index does not correspond to a row, or if no data is yet
 available for a row, then return null. The row will be left blank and a
 loading indicator will be displayed over the table. Once data is available
 or once it is firmly established that the row index in question is beyond
 the end of the table, call [notifyListeners]. (See [rowCount].)

 If the underlying data changes, call [notifyListeners].

## Return Type
`DataRow?`

## Parameters

- `index`: `int`
