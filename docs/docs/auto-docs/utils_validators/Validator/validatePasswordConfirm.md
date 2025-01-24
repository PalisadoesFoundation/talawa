




validatePasswordConfirm method - Validator class - validators library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/validators.dart](../../utils_validators/utils_validators-library.html)
3. [Validator](../../utils_validators/Validator-class.html)
4. validatePasswordConfirm static method

validatePasswordConfirm


dark\_mode

light\_mode




# validatePasswordConfirm static method


String?
validatePasswordConfirm(

1. String value,
2. String comparator

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
2. [validators](../../utils_validators/utils_validators-library.html)
3. [Validator](../../utils_validators/Validator-class.html)
4. validatePasswordConfirm static method

##### Validator class





talawa
1.0.0+1






