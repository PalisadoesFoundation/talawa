




validateUrlExistence method - Validator class - validators library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/validators.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/)
3. [Validator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/Validator-class.html)
4. validateUrlExistence method

validateUrlExistence


dark\_mode

light\_mode




# validateUrlExistence method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?>
validateUrlExistence(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) url

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
2. [validators](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/)
3. [Validator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/Validator-class.html)
4. validateUrlExistence method

##### Validator class





talawa
1.0.0+1






