
<div>

# initialize method

</div>


void 



Initializes the greeting message.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
  greeting = [
    {
      'text': "We're ",
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall,
    },
    {
      'text': 'Glad ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 24),
    },
    {
      'text': "you're ",
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall,
    },
    {
      'text': 'Back ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 24),
    },
  ];
}
```







1.  [talawa](../../index.html)
2.  [login_view_model](../../view_model_pre_auth_view_models_login_view_model/)
3.  [LoginViewModel](../../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4.  initialize method

##### LoginViewModel class







