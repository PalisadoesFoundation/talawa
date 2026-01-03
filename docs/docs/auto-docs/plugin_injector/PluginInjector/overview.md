# Overview for `PluginInjector`

## Description

Renders plugin-injected widgets at specific locations.

 This widget allows plugins to inject custom UI components anywhere in the app
 by specifying an injector type.

 Currently supported injector types:
 - g1: Menu page - under Plugins section
 - g2: Post content - under post caption

 Example usage:
 ```dart
 // In your screen/widget:
 PluginInjector(
   injectorType: InjectorType.g1,  // Menu page injector
 )
 ```

## Dependencies

- StatelessWidget

## Members

- **injectorType**: `InjectorType`
  Target injection location.

- **data**: `Map<String, dynamic>?`
  Optional data passed to injectors.

- **padding**: `EdgeInsetsGeometry?`
  Optional padding around injected widgets.

## Constructors

### Unnamed Constructor
Creates a widget for rendering plugin injectors.

 **params**:
 * `key`: Optional widget key
 * `injectorType`: Target injection location
 * `data`: Optional data passed to injectors
 * `padding`: Optional padding around injected widgets

