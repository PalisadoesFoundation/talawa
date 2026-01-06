# Overview for `OrgInfo`

## Description

This class creates an organization-information model and returns an OrgInfo instance.

## Members

- **image**: `String?`
  The URL of the organization's image.

- **id**: `String?`
  The ID of the organization.

- **name**: `String?`
  The name of the organization.

- **description**: `String?`
  The description of the organization.

- **userRegistrationRequired**: `bool?`
  Indicates if user registration is required for the organization.

- **city**: `String?`
  The city of the organization's address.

- **countryCode**: `String?`
  The country code of the organization's address.

- **line1**: `String?`
  The first line of the organization's address.

- **line2**: `String?`
  The second line of the organization's address.

- **postalCode**: `String?`
  The postal code of the organization's address.

- **state**: `String?`
  The state of the organization's address.

- **adminsCount**: `int?`
  The count of admins in the organization.

- **membersCount**: `int?`
  The count of members in the organization.

- **members**: `List&lt;User&gt;?`
  List of members in the organization.

- **admins**: `List&lt;User&gt;?`
  List of admins in the organization.

## Constructors

### Unnamed Constructor
Constructs an OrgInfo object.

### fromJson
Factory method to construct an OrgInfo from a JSON object.

 **params**:
 * `json1`: The JSON object containing the organization data.
 * `memberRequest`: A boolean flag to indicate if the request is from a member.

 **returns**:
 * `OrgInfo`: Returns an instance of OrgInfo containing the parsed data.

#### Parameters

- `json`: `Map&lt;String, dynamic&gt;`
