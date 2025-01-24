




getUserProfileInfo method - UserProfileService class - user\_profile\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_profile\_service.dart](../../services_user_profile_service/services_user_profile_service-library.html)
3. [UserProfileService](../../services_user_profile_service/UserProfileService-class.html)
4. getUserProfileInfo method

getUserProfileInfo


dark\_mode

light\_mode




# getUserProfileInfo method


Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>
getUserProfileInfo(

1. [User](../../models_user_user_info/User-class.html) user

)

Retrieves user profile information using a GraphQL query.

**params**:

* `user`: An instance of `User` representing the user whose profile information is to be fetched.
  The user's ID is used as a variable for the GraphQL query.

**returns**:

* `Future<QueryResult<Object?>>`: which contains the result of the GraphQL query.

## Implementation

```
Future<QueryResult<Object?>> getUserProfileInfo(User user) async {
  final QueryResult result = await databaseFunctions.gqlAuthQuery(
    queries.fetchUserInfo,
    variables: {'id': user.id},
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [user\_profile\_service](../../services_user_profile_service/services_user_profile_service-library.html)
3. [UserProfileService](../../services_user_profile_service/UserProfileService-class.html)
4. getUserProfileInfo method

##### UserProfileService class





talawa
1.0.0+1






