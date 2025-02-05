


# buildPadding function










[Padding](https://api.flutter.dev/flutter/widgets/Padding-class.html) buildPadding
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) text)








## Implementation

```dart
Padding buildPadding(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      AppLocalizations.of(context)!.strictTranslate(text),
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}
```







