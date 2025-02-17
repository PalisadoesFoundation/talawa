
<div>

# initialise method

</div>


void initialise(

1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.md)?]
    org]

)



Initializes the greeting message for a selected organization.

**params**:

-   `org`: OrgInfo - the organization information to set as selected.

**returns**: None



## Implementation

``` language-dart
void initialise(OrgInfo? org) {
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







1.  [talawa](../../index.md)
2.  [signup_details_view_model](../../view_model_pre_auth_view_models_signup_details_view_model/)
3.  [SignupDetailsViewModel](../../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class.md)
4.  initialise method

##### SignupDetailsViewModel class







