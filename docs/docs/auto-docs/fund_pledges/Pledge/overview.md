# Overview for `Pledge`

## Description

The `Pledge` class represents a pledge for a fundraising campaign in the application.

## Members

- **id**: `String?`
  The unique identifier of the pledge.

- **amount**: `int?`
  The amount pledged.

- **creator**: `User?`
  The user who created the pledge.

- **pledger**: `User?`
  The user who made the pledge.

- **note**: `String?`
  The note associated with the pledge.

- **campaign**: `Campaign?`
  The campaign associated with the pledge.

- **startDate**: `DateTime?`
  The start date of the pledge (from campaign).

- **currency**: `String?`
  The currency in which the pledge was made.

- **endDate**: `DateTime?`
  The end date of the pledge (from campaign).

## Constructors

### Unnamed Constructor
Constructs a `Pledge` instance.

 [id] is the unique identifier of the pledge.
 [amount] is the amount pledged.
 [pledger] is the user who made the pledge.
 [campaign] is the campaign associated with the pledge.
 [startDate] is the start date of the pledge.
 [endDate] is the end date of the pledge.

### fromJson
Creates a `Pledge` instance from a JSON object.

 The [json] parameter is a map containing the pledge data.

 Returns an instance of `Pledge`.

#### Parameters

- `json`: `Map<String, dynamic>`
