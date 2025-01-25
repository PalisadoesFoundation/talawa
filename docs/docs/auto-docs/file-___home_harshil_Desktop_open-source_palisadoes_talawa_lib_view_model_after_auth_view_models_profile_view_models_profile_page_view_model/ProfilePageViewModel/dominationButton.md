




dominationButton method - ProfilePageViewModel class - profile\_page\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/profile\_view\_models/profile\_page\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3. [ProfilePageViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4. dominationButton method

dominationButton


dark\_mode

light\_mode




# dominationButton method


dynamic
dominationButton(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) amount,
2. dynamic context,
3. void setter(
   1. void ())

)

This widget returns button for domination.

**params**:

* `amount`: donation Amount.
* `context`: BuildContext.
* `setter`: `Function` type, which on tap set the amount to `donationAmount`.

**returns**:

* `Widget`: Icon Button

## Implementation

```
Widget dominationButton(
  String amount,
  BuildContext context,
  void Function(void Function()) setter,
) {
  return InkWell(
    key: Key('domBtn_$amount'),
    onTap: () {
      setter(() {
        donationAmount.text = amount;
      });
    },
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.screenHeight! * 0.02,
        horizontal: SizeConfig.screenWidth! * 0.075,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: donationAmount.text == amount
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary,
      ),
      child: Text(
        '$donationCurrencySymbol $amount',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [profile\_page\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3. [ProfilePageViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4. dominationButton method

##### ProfilePageViewModel class





talawa
1.0.0+1






