




validateEventForm method - Validator class - validators library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/validators.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/)
3. [Validator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/Validator-class.html)
4. validateEventForm static method

validateEventForm


dark\_mode

light\_mode




# validateEventForm static method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?
validateEventForm(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) value,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? label

)

Method to validate event form.

**params**:

* `value`: the value of the field
* `label`: the (optional) label of the field

**returns**:

* `String?`: error message if field is invalid.

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [validators](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/)
3. [Validator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/Validator-class.html)
4. validateEventForm static method

##### Validator class





talawa
1.0.0+1






