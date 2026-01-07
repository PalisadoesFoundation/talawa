# Overview for `RenderParagraph`

## Description

A render object that displays a paragraph of text.

## Dependencies

- RenderBox, ContainerRenderObjectMixin, RenderInlineChildrenContainerDefaults, RelayoutWhenSystemFontsChangeMixin

## Members

- **_placeholderCharacter**: `String`
- **_textPainter**: `TextPainter`
- **_textIntrinsicsCache**: `TextPainter?`
- **_cachedAttributedLabels**: `List&lt;AttributedString&gt;?`
- **_cachedCombinedSemanticsInfos**: `List&lt;InlineSpanSemanticsInformation&gt;?`
- **_lastSelectableFragments**: `List&lt;_SelectableFragment&gt;?`
- **_registrar**: `SelectionRegistrar?`
- **_softWrap**: `bool`
- **_overflow**: `TextOverflow`
- **_selectionColor**: `Color?`
- **_needsClipping**: `bool`
- **_overflowShader**: `ui.Shader?`
- **_placeholderDimensions**: `List&lt;PlaceholderDimensions&gt;?`
- **_semanticsInfo**: `List&lt;InlineSpanSemanticsInformation&gt;?`
  Collected during [describeSemanticsConfiguration], used by
 [assembleSemanticsNode].

- **_cachedChildNodes**: `LinkedHashMap&lt;Key, SemanticsNode&gt;?`
## Constructors

### Unnamed Constructor
Creates a paragraph render object.

 The [maxLines] property may be null (and indeed defaults to null), but if
 it is not null, it must be greater than zero.

