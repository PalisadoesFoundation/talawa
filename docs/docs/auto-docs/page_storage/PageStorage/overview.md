# Overview for `PageStorage`

## Description

Establish a subtree in which widgets can opt into persisting states after
 being destroyed.

 [PageStorage] is used to save and restore values that can outlive the widget.
 For example, when multiple pages are grouped in tabs, when a page is
 switched out, its widget is destroyed and its state is lost. By adding a
 [PageStorage] at the root and adding a [PageStorageKey] to each page, some of the
 page's state (e.g. the scroll position of a [Scrollable] widget) will be stored
 automatically in its closest ancestor [PageStorage], and restored when it's
 switched back.

 Usually you don't need to explicitly use a [PageStorage], since it's already
 included in routes.

 [PageStorageKey] is used by [Scrollable] if [ScrollController.keepScrollOffset]
 is enabled to save their [ScrollPosition]s. When more than one scrollable
 ([ListView], [SingleChildScrollView], [TextField], etc.) appears within the
 widget's closest ancestor [PageStorage] (such as within the same route), to
 save all of their positions independently, one must give each of them unique
 [PageStorageKey]s, or set the `keepScrollOffset` property of some such
 widgets to false to prevent saving.

 
 This sample shows how to explicitly use a [PageStorage] to
 store the states of its children pages. Each page includes a scrollable
 list, whose position is preserved when switching between the tabs thanks to
 the help of [PageStorageKey].

 ** See code in examples/api/lib/widgets/page_storage/page_storage.0.dart **
 

 See also:

  * [ModalRoute], which includes this class.

## Dependencies

- StatelessWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 

- **bucket**: `PageStorageBucket`
  The page storage bucket to use for this subtree.

## Constructors

### Unnamed Constructor
Creates a widget that provides a storage bucket for its descendants.

