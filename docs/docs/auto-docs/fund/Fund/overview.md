# Overview for `Fund`

## Description

The `Fund` class represents a fund in the application.

## Members

- **id**: `String?`
  The unique identifier of the fund.

- **name**: `String?`
  The name of the fund.

- **taxDeductible**: `bool?`
  Indicates whether the fund is tax-deductible.

- **creator**: `User?`
  The identifier of the user who created the fund.

- **campaigns**: `List<Campaign>?`
  A list of campaigns associated with the fund.

- **createdAt**: `DateTime?`
  The timestamp of when the fund was created.

- **updatedAt**: `DateTime?`
  The timestamp of when the fund was last updated.

## Constructors

### Unnamed Constructor
Constructs a `Fund` instance.

 [id] is the unique identifier of the fund.
 [name] is the name of the fund.
 [taxDeductible] indicates whether the fund is tax-deductible.
 [campaigns] is a list of campaign identifiers associated with the fund.
 [createdAt] is the timestamp of when the fund was created.
 [updatedAt] is the timestamp of when the fund was last updated.

### fromJson
Creates a `Fund` instance from a JSON object.

 The [json] parameter is a map containing the fund data.

 Returns an instance of `Fund`.

#### Parameters

- `json`: `Map<String, dynamic>`
