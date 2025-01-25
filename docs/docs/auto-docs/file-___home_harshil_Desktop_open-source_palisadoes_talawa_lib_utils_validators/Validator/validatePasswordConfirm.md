




validatePasswordConfirm method - Validator class - validators library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/validators.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/)
3. [Validator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/Validator-class.html)
4. validatePasswordConfirm static method

validatePasswordConfirm


dark\_mode

light\_mode




# validatePasswordConfirm static method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?
validatePasswordConfirm(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) value,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) comparator

)

Method to valid password re-entered for confirmation.

**params**:

* `value`: the entered password
* `comparator`: the original password

**returns**:

* `String?`: error message if password is invalid.

## Implementation

```
static String? validatePasswordConfirm(
  String value,
  String comparator,
) {
  if (value != comparator) {
    return 'Password does not match original';
  }
  return null;
}
```

 


1. [talawa](../../index.html)
2. [validators](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/)
3. [Validator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/Validator-class.html)
4. validatePasswordConfirm static method

##### Validator class





talawa
1.0.0+1






