


# dominationButton method








[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) dominationButton
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) amount, [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) setter)





<p>This widget returns button for domination.</p>
<p>params:</p>
<ul>
<li><code>amount</code> : donation Amount.</li>
<li><code>setter</code> : <code>Function</code> type, which on tap set the amount to <code>donationAmount</code>.</li>
</ul>



## Implementation

```dart
Widget dominationButton(
  String amount,
  BuildContext context,
  Function setter,
) {
  return InkWell(
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







