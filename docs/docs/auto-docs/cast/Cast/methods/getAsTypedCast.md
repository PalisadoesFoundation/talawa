# Method: `getAsTypedCast`

## Description

Enables building up deeply nested generic types without requiring any
 static knowledge or type inference.

 Example usage:

 Cast&lt;dynamic&gt; x = Cast&lt;int&gt;;
 final y = x.getAsTypedCast(<T>(_) => Cast&lt;Foo&lt;T&gt;&gt;);
 print(y.runtimeType); // Cast&lt;Foo&lt;int&gt;&gt;

## Return Type
`R`

## Parameters

- `callback`: `R Function&lt;CastType&gt;(Cast&lt;CastType&gt; self)`
