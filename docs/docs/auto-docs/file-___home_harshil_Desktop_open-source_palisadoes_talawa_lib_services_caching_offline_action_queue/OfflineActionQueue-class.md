




OfflineActionQueue class - offline\_action\_queue library - Dart API







menu

1. [talawa](../index.html)
2. [services/caching/offline\_action\_queue.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/)
3. OfflineActionQueue class

OfflineActionQueue


dark\_mode

light\_mode




# OfflineActionQueue class


OfflineActionQueue class manages a queue for offline actions.

This class provides the following functionalities:

* `initialize` : initializes the queue by registering adapters and opening the queue.
* `registerAdapters` : registers the required Hive adapters.
* `openQueue` : opens the Hive box for the offline action queue.
* `addAction` : adds an action to the queue with a TTL.
* `getActions` : retrieves all valid actions from the queue.
* `removeAction` : removes a specific action from the queue.
* `clearActions` : clears all actions from the queue.
* `removeExpiredActions` : removes expired actions from the queue.

## Constructors

[OfflineActionQueue](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue/OfflineActionQueue.html)()




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

[addAction](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue/addAction.html)(dynamic action)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>


Adds an action to the queue with a TTL.

[clearActions](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue/clearActions.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>


Clears all actions from the queue.

[getActions](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue/getActions.html)()
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)


Retrieves all valid actions from the queue.

[initialize](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue/initialize.html)()
→ void


Initializes the queue by registering adapters and opening the queue.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[openQueue](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue/openQueue.html)()
→ void


Opens the Hive box for the offline action queue.

[removeAction](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue/removeAction.html)(dynamic key)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>


Removes a specific action from the queue.

[removeExpiredActions](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue/removeExpiredActions.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>


Removes expired actions from the queue.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



## Constants

[boxName](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/OfflineActionQueue/boxName-constant.html)
→ const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

Offline Action Queue box name.



 


1. [talawa](../index.html)
2. [offline\_action\_queue](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_offline_action_queue/)
3. OfflineActionQueue class

##### offline\_action\_queue library





talawa
1.0.0+1






