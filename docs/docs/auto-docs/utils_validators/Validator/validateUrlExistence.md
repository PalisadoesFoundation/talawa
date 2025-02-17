
<div>

# validateUrlExistence method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]\>]]
validateUrlExistence(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    url]

)



Method to validate already exisiting URL.

**params**:

-   `url`: the entered URL

**returns**:

-   `Future<bool?>`: true if URL exists, false otherwise.



## Implementation

``` language-dart
Future<bool?> validateUrlExistence(String url) async {
  try {
    await http.get(Uri.parse(url));
    return true;
  } on Exception catch (e) {
    debugPrint(e.);
    return false;
  }
}
```







1.  [talawa](../../index.md)
2.  [validators](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.md)
4.  validateUrlExistence method

##### Validator class







