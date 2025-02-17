
<div>

# fetchJoinInOrg property

</div>



[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
get fetchJoinInOrg



getter for joined org.



## Implementation

``` language-dart
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








1.  [talawa](../../index.html)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  fetchJoinInOrg property

##### Queries class







