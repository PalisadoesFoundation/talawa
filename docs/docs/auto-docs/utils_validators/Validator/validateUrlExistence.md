




validateUrlExistence method - Validator class - validators library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/validators.dart](../../utils_validators/utils_validators-library.html)
3. [Validator](../../utils_validators/Validator-class.html)
4. validateUrlExistence method

validateUrlExistence


dark\_mode

light\_mode




# validateUrlExistence method


Future<bool?>
validateUrlExistence(

1. String url

)

Method to validate already exisiting URL.

**params**:

* `url`: the entered URL

**returns**:

* `Future<bool?>`: true if URL exists, false otherwise.

## Implementation

```
Future<bool?> validateUrlExistence(String url) async {
  try {
    await http.get(Uri.parse(url));
    return true;
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}
```

 


1. [talawa](../../index.html)
2. [validators](../../utils_validators/utils_validators-library.html)
3. [Validator](../../utils_validators/Validator-class.html)
4. validateUrlExistence method

##### Validator class





talawa
1.0.0+1






