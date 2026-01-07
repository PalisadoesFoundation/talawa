# Overview for `SelectedContentRange`

## Description

This class stores the range information of the selection under a [Selectable]
 or [SelectionHandler].

 The [SelectedContentRange] for a given [Selectable] or [SelectionHandler]
 can be retrieved by calling [SelectionHandler.getSelection].

## Dependencies

- Diagnosticable

## Members

- **startOffset**: `int`
  The start of the selection relative to the start of the content.

 
 For example a [Text] widget's content is in the format of an [TextSpan] tree.

 Take the [Text] widget and [TextSpan] tree below:

 
 ```dart
 const Text.rich(
   TextSpan(
     text: 'Hello world, ',
     children: <InlineSpan>[
       WidgetSpan(
         child: Text('how are you today? '),
       ),
       TextSpan(
         text: 'Good, thanks for asking.',
       ),
     ],
   ),
 )
 ```
 

 If we select from the beginning of 'world' to the end of the '.'
 at the end of the [TextSpan] tree, the [SelectedContentRange] from
 [SelectionHandler.getSelection] will be relative to the text of the
 [TextSpan] tree, with [WidgetSpan] content being flattened. The [startOffset]
 will be 6, and [endOffset] will be 56. This takes into account the
 length of the content in the [WidgetSpan], which is 19, making the overall
 length of the content 56.
 

- **endOffset**: `int`
  The end of the selection relative to the start of the content.

 

## Constructors

### Unnamed Constructor
Creates a [SelectedContentRange] with the given values.

