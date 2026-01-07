# Overview for `TextParentData`

## Description

Parent data used by [RenderParagraph] and [RenderEditable] to annotate
 inline contents (such as [WidgetSpan]s) with.

## Dependencies

- ParentData, ContainerParentDataMixin

## Members

- **_offset**: `Offset?`
- **span**: `PlaceholderSpan?`
  The [PlaceholderSpan] associated with this render child.

 This field is usually set by a [ParentDataWidget], and is typically not
 null when `performLayout` is called.

