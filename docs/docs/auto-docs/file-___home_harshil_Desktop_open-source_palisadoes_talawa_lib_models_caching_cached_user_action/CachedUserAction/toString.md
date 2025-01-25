




toString method - CachedUserAction class - cached\_user\_action library - Dart API







menu

1. [talawa](../../index.html)
2. [models/caching/cached\_user\_action.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/)
3. [CachedUserAction](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction-class.html)
4. toString method

toString


dark\_mode

light\_mode




# toString method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
toString()
override

A string representation of this object.

Some classes have a default textual representation,
often paired with a static `parse` function (like [int.parse](https://api.flutter.dev/flutter/dart-core/int/parse.html)).
These classes will provide the textual representation as
their string representation.

Other classes have no meaningful textual representation
that a program will care about.
Such classes will typically override `toString` to provide
useful information when inspecting the object,
mainly for debugging or logging.


## Implementation

```
@override
String toString() {
  return '''
    CachedUserAction(
      id: $id,
      operation: $operation,
      variables: $variables,
      timeStamp: $timeStamp,
      expiry: $expiry,
      status: $status,
      metaData: $metaData,
      operationType: $operationType,
    )
  ''';
}
```

 


1. [talawa](../../index.html)
2. [cached\_user\_action](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/)
3. [CachedUserAction](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction-class.html)
4. toString method

##### CachedUserAction class





talawa
1.0.0+1






