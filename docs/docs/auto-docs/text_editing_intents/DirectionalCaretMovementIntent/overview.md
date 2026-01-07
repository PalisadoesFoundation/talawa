# Overview for `DirectionalCaretMovementIntent`

## Description

A [DirectionalTextEditingIntent] that moves the caret or the selection to a
 new location.

## Dependencies

- DirectionalTextEditingIntent

## Members

- **collapseSelection**: `bool`
  Whether this [Intent] should make the selection collapsed (so it becomes a
 caret), after the movement.

 When [collapseSelection] is false, the input field typically only moves
 the current [TextSelection.extent] to the new location, while maintains
 the current [TextSelection.base] location.

 When [collapseSelection] is true, the input field typically should move
 both the [TextSelection.base] and the [TextSelection.extent] to the new
 location.

- **collapseAtReversal**: `bool`
  Whether to collapse the selection when it would otherwise reverse order.

 For example, consider when forward is true and the extent is before the
 base. If collapseAtReversal is true, then this will cause the selection to
 collapse at the base. If it's false, then the extent will be placed at the
 linebreak, reversing the order of base and offset.

 Cannot be true when collapseSelection is true.

- **continuesAtWrap**: `bool`
  Whether or not to continue to the next line at a wordwrap.

 If true, when an [Intent] to go to the beginning/end of a wordwrapped line
 is received and the selection is already at the beginning/end of the line,
 then the selection will be moved to the next/previous line. If false, the
 selection will remain at the wordwrap.

## Constructors

### Unnamed Constructor
Creates a [DirectionalCaretMovementIntent].

