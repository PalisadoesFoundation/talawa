
<div>

# TalawaPluginProvider class

</div>


TalwaPluginProvider provides ability to implement features as plugins.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [DiagnosticableTree](https://api.flutter.dev/flutter/foundation/DiagnosticableTree-class.html)
    -   [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
    -   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
    -   TalawaPluginProvider

Available extensions

:   -   [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions.html)



## Constructors

[[TalawaPluginProvider](../plugins_talawa_plugin_provider/TalawaPluginProvider/TalawaPluginProvider.md)][]

:   ::: 
    const
    :::



## Properties

[[child](../plugins_talawa_plugin_provider/TalawaPluginProvider/child.md)] [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)?]
:   child contains the widget for the plugin UI.
    ::: features
    final
    :::

[[hashCode](https://api.flutter.dev/flutter/widgets/Widget/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[key](https://api.flutter.dev/flutter/widgets/Widget/key.html)] [→ [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?]
:   Controls how one widget replaces another widget in the tree.
    ::: features
    finalinherited
    :::

[[pluginName](../plugins_talawa_plugin_provider/TalawaPluginProvider/pluginName.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   name of plugin preferred with underscores(\_) instead of spaces.
    ::: features
    final
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[visible](../plugins_talawa_plugin_provider/TalawaPluginProvider/visible.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   visible is the property that decides visibility of the UI.
    ::: features
    final
    :::



## Methods

[[animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions/animate.html)][ [→ [Animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Animate-class.html)] ]

:   Available on
    [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html),
    provided by the
    [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions.html)
    extension

    Wraps the target
    [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
    in an
    [Animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Animate-class.html)
    instance, and returns the instance for chaining calls. Ex.
    `myWidget.` is equivalent to `Animate(child: myWidget)`.

[[build](../plugins_talawa_plugin_provider/TalawaPluginProvider/build.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)] ]
:   Describes the part of the user interface represented by this widget.
    ::: features
    override
    :::

[[checkFromPluginList](../plugins_talawa_plugin_provider/TalawaPluginProvider/checkFromPluginList.md)][ [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   This function checks if the plugin is insatlled and therefore
    determine visibility of the plugin.

[[createElement](https://api.flutter.dev/flutter/widgets/StatelessWidget/createElement.html)][ [→ [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)] ]
:   Creates a
    [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)
    to manage this widget\'s location in the tree.
    ::: features
    inherited
    :::

[[debugDescribeChildren](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/debugDescribeChildren.html)][ [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)]\>]] ]
:   Returns a list of
    [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)
    objects describing this node\'s children.
    ::: features
    inherited
    :::

[[debugFillProperties](https://api.flutter.dev/flutter/widgets/Widget/debugFillProperties.html)][([[[DiagnosticPropertiesBuilder](https://api.flutter.dev/flutter/foundation/DiagnosticPropertiesBuilder-class.md)] properties]) → void ]
:   Add additional properties associated with the node.
    ::: features
    inherited
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[toDiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toDiagnosticsNode.html)][ [→ [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)] ]
:   Returns a debug representation of the object that is used by
    debugging tools and by
    [DiagnosticsNode.toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticsNode/toStringDeep.html).
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/foundation/Diagnosticable/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringDeep.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Returns a string representation of this node and its descendants.
    ::: features
    inherited
    :::

[[toStringShallow](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringShallow.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Returns a one-line detailed description of the object.
    ::: features
    inherited
    :::

[[toStringShort](https://api.flutter.dev/flutter/widgets/Widget/toStringShort.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A short, textual description of this widget.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/widgets/Widget/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [talawa_plugin_provider](../plugins_talawa_plugin_provider/)
3.  TalawaPluginProvider class

##### talawa_plugin_provider library







