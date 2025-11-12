



menu

1.  [talawa](../../index.md)
2.  [plugin/manager.dart](../../plugin_manager/)
3.  [PluginManager](../../plugin_manager/PluginManager-class.md)
4.  getMenuItems method


getMenuItems


 dark_mode   light_mode 




<div>

# getMenuItems method

</div>


[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[PluginMenuItem](../../plugin_types/PluginMenuItem-class.md)]\>]]
getMenuItems(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)]
    context]

)



Menu items contributed by active plugins.

**params**:

-   `context`: Build context

**returns**:

-   `List<PluginMenuItem>`: Menu items from plugins



## Implementation

``` language-dart
List<PluginMenuItem> getMenuItems(BuildContext context) =>
    registry.collectMenuItems(context);
```







1.  [talawa](../../index.md)
2.  [manager](../../plugin_manager/)
3.  [PluginManager](../../plugin_manager/PluginManager-class.md)
4.  getMenuItems method

##### PluginManager class









 talawa 1.0.0+1 
