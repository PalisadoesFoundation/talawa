




update method - User class - user\_info library - Dart API







menu

1. [talawa](../../index.html)
2. [models/user/user\_info.dart](../../models_user_user_info/models_user_user_info-library.html)
3. [User](../../models_user_user_info/User-class.html)
4. update method

update


dark\_mode

light\_mode




# update method


void
update(

1. [User](../../models_user_user_info/User-class.html) details

)

Method to update the user details.

**params**:

* `details`: updated user Info/details

**returns**:
None


## Implementation

```
void update(User details) {
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
}
```

 


1. [talawa](../../index.html)
2. [user\_info](../../models_user_user_info/models_user_user_info-library.html)
3. [User](../../models_user_user_info/User-class.html)
4. update method

##### User class





talawa
1.0.0+1






