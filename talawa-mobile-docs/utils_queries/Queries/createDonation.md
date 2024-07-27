


# createDonation method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) createDonation
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) userId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) nameOfOrg, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) nameOfUser, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) payPalId, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) amount)





<p><code>createDonation</code> creates a new donation transaction by taking the userId ,orgId ,nameOfOrg ,nameOfUser as parameters</p>



## Implementation

```dart
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







