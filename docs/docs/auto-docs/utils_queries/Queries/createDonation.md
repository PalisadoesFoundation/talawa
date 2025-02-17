
<div>

# createDonation method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
createDonation(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    userId, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    orgId, ]
3.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    nameOfOrg, ]
4.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    nameOfUser, ]
5.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    payPalId, ]
6.  [[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)]
    amount, ]

)



`createDonation` creates a new donation transaction by taking the userId
,orgId ,nameOfOrg ,nameOfUser as parameters.

more_info_if_required

**params**:

-   `userId`: user identifier
-   `orgId`: org identifier
-   `nameOfOrg`: org data
-   `nameOfUser`: user data
-   `payPalId`: for payment
-   `amount`: amount

**returns**:

-   `String`: mutation in string form, to be passed on to graphql
    client.



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  createDonation method

##### Queries class







