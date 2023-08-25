


# initialize method








void initialize
()








## Implementation

```dart
void initialize() {
  // greating message
  greeting = [
    {
      'text': "We're ",
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall
    },
    {
      'text': 'Glad ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 24)
    },
    {
      'text': "you're ",
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall
    },
    {
      'text': 'Back ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 24)
    },
  ];
}
```







