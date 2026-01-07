# Overview for `RenderSemanticsAnnotations`

## Description

Add annotations to the [SemanticsNode] for this subtree.

## Dependencies

- RenderProxyBox

## Members

- **_properties**: `SemanticsProperties`
- **_container**: `bool`
- **_explicitChildNodes**: `bool`
- **_excludeSemantics**: `bool`
- **_blockUserActions**: `bool`
- **_attributedLabel**: `AttributedString?`
- **_attributedValue**: `AttributedString?`
- **_attributedIncreasedValue**: `AttributedString?`
- **_attributedDecreasedValue**: `AttributedString?`
- **_attributedHint**: `AttributedString?`
- **_textDirection**: `TextDirection?`
## Constructors

### Unnamed Constructor
Creates a render object that attaches a semantic annotation.

 If the [SemanticsProperties.attributedLabel] is not null, the [textDirection] must also not be null.

