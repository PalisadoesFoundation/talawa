# Overview for `PageInfo`

## Description

This is class is used to represent pagination information for a list of items.

 variables:
 startCursor: start cursor for pagination
 endCursor: end cursor for pagination
 hasNextPage: boolean indicating if there are more items after the current page
 hasPreviousPage: boolean indicating if there are items before the current page

## Members

- **startCursor**: `String?`
  Start cursor for pagination.

- **endCursor**: `String?`
  End cursor for pagination.

- **hasNextPage**: `bool?`
  Indicates if there are more items after the current page.

- **hasPreviousPage**: `bool?`
  Indicates if there are items before the current page.

## Constructors

### Unnamed Constructor


### fromJson


#### Parameters

- `json`: `Map&lt;String, dynamic&gt;`
