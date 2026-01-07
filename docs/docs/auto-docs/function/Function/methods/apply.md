# Method: `apply`

## Description

Dynamically call [function] with the specified arguments.

 Acts the same as dynamically calling [function] with
 positional arguments corresponding to the elements of [positionalArguments]
 and named arguments corresponding to the elements of [namedArguments].

 This includes giving the same errors if [function]
 expects different parameters.

 Example:
 ```dart
 void printWineDetails(int vintage, ) 

 void  

 // Output of the example is:
 // Name: Dominus Estate, Country: USA, Vintage: 2018
 ```

 If [positionalArguments] is null, it's considered an empty list.
 If [namedArguments] is omitted or null, it is considered an empty map.

 ```dart
 void  

 void  
 // Output of the example is:
 // Hello world!
 ```

## Parameters

- `function`: `Function`
- `positionalArguments`: `List&lt;dynamic&gt;?`
- ``: `dynamic`
