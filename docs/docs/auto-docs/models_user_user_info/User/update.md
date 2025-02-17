
<div>

# update method

</div>


void update(

1.  [[[User](../../models_user_user_info/User-class.md)]
    details]

)



Method to update the user details.

**params**:

-   `details`: updated user Info/details

**returns**: None



## Implementation

``` language-dart
void update(User details) {
  this.firstName = details.firstName;
  this.lastName = details.lastName;
  this.email = details.email;
  this.image = details.image;
  this.authToken = details.authToken;
  // this.refreshToken = details.refreshToken;
  // this.joinedOrganizations = details.joinedOrganizations;
  // this.createdOrganizations = details.createdOrganizations;
  // this.membershipRequests = details.membershipRequests;
  // this.adminFor = details.adminFor;
}
```







1.  [talawa](../../index.md)
2.  [user_info](../../models_user_user_info/)
3.  [User](../../models_user_user_info/User-class.md)
4.  update method

##### User class







