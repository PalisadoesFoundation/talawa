# Overview for `FilteredElementList`

## Description

/**
 * An indexable collection of a node's direct descendants in the document tree,
 * filtered so that only elements are in the collection.
 */

## Dependencies

- ListBase, NodeListWrapper

## Members

- **_node**: `Node`
- **_childNodes**: `List&lt;Node&gt;`
## Constructors

### Unnamed Constructor
/**
   * Creates a collection of the elements that descend from a node.
   *
   * Example usage:
   *
   *     var filteredElements = new FilteredElementList(query("#container"));
   *     // filteredElements is [a, b, c].
   */

