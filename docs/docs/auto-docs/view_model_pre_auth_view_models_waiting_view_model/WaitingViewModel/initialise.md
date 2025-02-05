


# initialise method








void initialise
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)








## Implementation

```dart
void initialise(BuildContext context) {
  currentUser = userConfig.currentUser;
  pendingRequestOrg = currentUser.membershipRequests!;
  // greetings
  greeting = [
    {
      'text': "Please wait",
      'textStyle': Theme.of(context).textTheme.headlineSmall
    },
    {
      'text': " ${currentUser.firstName} ",
      'textStyle':
          Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24)
    },
    {
      'text': "for organisation(s) to accept your invitation.",
      'textStyle': Theme.of(context).textTheme.headlineSmall
    },
  ];
}
```







