
<div>

# validateLastName static method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
validateLastName(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    value]

)



Method to validate a user\'s last name.

**params**:

-   `value`: the value of the last name

**returns**:

-   `String?`: error message if last name is invalid.



## Implementation

``` language-dart
static String? validateLastName(String value) {
  if (value.isEmpty) {
    return 'Lastname must not be left blank.';
  }
  // ignore: unnecessary_raw_strings
  const String pattern = r"(?=.*?[A-Za-z]).+";
  final RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return "Invalid Lastname";
  }
  return null;
}
```







1.  [talawa](../../index.html)
2.  [validators](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.html)
4.  validateLastName static method

##### Validator class







