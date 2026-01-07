# Overview for `ExpansionPanelList`

## Description

A material expansion panel list that lays out its children and animates
 expansions.

 The [expansionCallback] is called when the expansion state changes. For
 normal [ExpansionPanelList] widgets, it is the responsibility of the parent
 widget to rebuild the [ExpansionPanelList] with updated values for
 [ExpansionPanel.isExpanded]. For [ExpansionPanelList.radio] widgets, the
 open state is tracked internally and the callback is invoked both for the
 previously open panel, which is closing, and the previously closed panel,
 which is opening.

 
 Here is a simple example of how to use [ExpansionPanelList].

 ** See code in examples/api/lib/material/expansion_panel/expansion_panel_list.0.dart **
 

 See also:

  * [ExpansionPanel], which is used in the [children] property.
  * [ExpansionPanelList.radio], a variant of this widget where only one panel is open at a time.
  * <https://material.io/design/components/lists.html#types>

## Dependencies

- StatefulWidget

## Members

- **children**: `List&lt;ExpansionPanel&gt;`
  The children of the expansion panel list. They are laid out in a similar
 fashion to [ListBody].

- **expansionCallback**: `ExpansionPanelCallback?`
  The callback that gets called whenever one of the expand/collapse buttons
 is pressed. The arguments passed to the callback are the index of the
 pressed panel and whether the panel is currently expanded or not.

 If [ExpansionPanelList.radio] is used, the callback may be called a
 second time if a different panel was previously open. The arguments
 passed to the second callback are the index of the panel that will close
 and false, marking that it will be closed.

 For [ExpansionPanelList], the callback should call [State.setState] when
 it is notified about the closing/opening panel. On the other hand, the
 callback for [ExpansionPanelList.radio] is intended to inform the parent
 widget of changes, as the radio panels' open/close states are managed
 internally.

 This callback is useful in order to keep track of the expanded/collapsed
 panels in a parent widget that may need to react to these changes.

- **animationDuration**: `Duration`
  The duration of the expansion animation.

- **_allowOnlyOnePanelOpen**: `bool`
- **initialOpenPanelValue**: `Object?`
  The value of the panel that initially begins open. (This value is
 only used when initializing with the [ExpansionPanelList.radio]
 constructor.)

- **expandedHeaderPadding**: `EdgeInsets`
  The padding that surrounds the panel header when expanded.

 By default, 16px of space is added to the header vertically (above and below)
 during expansion.

- **dividerColor**: `Color?`
  Defines color for the divider when [ExpansionPanel.isExpanded] is false.

 If [dividerColor] is null, then [DividerThemeData.color] is used. If that
 is null, then [ThemeData.dividerColor] is used.

- **elevation**: `double`
  Defines elevation for the [ExpansionPanel] while it's expanded.

 By default, the value of elevation is 2.

- **expandIconColor**: `Color?`
  

- **materialGapSize**: `double`
  Defines the [MaterialGap.size] of the [MaterialGap] which is placed
 between the [ExpansionPanelList.children] when they're expanded.

 Defaults to `16.0`.

## Constructors

### Unnamed Constructor
Creates an expansion panel list widget. The [expansionCallback] is
 triggered when an expansion panel expand/collapse button is pushed.

### radio
Creates a radio expansion panel list widget.

 This widget allows for at most one panel in the list to be open. The
 expansion panel callback is triggered when an expansion panel
 expand/collapse button is pushed. The [children] objects must be instances
 of [ExpansionPanelRadio].

 
 Here is a simple example of how to implement ExpansionPanelList.radio.

 ** See code in examples/api/lib/material/expansion_panel/expansion_panel_list.expansion_panel_list_radio.0.dart **
 

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
