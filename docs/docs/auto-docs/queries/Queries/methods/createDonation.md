# Method: `createDonation`

## Description

`createDonation` creates a new donation transaction by taking the userId ,orgId ,nameOfOrg ,nameOfUser as parameters.

 more_info_if_required

 **params**:
 * `userId`: user identifier
 * `orgId`: org identifier
 * `nameOfOrg`: org data
 * `nameOfUser`: user data
 * `payPalId`: for payment
 * `amount`: amount

 **returns**:
 * `String`: mutation in string form, to be passed on to graphql client.

## Return Type
`String`

## Parameters

- `userId`: `String`
- `orgId`: `String`
- `nameOfOrg`: `String`
- `nameOfUser`: `String`
- `payPalId`: `String`
- `amount`: `double`
