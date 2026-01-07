# Overview for `CupertinoThemeData`

## Description

Styling specifications for a [CupertinoTheme].

 All constructor parameters can be null, in which case a
 [CupertinoColors.activeBlue] based default iOS theme styling is used.

 Parameters can also be partially specified, in which case some parameters
 will cascade down to other dependent parameters to create a cohesive
 visual effect. For instance, if a [primaryColor] is specified, it would
 cascade down to affect some fonts in [textTheme] if [textTheme] is not
 specified.

 See also:

  * [CupertinoTheme], in which this [CupertinoThemeData] is inserted.
  * [ThemeData], a Material equivalent that also configures Cupertino
    styling via a [CupertinoThemeData] subclass [MaterialBasedCupertinoThemeData].

## Dependencies

- NoDefaultCupertinoThemeData, Diagnosticable

## Members

- **_defaults**: `_CupertinoThemeDefaults`
## Constructors

### Unnamed Constructor
Creates a [CupertinoTheme] styling specification.

 Unspecified parameters default to a reasonable iOS default style.

### raw
Same as the default constructor but with positional arguments to avoid
 forgetting any and to specify all arguments.

 Used by subclasses to get the superclass's defaulting behaviors.

#### Parameters

- `brightness`: `Brightness?`
- `primaryColor`: `Color?`
- `primaryContrastingColor`: `Color?`
- `textTheme`: `CupertinoTextThemeData?`
- `barBackgroundColor`: `Color?`
- `scaffoldBackgroundColor`: `Color?`
- `applyThemeToAll`: `bool?`
### _rawWithDefaults


#### Parameters

- `brightness`: `Brightness?`
- `primaryColor`: `Color?`
- `primaryContrastingColor`: `Color?`
- `textTheme`: `CupertinoTextThemeData?`
- `barBackgroundColor`: `Color?`
- `scaffoldBackgroundColor`: `Color?`
- `applyThemeToAll`: `bool?`
- `_defaults`: `dynamic`
