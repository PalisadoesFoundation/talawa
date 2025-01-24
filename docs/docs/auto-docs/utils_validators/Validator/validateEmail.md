




validateEmail method - Validator class - validators library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/validators.dart](../../utils_validators/utils_validators-library.html)
3. [Validator](../../utils_validators/Validator-class.html)
4. validateEmail static method

validateEmail


dark\_mode

light\_mode




# validateEmail static method


String?
validateEmail(

1. String email

)

Method to validate a user's email.

**params**:

* `email`: the entered email

**returns**:

* `String?`: error message if email is invalid.

## Implementation

```
static String? validateEmail(
  String email,
) {
  // If email is empty return.
  if (email.isEmpty) {
    return "Email must not be left blank";
  }
  const String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  final RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(email)) {
    return 'Please enter a valid Email Address';
  }
  return null;
}
```

 


1. [talawa](../../index.html)
2. [validators](../../utils_validators/utils_validators-library.html)
3. [Validator](../../utils_validators/Validator-class.html)
4. validateEmail static method

##### Validator class





talawa
1.0.0+1






