



menu

1.  [talawa](../index.md)
2.  [plugin/manager.dart](../plugin_manager/)
3.  PluginManager class


PluginManager


 dark_mode   light_mode 




<div>

# PluginManager class

</div>


A thin manager that wires the registry with bundled plugins.



## Constructors

[[PluginManager](../plugin_manager/PluginManager/PluginManager.md)][([[[PluginRegistry](../plugin_registry/PluginRegistry-class.md)] registry])]
:   Creates a new plugin manager.



## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[isInitialized](../plugin_manager/PluginManager/isInitialized.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether the manager is initialized.
    ::: features
    no setter
    :::

[[registry](../plugin_manager/PluginManager/registry.md)] [→ [PluginRegistry](../plugin_registry/PluginRegistry-class.md)]
:   Underlying registry instance.
    ::: features
    final
    :::

[[routes](../plugin_manager/PluginManager/routes.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[PluginRoute](../plugin_types/PluginRoute-class.md)]\>]]
:   Routes contributed by active plugins.
    ::: features
    no setter
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[getInjectors](../plugin_manager/PluginManager/getInjectors.md)][([[[InjectorType](../plugin_types/InjectorType.md)] type]) [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[PluginInjectorExtension](../plugin_types/PluginInjectorExtension-class.md)]\>]] ]
:   Gets injectors for a specific type.

[[getMenuItems](../plugin_manager/PluginManager/getMenuItems.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[PluginMenuItem](../plugin_types/PluginMenuItem-class.md)]\>]] ]
:   Menu items contributed by active plugins.

[[initialize](../plugin_manager/PluginManager/initialize.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[TalawaMobilePlugin](../plugin_types/TalawaMobilePlugin-class.md)]\>]] available, ) → void ]
:   Initializes from pre-bundled available plugins.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[reset](../plugin_manager/PluginManager/reset.md) [→ void ]
:   Resets the manager for testing or re-initialization.

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



## Static Properties

[[instance](../plugin_manager/PluginManager/instance.md)] [→ [PluginManager](../plugin_manager/PluginManager-class.md)]
:   Global singleton instance for app-wide plugin access.
    ::: features
    final
    :::







1.  [talawa](../index.md)
2.  [manager](../plugin_manager/)
3.  PluginManager class

##### manager library









 talawa 1.0.0+1 
