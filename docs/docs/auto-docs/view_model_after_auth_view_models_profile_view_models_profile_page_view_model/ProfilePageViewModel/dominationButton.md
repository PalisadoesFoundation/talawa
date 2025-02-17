
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
    1.  [void []()]

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







1.  [talawa](../../index.md)
2.  [profile_page_view_model](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.md)
4.  dominationButton method

##### ProfilePageViewModel class







