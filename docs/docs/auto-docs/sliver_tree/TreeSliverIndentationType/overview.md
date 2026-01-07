# Overview for `TreeSliverIndentationType`

## Description

The style of indentation for [TreeSliverNode]s in a [TreeSliver], as
 handled by [RenderTreeSliver].

 
 By default, the indentation is handled by [RenderTreeSliver]. Child nodes
 are offset by the indentation specified by
 [TreeSliverIndentationType.value] in the cross axis of the viewport. This
 means the space allotted to the indentation will not be part of the space
 made available to the Widget returned by [TreeSliver.treeNodeBuilder].

 Alternatively, the indentation can be implemented in
 [TreeSliver.treeNodeBuilder], with the depth of the given tree row
 accessed by [TreeSliverNode.depth]. This allows for more customization in
 building tree rows, such as filling the indented area with decorations or
 ink effects.

 
 This example shows a highly customized [TreeSliver] configured to
 [TreeSliverIndentationType.none]. This allows the indentation to be handled
 by the developer in [TreeSliver.treeNodeBuilder], where a decoration is
 used to fill the indented space.

 ** See code in examples/api/lib/widgets/sliver/sliver_tree.1.dart **
 

 

## Members

- **_value**: `double`
- **standard**: `TreeSliverIndentationType`
  The default indentation of child [TreeSliverNode]s in a [TreeSliver].

 Child nodes will be offset by 10 pixels for each level in the tree.

- **none**: `TreeSliverIndentationType`
  Configures no offsetting of child nodes in a [TreeSliver].

 Useful if the indentation is implemented in the
 [TreeSliver.treeNodeBuilder] instead for more customization options.

 Child nodes will not be offset in the tree.

## Constructors

### _internal


#### Parameters

- `value`: `double`
