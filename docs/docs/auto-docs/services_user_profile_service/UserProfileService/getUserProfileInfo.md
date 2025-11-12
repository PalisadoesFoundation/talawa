



menu

1.  [talawa](../../index.md)
2.  [services/user_profile_service.dart](../../services_user_profile_service/)
3.  [UserProfileService](../../services_user_profile_service/UserProfileService-class.md)
4.  getUserProfileInfo method


getUserProfileInfo


 dark_mode   light_mode 




<div>

# getUserProfileInfo method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
getUserProfileInfo(

1.  [[[User](../../models_user_user_info/User-class.md)]
    user]

)



Retrieves user profile information using a GraphQL query.

**params**:

-   `user`: An instance of `User` representing the user whose profile
    information is to be fetched. The user\'s ID is used as a variable
    for the GraphQL query.

**returns**:

-   `Future<QueryResult<Object?>>`: which contains the result of the
    GraphQL query.



## Implementation

``` language-dart
Future<QueryResult<Object?>> getUserProfileInfo(User user) async 
```







1.  [talawa](../../index.md)
2.  [user_profile_service](../../services_user_profile_service/)
3.  [UserProfileService](../../services_user_profile_service/UserProfileService-class.md)
4.  getUserProfileInfo method

##### UserProfileService class









 talawa 1.0.0+1 
