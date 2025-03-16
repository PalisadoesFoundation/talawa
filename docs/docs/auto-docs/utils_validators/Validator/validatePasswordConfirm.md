
<div>

# validatePasswordConfirm static method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
validatePasswordConfirm(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    value, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    comparator]

)



Method to valid password re-entered for confirmation.

**params**:

-   `value`: the entered password
-   `comparator`: the original password

**returns**:

-   `String?`: error message if password is invalid.



## Implementation

``` language-dart
static String? validatePasswordConfirm(
  String value,
  String comparator,
) 
```







1.  [talawa](../../index.md)
2.  [validators](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.md)
4.  validatePasswordConfirm static method

##### Validator class







