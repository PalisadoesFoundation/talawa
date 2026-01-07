# Method: `adapt`

## Description

Typically, this is overridden to return an instance of a custom component
 ThemeData class, like [SwitchThemeData], instead of the defaultValue.

 Factory constructors that support adaptations - currently only
 [Switch.adaptive] - look for a type-specific adaptation in
 [ThemeData.adaptationMap] when computing their effective default component
 theme. If a matching adaptation is not found, the component may choose to
 use a default adaptation. For example, the [Switch.adaptive] component
 uses an empty [SwitchThemeData] if a matching adaptation is not found, for
 the sake of backwards compatibility.

 
 This sample shows how to create and use subclasses of [Adaptation] that
 define adaptive [SwitchThemeData]s. The [adapt] method in this example is
 overridden to only customize cupertino-style switches, but it can also be
 used to customize any other platforms.

 ** See code in examples/api/lib/material/switch/switch.4.dart **
 

## Return Type
`T`

## Parameters

- `theme`: `ThemeData`
- `defaultValue`: `T`
