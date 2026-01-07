# Overview for `Preview`

## Description

Annotation used to mark functions that return a widget preview.

 NOTE: this interface is not stable and **will change**.

 

 Functions annotated with `@` must return a `Widget` or
 `WidgetBuilder` and be public. This annotation can only be applied
 to top-level functions, static methods defined within a class, and
 public `Widget` constructors and factories with no required arguments.

 ```dart
 @Preview(name: 'Top-level preview')
 Widget  => const Text('Foo');

 @Preview(name: 'Builder preview')
 WidgetBuilder  

 class MyWidget extends StatelessWidget 
 ```
 

## Members

- **name**: `String?`
  A description to be displayed alongside the preview.

 If not provided, no name will be associated with the preview.

- **width**: `double?`
  Artificial width constraint to be applied to the previewed widget.

 If not provided, the previewed widget will attempt to set its own width
 constraints and may result in an unbounded constraint error.

- **height**: `double?`
  Artificial height constraint to be applied to the previewed widget.

 If not provided, the previewed widget will attempt to set its own height
 constraints and may result in an unbounded constraint error.

- **textScaleFactor**: `double?`
  Applies font scaling to text within the previewed widget.

 If not provided, the default text scaling factor provided by [MediaQuery]
 will be used.

- **wrapper**: `Widget Function(Widget)?`
  Wraps the previewed [Widget] in a [Widget] tree.

 This function can be used to perform dependency injection or setup
 additional scaffolding needed to correctly render the preview.

## Constructors

### Unnamed Constructor
Annotation used to mark functions that return widget previews.

