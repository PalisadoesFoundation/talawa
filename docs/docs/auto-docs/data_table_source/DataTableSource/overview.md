# Overview for `DataTableSource`

## Description

A data source for obtaining row data for [PaginatedDataTable] objects.

 A data table source provides two main pieces of information:

 * The number of rows in the data table ([rowCount]).
 * The data for each row (indexed from `0` to `rowCount - 1`).

 It also provides a listener API ([addListener]/[removeListener]) so that
 consumers of the data can be notified when it changes. When the data
 changes, call [notifyListeners] to send the notifications.

 DataTableSource objects are expected to be long-lived, not recreated with
 each build.

 If a [DataTableSource] is used with a [PaginatedDataTable] that supports
 sortable columns (see [DataColumn.onSort] and
 [PaginatedDataTable.sortColumnIndex]), the rows reported by the data source
 must be reported in the sorted order.

## Dependencies

- ChangeNotifier

