::::::::: {#dartdoc-main-content .main-content above-sidebar="widgets_venue_card/VenueCard-class-sidebar.html" below-sidebar=""}
<div>

# [build]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[build]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#build-param-context .parameter}

)

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
Describes the part of the user interface represented by this widget.

The framework calls this method when this widget is inserted into the
tree in a given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
and when the dependencies of this widget change (e.g., an
[InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)
referenced by this widget changes). This method can potentially be
called in every frame and should not have any side effects beyond
building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether
the widget returned by this method can update the root of the existing
subtree, as determined by calling
[Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of
widgets that are configured with information from this widget\'s
constructor and from the given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html).

The given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
contains information about the location in the tree at which this widget
is being built. For example, the context provides the set of inherited
widgets for this location in the tree. A given widget might be built
with multiple different
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.

The implementation of this method must only depend on:

-   the fields of the widget, which themselves must not change over
    time, and
-   any ambient state obtained from the `context` using
    [BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html).

If a widget\'s [build](../../widgets_venue_card/VenueCard/build.html)
method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
instead.

See also:

-   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html),
    which contains the discussion on performance considerations.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
Widget build(BuildContext context) {
  final orgURI = GraphqlConfig.orgURI!.replaceFirst('/graphql', '');
  final imageURl =
      venue.imageUrl!.replaceAll('http://localhost:4000', orgURI);

  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Stack(
      children: [
        Card(
          surfaceTintColor: Theme.of(context).colorScheme.secondaryContainer,
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          elevation: 3,
          color: isSelected
              ? Colors.blue.withAlpha((0.3 * 255).toInt())
              : Theme.of(context).primaryColor,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 2.5,
                child: Container(
                  key: const Key('image_container'),
                  height: SizeConfig.screenHeight! * 0.11,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withAlpha((0.3 * 255).toInt()),
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topCenter,
                      image: venue.imageUrl!.isNotEmpty
                          ? NetworkImage(imageURl)
                          : const AssetImage('assets/images/defaultImg.png')
                              as ImageProvider,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.48,
                          child: Text(
                            venue.name!,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        const Icon(
                          Icons.people,
                          size: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Capacity: ${venue.capacity}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.006,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.description,
                          size: 12,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.015,
                        ),
                        Expanded(
                          child: Text(
                            venue.description!,
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (isSelected)
          const Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
          ),
      ],
    ),
  );
}
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [venue_card](../../widgets_venue_card/)
3.  [VenueCard](../../widgets_venue_card/VenueCard-class.html)
4.  build method

##### VenueCard class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
