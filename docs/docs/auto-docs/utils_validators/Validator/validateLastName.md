




validateLastName method - Validator class - validators library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/validators.dart](../../utils_validators/utils_validators-library.html)
3. [Validator](../../utils_validators/Validator-class.html)
4. validateLastName static method

validateLastName


dark\_mode

light\_mode




# validateLastName static method


String?
validateLastName(

1. String value

)

Method to validate a user's last name.

**params**:

* `value`: the value of the last name

**returns**:

* `String?`: error message if last name is invalid.

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [validators](../../utils_validators/utils_validators-library.html)
3. [Validator](../../utils_validators/Validator-class.html)
4. validateLastName static method

##### Validator class





talawa
1.0.0+1






