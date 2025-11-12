



menu

1.  [talawa](../../index.md)
2.  [exceptions/graphql_exception_resolver.dart](../../exceptions_graphql_exception_resolver/)
3.  [GraphqlExceptionResolver](../../exceptions_graphql_exception_resolver/GraphqlExceptionResolver-class.md)
4.  encounteredExceptionOrError static method


encounteredExceptionOrError


 dark_mode   light_mode 




<div>

# encounteredExceptionOrError static method

</div>


[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]
encounteredExceptionOrError(

1.  [[[OperationException](https://pub.dev/documentation/graphql/5.2.1/graphql/OperationException-class.md)]
    exception,
    )



This function is used to check if any exceptions or error encountered.
The return type is `boolean`.

**params**:

-   `exception`: OperationException which occur when calling for graphql
    post request
-   `showSnackBar`: Tell if the the place where this function is called
    wants a SnackBar on error

**returns**:

-   `bool?`: returns a bool whether or not their is error, can be null



## Implementation

``` language-dart
static bool? encounteredExceptionOrError(
  OperationException exception, ) 
```







1.  [talawa](../../index.md)
2.  [graphql_exception_resolver](../../exceptions_graphql_exception_resolver/)
3.  [GraphqlExceptionResolver](../../exceptions_graphql_exception_resolver/GraphqlExceptionResolver-class.md)
4.  encounteredExceptionOrError static method

##### GraphqlExceptionResolver class









 talawa 1.0.0+1 
