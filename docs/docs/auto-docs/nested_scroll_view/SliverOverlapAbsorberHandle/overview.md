# Overview for `SliverOverlapAbsorberHandle`

## Description

Handle to provide to a [SliverOverlapAbsorber], a [SliverOverlapInjector],
 and an [NestedScrollViewViewport], to shift overlap in a [NestedScrollView].

 A particular [SliverOverlapAbsorberHandle] can only be assigned to a single
 [SliverOverlapAbsorber] at a time. It can also be (and normally is) assigned
 to one or more [SliverOverlapInjector]s, which must be later descendants of
 the same [NestedScrollViewViewport] as the [SliverOverlapAbsorber]. The
 [SliverOverlapAbsorber] must be a direct descendant of the
 [NestedScrollViewViewport], taking part in the same sliver layout. (The
 [SliverOverlapInjector] can be a descendant that takes part in a nested
 scroll view's sliver layout.)

 Whenever the [NestedScrollViewViewport] is marked dirty for layout, it will
 cause its assigned [SliverOverlapAbsorberHandle] to fire notifications. It
 is the responsibility of the [SliverOverlapInjector]s (and any other
 clients) to mark themselves dirty when this happens, in case the geometry
 subsequently changes during layout.

 See also:

  * [NestedScrollView], which uses a [NestedScrollViewViewport] and a
    [SliverOverlapAbsorber] to align its children, and which shows sample
    usage for this class.

## Dependencies

- ChangeNotifier

## Members

- **_writers**: `int`
- **_layoutExtent**: `double?`
- **_scrollExtent**: `double?`
## Constructors

### Unnamed Constructor
Creates a [SliverOverlapAbsorberHandle].

