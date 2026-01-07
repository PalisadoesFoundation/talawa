# Overview for `ListModel`

## Description

Keeps a Dart [List] in sync with an [AnimatedGrid].

 The [insert] and [removeAt] methods apply to both the internal list and
 the animated list that belongs to [listKey].

 This class only exposes as much of the Dart List API as is needed by the
 sample app. More list methods are easily added, however methods that
 mutate the list must make the same changes to the animated list in terms
 of [AnimatedGridState.insertItem] and [AnimatedGridState.removeItem].

## Members

- **listKey**: `GlobalKey&lt;AnimatedGridState&gt;`
- **removedItemBuilder**: `RemovedItemBuilder&lt;E&gt;`
- **_items**: `List&lt;E&gt;`
## Constructors

### Unnamed Constructor


