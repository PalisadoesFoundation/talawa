
<div>

# validateFirstName static method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
validateFirstName(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    value]

)



Method to validate a user\'s first name.

**params**:

-   `value`: the value of the first name

**returns**:

-   `String?`: error message if first name is invalid.



## Implementation

``` language-dart
static String? validateFirstName(String value) {
  if (value.isEmpty) {
    return 'Firstname must not be left blank.';
  }
  // ignore: unnecessary_raw_strings
  const String pattern = r'(?=.*?[A-Za-z]).+';
  final RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return "Invalid Firstname";
  }
  return null;
}
```







1.  [talawa](../../index.html)
2.  [validators](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.html)
4.  validateFirstName static method

##### Validator class







