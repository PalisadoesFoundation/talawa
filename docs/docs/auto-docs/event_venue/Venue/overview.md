# Overview for `Venue`

## Description

The `Venue` class represents a venue for events.

## Members

- **id**: `String?`
  The unique identifier of the venue.

- **capacity**: `int?`
  The maximum number of people the venue can accommodate.

- **description**: `String?`
  Provides additional details about the venue.

- **imageUrl**: `String?`
  The URL of the venue's image.

- **name**: `String?`
  The name of the venue.

- **organizationId**: `String?`
  The identifier of the organization to which the venue belongs.

## Constructors

### Unnamed Constructor
Constructs a `Venue` instance.

 [id] is the unique identifier of the venue.
 [capacity] is the maximum number of people the venue can accommodate.
 [description] provides additional details about the venue.
 [imageUrl] is the URL of the venue's image.
 [name] is the name of the venue.
 [organizationId] is the identifier of the organization to which the venue belongs.

### fromJson
Creates a `Venue` instance from a JSON object.

 The [json] parameter is a map containing the venue data.

 Returns an instance of `Venue`.

#### Parameters

- `json`: `Map<String, dynamic>`
