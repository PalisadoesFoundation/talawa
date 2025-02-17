
<div>

# fetchUserInfo property

</div>


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
fetchUserInfo


getter/setter pair




mutation in string form, to be passed on to graphql client..



## Implementation

``` language-dart
String fetchUserInfo = '''
     query Users(\$id: ID!){
        users(where: { id: \$id }) {
          appUserProfile{
            adminFor{
              _id
              name
            }
            createdOrganizations{
              _id
              name
              image
              description
              userRegistrationRequired
              creator{
                _id
                firstName
                lastName
                image
              }
            }
          }
          user{
            _id
            firstName
            lastName
            email
            image
            joinedOrganizations{
              _id
              name
              image
              description
              userRegistrationRequired
              creator{
                _id
                firstName
                lastName
                image
              }
            }
            membershipRequests{
              organization{
                _id
                name
                image
                description
                userRegistrationRequired
                creator{
                  _id
                  firstName
                  lastName
                  image
                }
              }
            }
          }
        }
      }
  ''';
```







1.  [talawa](../../index.html)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  fetchUserInfo property

##### Queries class







