# Overview for `User`

## Description

This class creates a User model and returns a user instance.

## Dependencies

- HiveObject

## Members

- **authToken**: `String?`
  HiveField for authToken.

- **refreshToken**: `String?`
  HiveField for refreshToken.

- **id**: `String?`
  HiveField for userID.

- **name**: `String?`
  HiveField for user's name.

- **email**: `String?`
  HiveField for user's Email.

- **image**: `String?`
  HiveField for user's avatar.

- **joinedOrganizations**: `List<OrgInfo>?`
  HiveField for all organisations joined by user.

- **membershipRequests**: `List<String>?`
  HiveField for all organisations user has sent membership request.

## Constructors

### Unnamed Constructor


### fromJson


#### Parameters

- `json`: `Map<String, dynamic>`
