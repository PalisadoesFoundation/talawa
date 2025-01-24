




Validator class - validators library - Dart API







menu

1. [talawa](../index.html)
2. [utils/validators.dart](../utils_validators/utils_validators-library.html)
3. Validator class

Validator


dark\_mode

light\_mode




# Validator class


This class creats various validator methods for the application.

They are used to validate information given by the users.


## Constructors

[Validator](../utils_validators/Validator/Validator.html)()




## Properties

[hashCode](../utils_validators/Validator/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[runtimeType](../utils_validators/Validator/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[noSuchMethod](../utils_validators/Validator/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](../utils_validators/Validator/toString.html)()
→ String


A string representation of this object.
inherited

[validateUrlExistence](../utils_validators/Validator/validateUrlExistence.html)(String url)
→ Future<bool?>


Method to validate already exisiting URL.



## Operators

[operator ==](../utils_validators/Validator/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



## Static Methods

[validateEmail](../utils_validators/Validator/validateEmail.html)(String email)
→ String?


Method to validate a user's email.

[validateEventForm](../utils_validators/Validator/validateEventForm.html)(String value, String? label)
→ String?


Method to validate event form.

[validateEventTime](../utils_validators/Validator/validateEventTime.html)([TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html) startTime, [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html) endTime)
→ String?


Method to validate event time.

[validateFirstName](../utils_validators/Validator/validateFirstName.html)(String value)
→ String?


Method to validate a user's first name.

[validateLastName](../utils_validators/Validator/validateLastName.html)(String value)
→ String?


Method to validate a user's last name.

[validatePassword](../utils_validators/Validator/validatePassword.html)(String password)
→ String?


Method to validate password.

[validatePasswordConfirm](../utils_validators/Validator/validatePasswordConfirm.html)(String value, String comparator)
→ String?


Method to valid password re-entered for confirmation.

[validateURL](../utils_validators/Validator/validateURL.html)(String value)
→ String?


Method to validate an organization's URL.



 


1. [talawa](../index.html)
2. [validators](../utils_validators/utils_validators-library.html)
3. Validator class

##### validators library





talawa
1.0.0+1






