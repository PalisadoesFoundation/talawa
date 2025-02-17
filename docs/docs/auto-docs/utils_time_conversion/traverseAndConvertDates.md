
<div>

# traverseAndConvertDates function

</div>


void traverseAndConvertDates(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    obj, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    convertFn(]
    1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]]

    ),
3.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]]
    splitFn(]
    1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]]

    )

)



Traverses a nested map and converts date and time fields to the desired
format.

**params**:

-   `obj`: The nested map to traverse and convert.
-   `convertFn`: A function that converts a combined date and time
    string to the desired format.
-   `splitFn`: A function that splits a converted date and time string
    into separate date and time strings.

**returns**: None



## Implementation

``` language-dart
void traverseAndConvertDates(
  Map<String, dynamic> obj,
  String Function(String) convertFn,
  Map<String, String> Function(String) splitFn,
) 
```







1.  [talawa](../index.md)
2.  [time_conversion](../utils_time_conversion/)
3.  traverseAndConvertDates function

##### time_conversion library







