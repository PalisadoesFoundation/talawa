# Overview for `IOOverrides`

## Description

Facilities for overriding various APIs of `dart:io` with mock
 implementations.

 This abstract base class should be extended with overrides for the
 operations needed to construct mocks. The implementations in this base class
 default to the actual `dart:io` implementation. For example:

 ```dart
 class MyDirectory implements Directory 

 void  
 ```

## Members

- **_global**: `IOOverrides?`
