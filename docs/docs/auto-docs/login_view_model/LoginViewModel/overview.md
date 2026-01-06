# Overview for `LoginViewModel`

## Description

LoginViewModel class helps to interact with model to serve data.

 Reacts to user's input in Login View.

 Methods include:
 * `login`

## Dependencies

- BaseModel

## Members

- **formKey**: `dynamic`
  GlobalKey to identify and manage the state of a form widget.

- **prevUserEmail**: `String?`
  This field store previous user Email.

- **prevUserPassword**: `String?`
  This field store previous user Password.

- **secureStorage**: `FlutterSecureStorage`
  Secure local storage instance.

- **greeting**: `List&lt;Map&lt;String, dynamic&gt;&gt;`
  List of maps to store greetings..

- **password**: `TextEditingController`
  TextEditingController for handling password input field.

- **email**: `TextEditingController`
  TextEditingController for handling email input field.

- **passwordFocus**: `FocusNode`
  FocusNode to manage focus for the password input field.

- **emailFocus**: `FocusNode`
  FocusNode to manage focus for the email input field.

- **validate**: `AutovalidateMode`
  Determines when to perform automatic validation of form fields.

- **hidePassword**: `bool`
  Toggles password visibility (true for hidden, false for visible).

