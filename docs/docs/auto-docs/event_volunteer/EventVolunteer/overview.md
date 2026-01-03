# Overview for `EventVolunteer`

## Description

This class creates an event volunteer model and returns an EventVolunteer instance.

## Members

- **id**: `String?`
  Unique identifier for the event volunteer.

- **createdAt**: `String?`
  The creation date of the event volunteer.

- **creator**: `User?`
  The creator of the event volunteer.

- **event**: `Event?`
  The event associated with the event volunteer.

- **group**: `EventVolunteerGroup?`
  The group associated with the event volunteer.

- **isAssigned**: `bool?`
  A boolean value that indicates if the volunteer is assigned.

- **isInvited**: `bool?`
  A boolean value that indicates if the volunteer is invited.

- **response**: `String?`
  The response of the volunteer.

- **updatedAt**: `String?`
  The last update date of the event volunteer.

- **user**: `User?`
  The user who is the volunteer.

## Constructors

### Unnamed Constructor


### fromJson


#### Parameters

- `json`: `Map<String, dynamic>`
