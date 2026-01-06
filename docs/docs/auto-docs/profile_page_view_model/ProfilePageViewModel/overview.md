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
- **scaffoldKey**: `GlobalKey&lt;ScaffoldState&gt;`
  GlobalKey for scaffoldKey.

- **donationField**: `FocusNode`
  FocusNode for donationField.

- **donationAmount**: `TextEditingController`
  Text Controller for donation Amount.

- **user**: `Box&lt;User&gt;`
  Hive Box of user.

- **url**: `Box&lt;dynamic&gt;`
  Hive Box of url.

- **organisation**: `Box&lt;OrgInfo&gt;`
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

- **denomination**: `List&lt;String&gt;`
  denomination.

