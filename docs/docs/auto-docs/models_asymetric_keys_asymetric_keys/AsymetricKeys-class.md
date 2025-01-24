




AsymetricKeys class - asymetric\_keys library - Dart API







menu

1. [talawa](../index.html)
2. [models/asymetric\_keys/asymetric\_keys.dart](../models_asymetric_keys_asymetric_keys/models_asymetric_keys_asymetric_keys-library.html)
3. AsymetricKeys class

AsymetricKeys


dark\_mode

light\_mode




# AsymetricKeys class


Hive Type for `AssymetricKeys`.


Inheritance

* Object
* [HiveObject](https://pub.dev/documentation/hive/2.2.3/hive/HiveObject-class.html)
* AsymetricKeys

Annotations

* @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId: 7)



## Constructors

[AsymetricKeys](../models_asymetric_keys_asymetric_keys/AsymetricKeys/AsymetricKeys.html)({required [AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)<[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html), [PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)> keyPair})




## Properties

[box](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/box.html)
→ [BoxBase](https://pub.dev/documentation/hive/2.2.3/hive/BoxBase-class.html)?

Get the box in which this object is stored. Returns `null` if object has
not been added to a box yet.
no setterinherited

[hashCode](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[isInBox](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/isInBox.html)
→ bool

Returns whether this object is currently stored in a box.
no setterinherited

[key](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/key.html)
→ dynamic

Get the key associated with this object. Returns `null` if object has
not been added to a box yet.
no setterinherited

[keyPair](../models_asymetric_keys_asymetric_keys/AsymetricKeys/keyPair.html)
→ [AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)<[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html), [PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)>

The key pair to work with.
final

[runtimeType](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[delete](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/delete.html)()
→ Future<void>


Deletes this object from the box it is stored in.
inherited

[noSuchMethod](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[save](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/save.html)()
→ Future<void>


Persists this object.
inherited

[toString](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [asymetric\_keys](../models_asymetric_keys_asymetric_keys/models_asymetric_keys_asymetric_keys-library.html)
3. AsymetricKeys class

##### asymetric\_keys library





talawa
1.0.0+1






