
<div>

# loadKeyPair method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)[\<[[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html)],
[[PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)]\>]]\>]]
loadKeyPair(

1.  [[[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.md)]
    hive]

)



Loads secret keys from the Hive db.

**params**:

-   `hive`: The
    [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)
    to load keys from.

**returns**:

-   `Future&lt;AsymmetricKeyPair&lt;PublicKey, PrivateKey&gt;&gt;`: The public and
    private key pair



## Implementation

``` language-dart
Future&lt;AsymmetricKeyPair&lt;PublicKey, PrivateKey&gt;&gt; loadKeyPair(
  HiveInterface hive,
) async 
```







1.  [talawa](../../index.md)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  loadKeyPair method

##### Encryptor class







