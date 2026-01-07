# Overview for `AvoidFutureCatchError`

## Description

Don't use Future.catchError or Future.onError.

 See https://github.com/flutter/flutter/pull/130662 for more context.

 **BAD:**

 ```dart
 Future<Object?>  

 Future<Object?>  
 ```

 **GOOD:**

 ```dart
 Future<Object?>  

 Future<Object?>  
 ```

## Dependencies

- AnalyzeRule

## Members

- **_errors**: `Map&lt;ResolvedUnitResult, List&lt;AstNode&gt;&gt;`
