# Overview for `ToggleablePainter`

## Description

A base class for a [CustomPainter] that may be passed to
 [ToggleableStateMixin.buildToggleable] to draw the visual representation of
 a Toggleable.

 Subclasses must implement the [paint] method to draw the actual visuals of
 the Toggleable.

 If drawing a radial ink reaction is desired (in Material
 Design for example), subclasses may call [paintRadialReaction] in their
 [paint] method.

## Dependencies

- ChangeNotifier, CustomPainter

## Members

- **_position**: `Animation&lt;double&gt;?`
- **_reaction**: `Animation&lt;double&gt;?`
- **_reactionFocusFade**: `Animation&lt;double&gt;?`
- **_reactionHoverFade**: `Animation&lt;double&gt;?`
- **_activeColor**: `Color?`
- **_inactiveColor**: `Color?`
- **_inactiveReactionColor**: `Color?`
- **_reactionColor**: `Color?`
- **_hoverColor**: `Color?`
- **_focusColor**: `Color?`
- **_splashRadius**: `double?`
- **_downPosition**: `Offset?`
- **_isFocused**: `bool?`
- **_isHovered**: `bool?`
- **_isActive**: `bool?`
