
<div>

# validateEmail static method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
validateEmail(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    email]

)



Method to validate a user\'s email.

**params**:

-   `email`: the entered email

**returns**:

-   `String?`: error message if email is invalid.



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [validators](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.md)
4.  validateEmail static method

##### Validator class







