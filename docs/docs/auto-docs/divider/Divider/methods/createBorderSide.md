# Method: `createBorderSide`

## Description

Computes the [BorderSide] that represents a divider.

 If [color] is null, then [DividerThemeData.color] is used. If that is also
 null, then if [ThemeData.useMaterial3] is true then it defaults to
 [ThemeData.colorScheme]'s [ColorScheme.outlineVariant]. Otherwise
 [ThemeData.dividerColor] is used.

 If [width] is null, then [DividerThemeData.thickness] is used. If that is
 also null, then this defaults to 0.0 (a hairline border).

 If [context] is null, the default color of [BorderSide] is used and the
 default width of 0.0 is used.

 

 This example uses this method to create a box that has a divider above and
 below it. This is sometimes useful with lists, for instance, to separate a
 scrollable section from the rest of the interface.

 ```dart
 DecoratedBox(
   decoration: BoxDecoration(
     border: Border(
       top: Divider.createBorderSide(context),
       bottom: Divider.createBorderSide(context),
     ),
   ),
   // child: ...
 )
 ```
 

## Return Type
`BorderSide`

## Parameters

- `context`: `BuildContext?`
- ``: `dynamic`
- ``: `dynamic`
