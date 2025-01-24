




validateURL method - Validator class - validators library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/validators.dart](../../utils_validators/utils_validators-library.html)
3. [Validator](../../utils_validators/Validator-class.html)
4. validateURL static method

validateURL


dark\_mode

light\_mode




# validateURL static method


String?
validateURL(

1. String value

)

Method to validate an organization's URL.

**params**:

* `value`: the URL of the organization

**returns**:

* `String?`: error message if URL is invalid.

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [validators](../../utils_validators/utils_validators-library.html)
3. [Validator](../../utils_validators/Validator-class.html)
4. validateURL static method

##### Validator class





talawa
1.0.0+1






