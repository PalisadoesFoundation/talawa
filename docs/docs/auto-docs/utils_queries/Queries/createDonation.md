




createDonation method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. createDonation method

createDonation


dark\_mode

light\_mode




# createDonation method


String
createDonation(

1. String userId,
2. String orgId,
3. String nameOfOrg,
4. String nameOfUser,
5. String payPalId,
6. double amount,

)

`createDonation` creates a new donation transaction by taking the userId ,orgId ,nameOfOrg ,nameOfUser as parameters.

more\_info\_if\_required

**params**:

* `userId`: user identifier
* `orgId`: org identifier
* `nameOfOrg`: org data
* `nameOfUser`: user data
* `payPalId`: for payment
* `amount`: amount

**returns**:

* `String`: mutation in string form, to be passed on to graphql client.

## Implementation

```
String createDonation(
  String userId,
  String orgId,
  String nameOfOrg,
  String nameOfUser,
  String payPalId,
  double amount,
) {
  return '''
    mutation createDonationMutation { createDonation(
          userId :"$userId"
          orgId :"$orgId",
          nameOfOrg:"$nameOfOrg",
          nameOfUser:"$nameOfUser",
          payPalId:"$payPalId"
          amount :$amount
      ){
          _id
          payPalId
          userId
          orgId
          payPalId
          nameOfUser
      }
    }
    ''';
}
```

 


1. [talawa](../../index.html)
2. [queries](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. createDonation method

##### Queries class





talawa
1.0.0+1






