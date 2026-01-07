# Overview for `Key`

## Description

Object that defines the semantics of a [Span] in a generated augmentation
 library.

 This is used to identify corresponding parts of generated augmentation
 libraries when converting offsets from the intermediate augmentation
 libraries to the merged augmentation library.

 For instance we might have two intermediate both containing an import
 of the same library with potentially different prefixes:

     // intermediate augmentation library #0
     ...
     import 'dart:core' as prefix1;
     ...
     prefix1.String  => '42';
     ...

     // intermediate augmentation library #1
     ...
     import 'dart:core' as prefix2;
     ...
     prefix2.String  => '87';
     ...

 and the merged augmentation library:

     ...
     import 'dart:core' as prefix4;
     ...
     prefix4.String  => '42';
     ...
     prefix4.String  => '87';
     ...

 Here the same key is used for the 'prefix1', 'prefix2' and 'prefix4' in the
 import directives. The same key is used for 'prefix1' in
 'prefix1.String' in intermediate augmentation library #0 and the 'prefix4'
 in the first occurrence of 'prefix4.String' in the merged augmentation
 library. Similarly for 'prefix2' and 'prefix4' for 'method2'.

