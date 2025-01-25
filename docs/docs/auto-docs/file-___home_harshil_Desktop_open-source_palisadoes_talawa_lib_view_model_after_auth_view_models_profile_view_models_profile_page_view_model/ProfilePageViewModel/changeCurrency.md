




changeCurrency method - ProfilePageViewModel class - profile\_page\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/profile\_view\_models/profile\_page\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3. [ProfilePageViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4. changeCurrency method

changeCurrency


dark\_mode

light\_mode




# changeCurrency method


void
changeCurrency(

1. dynamic context,
2. void setter(
   1. void ())

)

This method changes the currency of the user for donation purpose.

**params**:

* `context`: BuildContext of the widget
* `setter`: Setter Function

**returns**:
None


## Implementation

```
void changeCurrency(
  BuildContext context,
  void Function(void Function()) setter,
) {
  showCurrencyPicker(
    context: context,
    currencyFilter: supportedCurrencies,
    onSelect: (Currency currency) {
      setter(() {
        donationCurrency = currency.code;
        donationCurrencySymbol = currency.symbol;
      });
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [profile\_page\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3. [ProfilePageViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4. changeCurrency method

##### ProfilePageViewModel class





talawa
1.0.0+1






