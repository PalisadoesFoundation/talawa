
<div>

# showSnackBar method

</div>


void showSnackBar(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    message]

)



show message on Snack Bar.

**params**:

-   `message`: String Message to show on snackbar

**returns**: None



## Implementation

``` language-dart
void showSnackBar(String message) {
  _navigationService.showTalawaErrorDialog(message, MessageType.error);
}
```







1.  [talawa](../../index.md)
2.  [profile_page_view_model](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.md)
4.  showSnackBar method

##### ProfilePageViewModel class







