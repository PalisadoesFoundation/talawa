
<div>

# attachListener method

</div>


void attachListener(

1.  [void
    setter(]
    1.  [void []()]

    )

)



This widget returns button for domination.

**params**:

-   `setter`: SetState holder.

**returns**: None



## Implementation

``` language-dart
void attachListener(void Function(void ) setter) {
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







1.  [talawa](../../index.md)
2.  [profile_page_view_model](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.md)
4.  attachListener method

##### ProfilePageViewModel class







