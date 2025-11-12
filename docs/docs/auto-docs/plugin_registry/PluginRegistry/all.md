



menu

1.  [talawa](../../index.md)
2.  [plugin/registry.dart](../../plugin_registry/)
3.  [PluginRegistry](../../plugin_registry/PluginRegistry-class.md)
4.  all property


all


 dark_mode   light_mode 




<div>

# all property

</div>



[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[TalawaMobilePlugin](../../plugin_types/TalawaMobilePlugin-class.md)]\>]]
get all



All registered plugins.

**params**: None

**returns**:

-   `List<TalawaMobilePlugin>`: Unordered list.



## Implementation

``` language-dart
List<TalawaMobilePlugin> get all => _plugins.values.toList(growable: false);
```








1.  [talawa](../../index.md)
2.  [registry](../../plugin_registry/)
3.  [PluginRegistry](../../plugin_registry/PluginRegistry-class.md)
4.  all property

##### PluginRegistry class









 talawa 1.0.0+1 
