::::::::: {#dartdoc-main-content .main-content above-sidebar="widgets_event_card/EventCard-class-sidebar.html" below-sidebar=""}
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

If a widget\'s [build](../../widgets_event_card/EventCard/build.html)
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
  final bool isRegistered = event.isRegistered ?? false;
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Stack(
      children: [
        Card(
          surfaceTintColor: Theme.of(context).colorScheme.secondaryContainer,
          shape: RoundedRectangleBorder(
            side:
                isRegistered && userConfig.currentUser.id != event.creator!.id
                    ? BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: SizeConfig.screenWidth! * 0.008,
                      )
                    : BorderSide.none,
          ),
          elevation: 3,
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 2.5,
                child: Container(
                  height: SizeConfig.screenHeight! * 0.11,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withAlpha((0.3 * 255).toInt()),
                    image: const DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topCenter,
                      image: AssetImage('assets/images/pfp2.png'),
                    ),
                  ),
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha((0.0 * 255).toInt()),
                        ),
                      ),
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
                          child: isSearchItem
                              ? RichText(
                                  text: TextSpan(
                                    text: eventTitleHighlightedText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                    children: [
                                      TextSpan(
                                        text: eventTitleNormalText,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              color: Colors.grey,
                                            ),
                                      ),
                                    ],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                )
                              : Text(
                                  event.title!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall,
                                ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.calendar_today,
                          size: 13,
                        ),
                        const Spacer(),
                        Expanded(
                          child: Text(
                            "${event.startDate} - ${event.endDate}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.006,
                    ),
                    if (event.startTime != null && event.endTime != null)
                      Row(
                        children: [
                          const Icon(
                            Icons.schedule,
                            size: 12,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.015,
                          ),
                          Text(
                            "${event.startTime} - ${event.endTime!}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.place,
                            size: 12,
                          ),
                          SizedBox(
                            child: Text(
                              event.location!.substring(
                                0,
                                min(event.location!.length, 20),
                              ),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.013,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.55,
                          child: Text(
                            event.description!,
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 3,
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.007,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        userConfig.currentUser.id == event.creator!.id
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.verified,
                                    size: 13,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary,
                                  ),
                                  SizedBox(
                                    width: SizeConfig.screenWidth! * 0.013,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .strictTranslate('Created'),
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              )
                            : const SizedBox(),
                        const Spacer(),
                        event.isPublic!
                            ? Icon(
                                Icons.lock_open,
                                size: 13,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            : Icon(
                                Icons.lock,
                                size: 13,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.013,
                        ),
                        event.isPublic!
                            ? Text(
                                AppLocalizations.of(context)!
                                    .strictTranslate('public'),
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            : Text(
                                AppLocalizations.of(context)!
                                    .strictTranslate('private'),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.027,
                        ),
                        const Icon(
                          Icons.people_outline,
                          size: 13,
                          color: Color(0xff4285F4),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.013,
                        ),
                        Text(
                          (event.attendees?.length ?? 0).toString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: SizeConfig.screenHeight! * 0.007,
          right: SizeConfig.screenWidth! * 0.013,
          child: isRegistered &&
                  userConfig.currentUser.id != event.creator!.id
              ? DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!
                            .strictTranslate("Registered"),
                        style:
                            Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
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
2.  [event_card](../../widgets_event_card/)
3.  [EventCard](../../widgets_event_card/EventCard-class.html)
4.  build method

##### EventCard class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
