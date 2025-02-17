
<div>

# validateURL static method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
validateURL(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    value]

)



Method to validate an organization\'s URL.

**params**:

-   `value`: the URL of the organization

**returns**:

-   `String?`: error message if URL is invalid.



## Implementation

``` language-dart
static String? validateURL(
  String value,
) {
  if (value.isEmpty) {
    return 'Please verify URL first';
  }
  final bool validURL = Uri.parse(value).isAbsolute;
  if (!validURL) {
    return 'Enter a valid URL';
  }
  return null;
}
```







1.  [talawa](../../index.html)
2.  [validators](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.html)
4.  validateURL static method

##### Validator class







