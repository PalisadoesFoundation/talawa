



menu

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.md)
4.  dominationButton method


dominationButton


 dark_mode   light_mode 




<div>

# dominationButton method

</div>


[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
dominationButton(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    amount, ]
2.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]
    context, ]
3.  [void
    setter(]
    1.  [void []]

    )

)



This widget returns button for domination.

**params**:

-   `amount`: donation Amount.
-   `context`: BuildContext.
-   `setter`: `Function` type, which on tap set the amount to
    `donationAmount`.

**returns**:

-   `Widget`: Icon Button



## Implementation

``` language-dart
Widget dominationButton(
  String amount,
  BuildContext context,
  void Function(void ) setter,
) 
```







1.  [talawa](../../index.md)
2.  [profile_page_view_model](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.md)
4.  dominationButton method

##### ProfilePageViewModel class









 talawa 1.0.0+1 
