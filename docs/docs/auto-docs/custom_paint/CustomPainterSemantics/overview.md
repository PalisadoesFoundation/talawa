# Overview for `CustomPainterSemantics`

## Description

Contains properties describing information drawn in a rectangle contained by
 the [Canvas] used by a [CustomPaint].

 This information is used, for example, by assistive technologies to improve
 the accessibility of applications.

 Implement [CustomPainter.semanticsBuilder] to build the semantic
 description of the whole picture drawn by a [CustomPaint], rather than one
 particular rectangle.

 See also:

  * [SemanticsNode], which is created using the properties of this class.
  * [CustomPainter], which creates instances of this class.

## Members

- **key**: `Key?`
  Identifies this object in a list of siblings.

 [SemanticsNode] inherits this key, so that when the list of nodes is
 updated, its nodes are updated from [CustomPainterSemantics] with matching
 keys.

 If this is null, the update algorithm does not guarantee which
 [SemanticsNode] will be updated using this instance.

 This value is assigned to [SemanticsNode.key] during update.

- **rect**: `Rect`
  The location and size of the box on the canvas where this piece of semantic
 information applies.

 This value is assigned to [SemanticsNode.rect] during update.

- **transform**: `Matrix4?`
  The transform from the canvas' coordinate system to its parent's
 coordinate system.

 This value is assigned to [SemanticsNode.transform] during update.

- **properties**: `SemanticsProperties`
  Contains properties that are assigned to the [SemanticsNode] created or
 updated from this object.

 See also:

  * [Semantics], which is a widget that also uses [SemanticsProperties] to
    annotate.

- **tags**: `Set&lt;SemanticsTag&gt;?`
  Tags used by the parent [SemanticsNode] to determine the layout of the
 semantics tree.

 This value is assigned to [SemanticsNode.tags] during update.

## Constructors

### Unnamed Constructor
Creates semantics information describing a rectangle on a canvas.

