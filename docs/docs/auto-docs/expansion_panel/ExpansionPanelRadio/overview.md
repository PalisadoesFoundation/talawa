# Overview for `ExpansionPanelRadio`

## Description

An expansion panel that allows for radio-like functionality.
 This means that at any given time, at most, one [ExpansionPanelRadio]
 can remain expanded.

 A unique identifier [value] must be assigned to each panel.
 This identifier allows the [ExpansionPanelList] to determine
 which [ExpansionPanelRadio] instance should be expanded.

 See [ExpansionPanelList.radio] for a sample implementation.

## Dependencies

- ExpansionPanel

## Members

- **value**: `Object`
  The value that uniquely identifies a radio panel so that the currently
 selected radio panel can be identified.

## Constructors

### Unnamed Constructor
An expansion panel that allows for radio functionality.

 A unique [value] must be passed into the constructor.

