




createDonation method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. createDonation method

createDonation


dark\_mode

light\_mode




# createDonation method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
createDonation(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) userId,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId,
3. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) nameOfOrg,
4. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) nameOfUser,
5. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) payPalId,
6. [double](https://api.flutter.dev/flutter/dart-core/double-class.html) amount,

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
2. [queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. createDonation method

##### Queries class





talawa
1.0.0+1






