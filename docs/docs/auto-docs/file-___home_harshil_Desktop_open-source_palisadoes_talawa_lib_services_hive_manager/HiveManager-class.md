




HiveManager class - hive\_manager library - Dart API







menu

1. [talawa](../index.html)
2. [services/hive\_manager.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/)
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

[HiveManager](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager/HiveManager.html)()




## Properties

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited



## Methods

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



## Static Methods

[closeBox](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager/closeBox.html)<T>([String](https://api.flutter.dev/flutter/dart-core/String-class.html) boxName)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Closes the `boxName` named box.

[initializeHive](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager/initializeHive.html)({required [Directory](https://api.flutter.dev/flutter/dart-io/Directory-class.html) dir})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Initializes Hive with the specified directory.

[openBox](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager/openBox.html)<T>([String](https://api.flutter.dev/flutter/dart-core/String-class.html) boxName)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Opens the `boxName` named box.

[registerAdapter](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager/registerAdapter.html)<T>(dynamic adapter)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Registers the `adapter` named adapter.

[registerAdapters](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager/registerAdapters.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Registers the necessary Hive adapters for the models used in the application.

[teardownHive](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/HiveManager/teardownHive.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Closes all opened Hive boxes and the Hive instance itself.



 


1. [talawa](../index.html)
2. [hive\_manager](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_hive_manager/)
3. HiveManager class

##### hive\_manager library





talawa
1.0.0+1






