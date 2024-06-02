


# initialise method








void initialise
({[String](https://api.flutter.dev/flutter/dart-core/String-class.html) inviteUrl = ''})





<p>This function initialises the variables.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>inviteUrl</code>: url</li>
</ul>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void initialise({String inviteUrl = ''}) {
  final uri = inviteUrl;
  if (uri.isNotEmpty) {
    /// assigning the invite server url to the url text controller.
    url.text = uri;
    final box = Hive.box('url');
    box.put(urlKey, uri);
    box.put(imageUrlKey, "$uri/talawa/");
    graphqlConfig.getOrgUrl();
  }

  /// greeting message.
  greeting = [
    {
      'text': 'Join ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
    },
    {
      'text': 'and ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall
    },
    {
      'text': 'Collaborate ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
    },
    {
      'text': 'with your ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall
    },
    {
      'text': 'Organizations',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall!
          .copyWith(fontSize: 24, color: const Color(0xFF4285F4))
    },
  ];
  notifyListeners();
}
```







