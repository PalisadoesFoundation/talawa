




fetchJoinInOrg property - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. fetchJoinInOrg property

fetchJoinInOrg


dark\_mode

light\_mode




# fetchJoinInOrg property


String
get
fetchJoinInOrg

getter for joined org.


## Implementation

```
String get fetchJoinInOrg {
  return """
  query organizationsConnection(\$first: Int, \$skip: Int){
    organizationsConnection(
      first: \$first,
      skip: \$skip,
      orderBy: name_ASC
    ){
      image
      _id
      name
      image
      description
      address{
      city
      countryCode
      state
    }
      userRegistrationRequired
      creator{
        firstName
        lastName
      }
      members{
            firstName
            lastName
            image
            }
            admins{
            firstName
            lastName
            image
            }
    }
  }
""";
}
```


 


1. [talawa](../../index.html)
2. [queries](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. fetchJoinInOrg property

##### Queries class





talawa
1.0.0+1






