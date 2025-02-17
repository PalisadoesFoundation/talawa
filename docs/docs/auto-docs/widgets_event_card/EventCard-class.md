
<div>

# EventCard class

</div>


This class returns the EventCard widget.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [DiagnosticableTree](https://api.flutter.dev/flutter/foundation/DiagnosticableTree-class.html)
    -   [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
    -   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
    -   EventCard

Available extensions

:   -   [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions.html)



## Constructors

[[EventCard](../widgets_event_card/EventCard/EventCard.md)][({[[[Key](https://api.flutter.dev/flutter/foundation/Key-class.md)?] key, ][required [[Event](../models_events_event_model/Event-class.md)] event, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] eventTitleHighlightedText, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] eventTitleNormalText, ][required [[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] isSearchItem]})]

:   ::: 
    const
    :::



## Properties

[[event](../widgets_event_card/EventCard/event.md)] [→ [Event](../models_events_event_model/Event-class.md)]
:   instance of an event.
    ::: features
    final
    :::

[[eventTitleHighlightedText](../widgets_event_card/EventCard/eventTitleHighlightedText.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   Highlighted text of the event.
    ::: features
    final
    :::

[[eventTitleNormalText](../widgets_event_card/EventCard/eventTitleNormalText.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   Eventtile normal text.
    ::: features
    final
    :::

[[hashCode](https://api.flutter.dev/flutter/widgets/Widget/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[isSearchItem](../widgets_event_card/EventCard/isSearchItem.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   This flag indicates that if this event is searchable.
    ::: features
    final
    :::

[[key](https://api.flutter.dev/flutter/widgets/Widget/key.html)] [→ [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?]
:   Controls how one widget replaces another widget in the tree.
    ::: features
    finalinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions/animate.html)][({[[[Key](https://api.flutter.dev/flutter/foundation/Key-class.md)?] key, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Effect](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Effect-class.html)]\>]?] effects, ][[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?] onInit, ][[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?] onPlay, ][[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?] onComplete, ][[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?] autoPlay, ][[[Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html)?] delay, ][[[AnimationController](https://api.flutter.dev/flutter/animation/AnimationController-class.html)?] controller, ][[[Adapter](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Adapter-class.html)?] adapter, ][[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)?] target, ][[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)?] value]}) [→ [Animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Animate-class.html)] ]

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

[[build](../widgets_event_card/EventCard/build.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)] ]
:   Describes the part of the user interface represented by this widget.
    ::: features
    override
    :::

[[createElement](https://api.flutter.dev/flutter/widgets/StatelessWidget/createElement.html)][() [→ [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)] ]
:   Creates a
    [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)
    to manage this widget\'s location in the tree.
    ::: features
    inherited
    :::

[[debugDescribeChildren](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/debugDescribeChildren.html)][() [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)]\>]] ]
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

[[toDiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toDiagnosticsNode.html)][({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)?] name, ][[[DiagnosticsTreeStyle](https://api.flutter.dev/flutter/foundation/DiagnosticsTreeStyle.html)?] style]}) [→ [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)] ]
:   Returns a debug representation of the object that is used by
    debugging tools and by
    [DiagnosticsNode.toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticsNode/toStringDeep.html).
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/foundation/Diagnosticable/toString.html)][({[[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.md)] minLevel = DiagnosticLevel.info]}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringDeep.html)][({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] prefixLineOne = \'\', ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] prefixOtherLines, ][[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html)] minLevel = DiagnosticLevel.debug, ][[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)] wrapWidth = 65]}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Returns a string representation of this node and its descendants.
    ::: features
    inherited
    :::

[[toStringShallow](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringShallow.html)][({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] joiner = \', \', ][[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html)] minLevel = DiagnosticLevel.debug]}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Returns a one-line detailed description of the object.
    ::: features
    inherited
    :::

[[toStringShort](https://api.flutter.dev/flutter/widgets/Widget/toStringShort.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
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
2.  [event_card](../widgets_event_card/)
3.  EventCard class

##### event_card library







