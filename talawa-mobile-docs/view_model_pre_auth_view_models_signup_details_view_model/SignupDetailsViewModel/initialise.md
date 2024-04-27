


# initialise method








void initialise
([OrgInfo](../../models_organization_org_info/OrgInfo-class.md) org)








## Implementation

```dart
void initialise(OrgInfo org) {
  selectedOrganization = org;
  // greeting message
  greeting = [
    {
      'text': "Let's ",
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall
    },
    {
      'text': 'get ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall
    },
    {
      'text': "you ",
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall
    },
    {
      'text': 'SignUp ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 24)
    },
  ];
}
```







