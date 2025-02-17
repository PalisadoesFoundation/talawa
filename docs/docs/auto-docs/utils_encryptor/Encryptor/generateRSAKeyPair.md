
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

-   `AsymmetricKeyPair<PublicKey, PrivateKey>`: The generated public and
    private keys.



## Implementation

``` language-dart
AsymmetricKeyPair<PublicKey, PrivateKey>  {
  final secureRandom = ;
  final random = Random.;
  final List<int> seeds = [];
  for (int i = 0; i < 32; i++) {
    seeds.add(random.nextInt(255));
  }
  secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));
  final rsapars = RSAKeyGeneratorParameters(BigInt.from(65537), 2048, 64);
  final params = ParametersWithRandom(rsapars, secureRandom);
  final keyGenerator = ;
  keyGenerator.init(params);
  return keyGenerator.;
}
```







1.  [talawa](../../index.html)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.html)
4.  generateRSAKeyPair method

##### Encryptor class







