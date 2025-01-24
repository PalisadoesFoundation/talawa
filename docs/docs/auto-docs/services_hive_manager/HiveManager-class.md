




HiveManager class - hive\_manager library - Dart API







menu

1. [talawa](../index.html)
2. [services/hive\_manager.dart](../services_hive_manager/services_hive_manager-library.html)
3. HiveManager class

HiveManager


dark\_mode

light\_mode




# HiveManager class


A manager class responsible for initializing and tearing down Hive, a local database for Flutter.

The `HiveManager` class provides methods to initialize Hive with necessary adapters and open boxes for
various models used throughout the application. It also provides a method to close all opened Hive boxes
when they are no longer needed.


## Constructors

[HiveManager](../services_hive_manager/HiveManager/HiveManager.html)()




## Properties

[hashCode](../services_hive_manager/HiveManager/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[runtimeType](../services_hive_manager/HiveManager/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[noSuchMethod](../services_hive_manager/HiveManager/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](../services_hive_manager/HiveManager/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](../services_hive_manager/HiveManager/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



## Static Methods

[closeBox](../services_hive_manager/HiveManager/closeBox.html)<T>(String boxName)
→ Future<void>


Closes the `boxName` named box.

[initializeHive](../services_hive_manager/HiveManager/initializeHive.html)({required Directory dir})
→ Future<void>


Initializes Hive with the specified directory.

[openBox](../services_hive_manager/HiveManager/openBox.html)<T>(String boxName)
→ Future<void>


Opens the `boxName` named box.

[registerAdapter](../services_hive_manager/HiveManager/registerAdapter.html)<T>([TypeAdapter](https://pub.dev/documentation/hive/2.2.3/hive/TypeAdapter-class.html)<T> adapter)
→ Future<void>


Registers the `adapter` named adapter.

[registerAdapters](../services_hive_manager/HiveManager/registerAdapters.html)()
→ Future<void>


Registers the necessary Hive adapters for the models used in the application.

[teardownHive](../services_hive_manager/HiveManager/teardownHive.html)()
→ Future<void>


Closes all opened Hive boxes and the Hive instance itself.



 


1. [talawa](../index.html)
2. [hive\_manager](../services_hive_manager/services_hive_manager-library.html)
3. HiveManager class

##### hive\_manager library





talawa
1.0.0+1






