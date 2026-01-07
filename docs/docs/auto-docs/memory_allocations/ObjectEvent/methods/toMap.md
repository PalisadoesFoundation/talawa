# Method: `toMap`

## Description

The representation of the event in a form, acceptable by a
 pure dart library, that cannot depend on Flutter.

 The method enables code like:
 ```dart
 void myDartMethod(Map&lt;Object, Map&lt;String, Object&gt;&gt; event) 
 FlutterMemoryAllocations.instance
   .addListener((ObjectEvent event) => myDartMethod(event.));
 ```

## Return Type
`Map&lt;Object, Map&lt;String, Object&gt;&gt;`

