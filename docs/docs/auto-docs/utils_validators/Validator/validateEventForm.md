
<div>

# validateEventForm static method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
validateEventForm(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    value, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
    label]

)



Method to validate event form.

**params**:

-   `value`: the value of the field
-   `label`: the (optional) label of the field

**returns**:

-   `String?`: error message if field is invalid.



## Implementation

``` language-dart
static String? validateEventForm(String value, String? label) {
  if (value.isEmpty) {
    return '$label must not be left blank.';
  }
  // ignore: unnecessary_raw_strings
  const String pattern = r'(?=.*?[A-Za-z]).+';
  final RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return "Invalid $label";
  }
  return null;
}
```







1.  [talawa](../../index.html)
2.  [validators](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.html)
4.  validateEventForm static method

##### Validator class







