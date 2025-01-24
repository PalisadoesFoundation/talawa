




initialise method - WaitingViewModel class - waiting\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/waiting\_view\_model.dart](../../view_model_pre_auth_view_models_waiting_view_model/view_model_pre_auth_view_models_waiting_view_model-library.html)
3. [WaitingViewModel](../../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel-class.html)
4. initialise method

initialise


dark\_mode

light\_mode




# initialise method


void
initialise(

1. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context

)

## Implementation

```
void initialise(BuildContext context) {
  currentUser = userConfig.currentUser;
  pendingRequestOrg = currentUser.membershipRequests!;
  // greetings
  greeting = [
    {
      'text': "Please wait",
      'textStyle': Theme.of(context).textTheme.headlineSmall,
    },
    {
      'text': " ${currentUser.firstName} ",
      'textStyle':
          Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24),
    },
    {
      'text': "for organisation(s) to accept your invitation.",
      'textStyle': Theme.of(context).textTheme.headlineSmall,
    },
  ];
}
```

 


1. [talawa](../../index.html)
2. [waiting\_view\_model](../../view_model_pre_auth_view_models_waiting_view_model/view_model_pre_auth_view_models_waiting_view_model-library.html)
3. [WaitingViewModel](../../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel-class.html)
4. initialise method

##### WaitingViewModel class





talawa
1.0.0+1






