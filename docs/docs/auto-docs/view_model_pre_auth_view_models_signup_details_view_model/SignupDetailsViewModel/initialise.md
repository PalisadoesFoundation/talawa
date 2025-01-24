




initialise method - SignupDetailsViewModel class - signup\_details\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/signup\_details\_view\_model.dart](../../view_model_pre_auth_view_models_signup_details_view_model/view_model_pre_auth_view_models_signup_details_view_model-library.html)
3. [SignupDetailsViewModel](../../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class.html)
4. initialise method

initialise


dark\_mode

light\_mode




# initialise method


void
initialise(

1. [OrgInfo](../../models_organization_org_info/OrgInfo-class.html) org

)

Initializes the greeting message for a selected organization.

**params**:

* `org`: OrgInfo - the organization information to set as selected.

**returns**:
None


## Implementation

```
void initialise(OrgInfo org) {
  selectedOrganization = org;
  // greeting message
  greeting = [
    {
      'text': "Let's ",
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall,
    },
    {
      'text': 'get ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall,
    },
    {
      'text': "you ",
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall,
    },
    {
      'text': 'SignUp ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 24),
    },
  ];
}
```

 


1. [talawa](../../index.html)
2. [signup\_details\_view\_model](../../view_model_pre_auth_view_models_signup_details_view_model/view_model_pre_auth_view_models_signup_details_view_model-library.html)
3. [SignupDetailsViewModel](../../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class.html)
4. initialise method

##### SignupDetailsViewModel class





talawa
1.0.0+1






