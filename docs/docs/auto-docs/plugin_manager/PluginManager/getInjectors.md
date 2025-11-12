



menu

1.  [talawa](../../index.md)
2.  [plugin/manager.dart](../../plugin_manager/)
3.  [PluginManager](../../plugin_manager/PluginManager-class.md)
4.  getInjectors method


getInjectors


 dark_mode   light_mode 




<div>

# getInjectors method

</div>


[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[PluginInjectorExtension](../../plugin_types/PluginInjectorExtension-class.md)]\>]]
getInjectors(

1.  [[[InjectorType](../../plugin_types/InjectorType.md)]
    type]

)



Gets injectors for a specific type.

**params**:

-   `type`: Injector location/type

**returns**:

-   `List<PluginInjectorExtension>`: Ordered injectors



## Implementation

``` language-dart
List<PluginInjectorExtension> getInjectors(InjectorType type) =>
    registry.collectInjectors(type);
```







1.  [talawa](../../index.md)
2.  [manager](../../plugin_manager/)
3.  [PluginManager](../../plugin_manager/PluginManager-class.md)
4.  getInjectors method

##### PluginManager class









 talawa 1.0.0+1 
