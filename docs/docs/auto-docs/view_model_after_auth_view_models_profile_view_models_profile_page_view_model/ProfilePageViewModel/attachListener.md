




attachListener method - ProfilePageViewModel class - profile\_page\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/profile\_view\_models/profile\_page\_view\_model.dart](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/view_model_after_auth_view_models_profile_view_models_profile_page_view_model-library.html)
3. [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4. attachListener method

attachListener


dark\_mode

light\_mode




# attachListener method


void
attachListener(

1. void setter(
   1. void ())

)

This widget returns button for domination.

**params**:

* `setter`: SetState holder.

**returns**:
None


## Implementation

```
void attachListener(void Function(void Function()) setter) {
  donationField.addListener(() {
    if (donationField.hasFocus) {
      setter(() {
        bottomSheetHeight = SizeConfig.screenHeight! * 0.8725;
      });
    } else {
      Future.delayed(const Duration(milliseconds: 300), () {
        {
          setter(() {
            bottomSheetHeight = SizeConfig.screenHeight! * 0.68;
          });
        }
      });
    }
  });
}
```

 


1. [talawa](../../index.html)
2. [profile\_page\_view\_model](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/view_model_after_auth_view_models_profile_view_models_profile_page_view_model-library.html)
3. [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4. attachListener method

##### ProfilePageViewModel class





talawa
1.0.0+1






