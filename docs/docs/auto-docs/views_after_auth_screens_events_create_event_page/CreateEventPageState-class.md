:::::::::: {#dartdoc-main-content .main-content above-sidebar="views_after_auth_screens_events_create_event_page/views_after_auth_screens_events_create_event_page-library-sidebar.html" below-sidebar="views_after_auth_screens_events_create_event_page/CreateEventPageState-class-sidebar.html"}
<div>

# [CreateEventPageState]{.kind-class} class

</div>

::: {.section .desc .markdown}
\_CreateEventPageState returns a widget for a Page to Creatxe the Event
in the Organization.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[CreateEventPage](../views_after_auth_screens_events_create_event_page/CreateEventPage-class.html)]{.type-parameter}\>]{.signature}
    -   CreateEventPageState
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[CreateEventPageState](../views_after_auth_screens_events_create_event_page/CreateEventPageState/CreateEventPageState.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[context](https://api.flutter.dev/flutter/widgets/State/context.html)]{.name} [→ [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.signature}
:   The location in the tree where this widget builds.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[mounted](https://api.flutter.dev/flutter/widgets/State/mounted.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Whether this
    [State](https://api.flutter.dev/flutter/widgets/State-class.html)
    object is currently in a tree.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[selectedVenue](../views_after_auth_screens_events_create_event_page/CreateEventPageState/selectedVenue.html)]{.name} [↔ [Venue](../models_events_event_venue/Venue-class.html)?]{.signature}
:   venue selected by the user.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[widget](https://api.flutter.dev/flutter/widgets/State/widget.html)]{.name} [→ [CreateEventPage](../views_after_auth_screens_events_create_event_page/CreateEventPage-class.html)]{.signature}
:   The current configuration.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[activate](https://api.flutter.dev/flutter/widgets/State/activate.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Called when this object is reinserted into the tree after having
    been removed via
    [deactivate](https://api.flutter.dev/flutter/widgets/State/deactivate.html).
    ::: features
    [inherited]{.feature}
    :::

[[build](../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#build-param-context .parameter}) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype .parameter} ]{.signature}
:   Describes the part of the user interface represented by this widget.
    ::: features
    [override]{.feature}
    :::

[[dateUpdater1](../views_after_auth_screens_events_create_event_page/CreateEventPageState/dateUpdater1.html)]{.name}[([[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation} [date]{.parameter-name}, ]{#dateUpdater1-param-date .parameter}[[[CreateEventViewModel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)]{.type-annotation} [model]{.parameter-name}]{#dateUpdater1-param-model .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Handles the selection and deselection of categories.

[[dateUpdater2](../views_after_auth_screens_events_create_event_page/CreateEventPageState/dateUpdater2.html)]{.name}[([[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation} [date]{.parameter-name}, ]{#dateUpdater2-param-date .parameter}[[[CreateEventViewModel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)]{.type-annotation} [model]{.parameter-name}]{#dateUpdater2-param-model .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Handles the selection and deselection of categories.

[[deactivate](https://api.flutter.dev/flutter/widgets/State/deactivate.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Called when this object is removed from the tree.
    ::: features
    [inherited]{.feature}
    :::

[[debugFillProperties](https://api.flutter.dev/flutter/widgets/State/debugFillProperties.html)]{.name}[([[[DiagnosticPropertiesBuilder](https://api.flutter.dev/flutter/foundation/DiagnosticPropertiesBuilder-class.html)]{.type-annotation} [properties]{.parameter-name}]{#debugFillProperties-param-properties .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Add additional properties associated with the node.
    ::: features
    [inherited]{.feature}
    :::

[[didChangeDependencies](https://api.flutter.dev/flutter/widgets/State/didChangeDependencies.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Called when a dependency of this
    [State](https://api.flutter.dev/flutter/widgets/State-class.html)
    object changes.
    ::: features
    [inherited]{.feature}
    :::

[[didUpdateWidget](https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html)]{.name}[([covariant [[CreateEventPage](../views_after_auth_screens_events_create_event_page/CreateEventPage-class.html)]{.type-annotation} [oldWidget]{.parameter-name}]{#didUpdateWidget-param-oldWidget .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Called whenever the widget configuration changes.
    ::: features
    [inherited]{.feature}
    :::

[[dispose](https://api.flutter.dev/flutter/widgets/State/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Called when this object is removed from the tree permanently.
    ::: features
    [inherited]{.feature}
    :::

[[initState](https://api.flutter.dev/flutter/widgets/State/initState.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Called when this object is inserted into the tree.
    ::: features
    [inherited]{.feature}
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[reassemble](https://api.flutter.dev/flutter/widgets/State/reassemble.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Called whenever the application is reassembled during debugging, for
    example during hot reload.
    ::: features
    [inherited]{.feature}
    :::

[[setState](https://api.flutter.dev/flutter/widgets/State/setState.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [fn]{.parameter-name}]{#setState-param-fn .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Notify the framework that the internal state of this object has
    changed.
    ::: features
    [inherited]{.feature}
    :::

[[timeUpdater1](../views_after_auth_screens_events_create_event_page/CreateEventPageState/timeUpdater1.html)]{.name}[([[[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]{.type-annotation} [time]{.parameter-name}, ]{#timeUpdater1-param-time .parameter}[[[CreateEventViewModel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)]{.type-annotation} [model]{.parameter-name}]{#timeUpdater1-param-model .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Handles the selection and deselection of categories.

[[timeUpdater2](../views_after_auth_screens_events_create_event_page/CreateEventPageState/timeUpdater2.html)]{.name}[([[[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]{.type-annotation} [time]{.parameter-name}, ]{#timeUpdater2-param-time .parameter}[[[CreateEventViewModel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)]{.type-annotation} [model]{.parameter-name}]{#timeUpdater2-param-model .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Handles the selection and deselection of categories.

[[toDiagnosticsNode](https://api.flutter.dev/flutter/foundation/Diagnosticable/toDiagnosticsNode.html)]{.name}[({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [name]{.parameter-name}, ]{#toDiagnosticsNode-param-name .parameter}[[[DiagnosticsTreeStyle](https://api.flutter.dev/flutter/foundation/DiagnosticsTreeStyle.html)?]{.type-annotation} [style]{.parameter-name}]{#toDiagnosticsNode-param-style .parameter}}) [→ [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)]{.returntype .parameter} ]{.signature}
:   Returns a debug representation of the object that is used by
    debugging tools and by
    [DiagnosticsNode.toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticsNode/toStringDeep.html).
    ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/foundation/Diagnosticable/toString.html)]{.name}[({[[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html)]{.type-annotation} [minLevel]{.parameter-name} = [DiagnosticLevel.info]{.default-value}]{#toString-param-minLevel .parameter}}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[toStringShort](https://api.flutter.dev/flutter/foundation/Diagnosticable/toStringShort.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A brief description of this object, usually just the
    [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
    and the
    [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html).
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [create_event_page](../views_after_auth_screens_events_create_event_page/)
3.  CreateEventPageState class

##### create_event_page library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
