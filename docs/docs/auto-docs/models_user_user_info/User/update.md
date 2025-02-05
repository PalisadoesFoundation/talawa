


# update method








void update
([User](../../models_user_user_info/User-class.md) details)








## Implementation

```dart
void update(User details) \{
  this.firstName = details.firstName;
  this.lastName = details.lastName;
  this.email = details.email;
  this.image = details.image;
  this.authToken = details.authToken;
  this.refreshToken = details.refreshToken;
  this.joinedOrganizations = details.joinedOrganizations;
  this.createdOrganizations = details.createdOrganizations;
  this.membershipRequests = details.membershipRequests;
  this.adminFor = details.adminFor;
\}
```







