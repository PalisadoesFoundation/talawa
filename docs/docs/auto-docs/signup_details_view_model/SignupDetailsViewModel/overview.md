# Overview for `SignupDetailsViewModel`

## Description

SignupDetailsViewModel class helps to interact with model to serve data and react to user's input for Sign Up Details section.

 Methods include:
 * `signUp`

## Dependencies

- BaseModel

## Members

- **formKey**: `dynamic`
  GlobalKey to identify and manage the state of a form widget.

- **greeting**: `List&lt;Map&lt;String, dynamic&gt;&gt;`
  List of maps to store greeting information, where each greeting is represented by a map with String keys and dynamic values.

- **selectedOrganization**: `OrgInfo`
  Represents information about the selected organization.

- **secureStorage**: `FlutterSecureStorage`
  Secure local storage instance.

- **confirmPassword**: `TextEditingController`
  TextEditingController for handling confirmation password input field.

- **name**: `TextEditingController`
  TextEditingController for handling name input field.

- **password**: `TextEditingController`
  TextEditingController for handling password input field.

- **email**: `TextEditingController`
  TextEditingController for handling email input field.

- **validate**: `AutovalidateMode`
  AutovalidateMode to determine when to perform automatic validation of form fields.

- **confirmFocus**: `FocusNode`
  FocusNode to manage focus for the confirmation password input field.

- **hidePassword**: `bool`
  Boolean to toggle password visibility (true for hidden, false for visible).

