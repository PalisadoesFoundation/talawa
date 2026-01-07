# Method: `update`

## Description

Updates the value for the provided [key].

 Returns the new value associated with the key.

 If the key is present, invokes [update] with the current value
 and stores the new value in the map.

 If the key is not present and [ifAbsent] is provided, calls [ifAbsent]
 and adds the key with the returned value to the map.

 If the key is not present, [ifAbsent] must be provided.
 ```dart
 final planetsFromSun = <int, String>;
 // Update value for known key value 2.
 planetsFromSun.update(2, (value) => 'Venus');
 print(planetsFromSun); // 

 final largestPlanets = <int, String>;
 // Key value 8 is missing from list, add it using [ifAbsent].
 largestPlanets.update(8, (value) => 'New', ifAbsent:  => 'Mercury');
 print(largestPlanets); // 
 ```

## Return Type
`V`

## Parameters

- `key`: `K`
- ``: `dynamic`
- ``: `dynamic`
