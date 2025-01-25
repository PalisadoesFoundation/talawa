




validateFirstName method - Validator class - validators library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/validators.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/)
3. [Validator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/Validator-class.html)
4. validateFirstName static method

validateFirstName


dark\_mode

light\_mode




# validateFirstName static method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?
validateFirstName(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) value

)

Method to validate a user's first name.

**params**:

* `value`: the value of the first name

**returns**:

* `String?`: error message if first name is invalid.

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [validators](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/)
3. [Validator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/Validator-class.html)
4. validateFirstName static method

##### Validator class





talawa
1.0.0+1






