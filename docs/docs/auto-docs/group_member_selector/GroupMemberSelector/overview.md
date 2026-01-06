# Overview for `GroupMemberSelector`

## Description

GroupMemberSelector is a widget for selecting organization members for group chat creation.

 This widget handles:
 - Loading organization members
 - Displaying members with checkboxes
 - Managing member selection state
 - Validating selection limits

## Dependencies

- StatefulWidget

## Members

- **onMembersChanged**: ` Function(Set&lt;User&gt;)`
  Callback function called when selected members change.

- **selectedMembers**: `Set&lt;User&gt;`
  Currently selected members.

## Constructors

### Unnamed Constructor
Creates a GroupMemberSelector widget.

