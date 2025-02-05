


# changeCurrency method








void changeCurrency
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) setter)





<p>This method changes the currency of the user for donation purpose.</p>



## Implementation

```dart
void changeCurrency(BuildContext context, Function setter) {
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







