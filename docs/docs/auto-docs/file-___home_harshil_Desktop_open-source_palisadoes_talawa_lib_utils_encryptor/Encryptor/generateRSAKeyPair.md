




generateRSAKeyPair method - Encryptor class - encryptor library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/encryptor.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. [Encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor-class.html)
4. generateRSAKeyPair method

generateRSAKeyPair


dark\_mode

light\_mode




# generateRSAKeyPair method


dynamic
generateRSAKeyPair()

Generates RSA Key Pairs (Public/Private).

Should be called only during app's first initialization,
and any future usage should be done by getting the keys
from the local storage.

**params**:
None

**returns**:

* `AsymmetricKeyPair<PublicKey, PrivateKey>`: The generated
  public and private keys.

## Implementation

```
AsymmetricKeyPair<PublicKey, PrivateKey> generateRSAKeyPair() {
  final secureRandom = FortunaRandom();
  final random = Random.secure();
  final List<int> seeds = [];
  for (int i = 0; i < 32; i++) {
    seeds.add(random.nextInt(255));
  }
  secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));
  final rsapars = RSAKeyGeneratorParameters(BigInt.from(65537), 2048, 64);
  final params = ParametersWithRandom(rsapars, secureRandom);
  final keyGenerator = RSAKeyGenerator();
  keyGenerator.init(params);
  return keyGenerator.generateKeyPair();
}
```

 


1. [talawa](../../index.html)
2. [encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. [Encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor-class.html)
4. generateRSAKeyPair method

##### Encryptor class





talawa
1.0.0+1






