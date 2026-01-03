# Overview for `ProfilePageViewModel`

## Description

ProfilePageViewModel class helps to interact with model to serve data and react to user's input in Profile Page view.

 Methods include:
 * `logout`

## Dependencies

- BaseModel

## Members

- **_userConfig**: `dynamic`
- **_navigationService**: `dynamic`
- **scaffoldKey**: `GlobalKey<ScaffoldState>`
  GlobalKey for scaffoldKey.

- **donationField**: `FocusNode`
  FocusNode for donationField.

- **donationAmount**: `TextEditingController`
  Text Controller for donation Amount.

- **user**: `Box<User>`
  Hive Box of user.

- **url**: `Box<dynamic>`
  Hive Box of url.

- **organisation**: `Box<OrgInfo>`
  Hive Box of organisation.

- **currentOrg**: `OrgInfo`
  Holds Current Organization.

- **currentUser**: `User`
  Holds Current user.

- **bottomSheetHeight**: `double`
  Size of Bottom Sheet Height.

- **donationCurrency**: `String`
  donationCurrency.

- **donationCurrencySymbol**: `String`
  Currency Symbol.

- **denomination**: `List<String>`
  denomination.

