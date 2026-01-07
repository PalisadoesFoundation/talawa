# Overview for `RootRestorationScope`

## Description

Inserts a child bucket of [RestorationManager.rootBucket] into the widget
 tree and makes it available to descendants via [RestorationScope.of].

 This widget is usually used near the root of the widget tree to enable the
 state restoration functionality for the application. For all other use
 cases, consider using a regular [RestorationScope] instead.

 The root restoration bucket can only be retrieved asynchronously from the
 [RestorationManager]. To ensure that the provided [child] has its
 restoration data available the first time it builds, the
 [RootRestorationScope] will build an empty [Container] instead of the actual
 [child] until the root bucket is available. To hide the empty container from
 the eyes of users, the [RootRestorationScope] also delays rendering the
 first frame while the container is shown. On platforms that show a splash
 screen on app launch the splash screen is kept up (hiding the empty
 container) until the bucket is available and the [child] is ready to be
 build.

 The exact behavior of this widget depends on its ancestors: When the
 [RootRestorationScope] does not find an ancestor restoration bucket via
 [RestorationScope.of] it will claim a child bucket from the root restoration
 bucket ([RestorationManager.rootBucket]) using the provided [restorationId]
 and inserts that bucket into the widget tree where descendants may access it
 via [RestorationScope.of]. If the [RootRestorationScope] finds a non-null
 ancestor restoration bucket via [RestorationScope.of] it will behave like a
 regular [RestorationScope] instead: It will claim a child bucket from that
 ancestor and insert that child into the widget tree.

 Unlike the [RestorationScope] widget, the [RootRestorationScope] will
 guarantee that descendants have a bucket available for storing restoration
 data as long as [restorationId] is not null and [RestorationManager] is
 able to provide a root bucket. In other words, it will force-enable
 state restoration for the subtree if [restorationId] is not null.

 If [restorationId] is null, no bucket is made available to descendants,
 which effectively turns off state restoration for this subtree.

 See also:

  * [RestorationScope], which inserts a bucket obtained from a surrounding
    restoration scope into the widget tree and makes it accessible
    for descendants via [RestorationScope.of].
  * [UnmanagedRestorationScope], which inserts a provided [RestorationBucket]
    into the widget tree and makes it accessible for descendants via
    [RestorationScope.of].
  * [RestorationMixin], which may be used in [State] objects to manage the
    restoration data of a [StatefulWidget] instead of manually interacting
    with [RestorationScope]s and [RestorationBucket]s.
  * [RestorationManager], which describes the basic concepts of state
    restoration in Flutter.

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 

- **restorationId**: `String?`
  The restoration ID used to identify the child bucket that this widget
 will insert into the tree.

 If this is null, no bucket is made available to descendants and state
 restoration for the subtree is essentially turned off.

## Constructors

### Unnamed Constructor
Creates a [RootRestorationScope].

 Providing null as the [restorationId] turns off state restoration for
 the [child] and its descendants.

