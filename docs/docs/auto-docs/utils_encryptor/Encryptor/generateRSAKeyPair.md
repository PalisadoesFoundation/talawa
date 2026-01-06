
<div>

# generateRSAKeyPair method

</div>


[[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)[\<[[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html)],
[[PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)]\>]]




Generates RSA Key Pairs (Public/Private).

Should be called only during app\'s first initialization, and any future
usage should be done by getting the keys from the local storage.

**params**: None

**returns**:

-   `AsymmetricKeyPair&lt;PublicKey, PrivateKey&gt;`: The generated public and
    private keys.



## Implementation

``` language-dart
AsymmetricKeyPair&lt;PublicKey, PrivateKey&gt;  
```







1.  [talawa](../../index.md)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  generateRSAKeyPair method

##### Encryptor class







