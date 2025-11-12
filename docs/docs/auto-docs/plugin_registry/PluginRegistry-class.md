



menu

1.  [talawa](../index.md)
2.  [plugin/registry.dart](../plugin_registry/)
3.  PluginRegistry class


PluginRegistry


 dark_mode   light_mode 




<div>

# PluginRegistry class

</div>


A very small in-memory registry for activated plugins.

**params**: None



## Constructors

[PluginRegistry](../plugin_registry/PluginRegistry/PluginRegistry.md)

:   



## Properties

[[all](../plugin_registry/PluginRegistry/all.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[TalawaMobilePlugin](../plugin_types/TalawaMobilePlugin-class.md)]\>]]
:   All registered plugins.
    ::: features
    no setter
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[clear](../plugin_registry/PluginRegistry/clear.md) [→ void ]
:   Removes all registered plugins.

[[collectInjectors](../plugin_registry/PluginRegistry/collectInjectors.md)][([[[InjectorType](../plugin_types/InjectorType.md)] type]) [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[PluginInjectorExtension](../plugin_types/PluginInjectorExtension-class.md)]\>]] ]
:   Collects injectors for a specific type.

[[collectMenuItems](../plugin_registry/PluginRegistry/collectMenuItems.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[PluginMenuItem](../plugin_types/PluginMenuItem-class.md)]\>]] ]
:   Collects menu items from registered plugins.

[[collectRoutes](../plugin_registry/PluginRegistry/collectRoutes.md)][ [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[PluginRoute](../plugin_types/PluginRoute-class.md)]\>]] ]
:   Collects all routes from registered plugins.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[register](../plugin_registry/PluginRegistry/register.md)][([[[TalawaMobilePlugin](../plugin_types/TalawaMobilePlugin-class.md)] plugin]) → void ]
:   Registers a single plugin.

[[registerAll](../plugin_registry/PluginRegistry/registerAll.md)][([[[Iterable](https://api.flutter.dev/flutter/dart-core/Iterable-class.md)[\<[[TalawaMobilePlugin](../plugin_types/TalawaMobilePlugin-class.md)]\>]] plugins]) → void ]
:   Registers multiple plugins.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [registry](../plugin_registry/)
3.  PluginRegistry class

##### registry library









 talawa 1.0.0+1 
