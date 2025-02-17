
<div>

# initialise method

</div>


void initialise(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)]
    context]

)



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [waiting_view_model](../../view_model_pre_auth_view_models_waiting_view_model/)
3.  [WaitingViewModel](../../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel-class.md)
4.  initialise method

##### WaitingViewModel class







