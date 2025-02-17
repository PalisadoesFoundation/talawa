
<div>

# build method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
build(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]
    context]

)


override




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

If a widget\'s
[build](../../widgets_custom_list_tile/CustomListTile/build.html) method
is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
instead.

See also:

-   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html),
    which contains the discussion on performance considerations.



## Implementation

``` language-dart
@override
Widget build(BuildContext context) {
  ? onTap;

  switch (type) {
    case TileType.org:
      onTap = () => onTapOrgInfo!(orgInfo!);
      break;
    case TileType.user:
      onTap = onTapUserInfo;
      break;
    case TileType.attendee:
      onTap = onTapAttendeeInfo;
      break;
    default:
      onTap = onTapOption;
      break;
  }

  return InkWell(
    // checking whether the tapped tile is of user or org.
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha((0.5 * 255).),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        height: 70,
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: type == TileType.org
                    ? RichText(
                        key: const Key('OrgNamewithOrgAddress'),
                        text: TextSpan(
                          text: orgInfo!.name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: 19,
                                color: Colors.black,
                              ),
                          children: <TextSpan>[
                            if (orgInfo!.address != null) ...[
                              const TextSpan(text: ' '),
                              TextSpan(
                                text:
                                    '(${orgInfo!.address!.city}, ${orgInfo!.address!.countryCode})',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 14,
                                      color: const Color.fromARGB(
                                        255,
                                        112,
                                        112,
                                        112,
                                      ),
                                    ),
                              ),
                            ],
                          ],
                        ),
                      )
                    : Text(
                        type == TileType.user
                            ? '${userInfo!.firstName!} ${userInfo!.lastName!}'
                            : type == TileType.attendee
                                ? '${attendeeInfo!.firstName!} ${attendeeInfo!.lastName!}'
                                : option!.title,
                        style:
                            type == TileType.user || type == TileType.attendee
                                ? Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 18,
                                      color: Colors.black,
                                    )
                                : option!.trailingIconButton == null
                                    ? Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 18,
                                          color: Colors.black,
                                        )
                                    : Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                      ),
              ),
            ),
            Expanded(
              flex: 1,
              child: type != TileType.user && type != TileType.attendee
                  ? type == TileType.org
                      ? Icon(
                          !orgInfo!.userRegistrationRequired!
                              ? Icons.lock_open
                              : Icons.lock,
                          color: !orgInfo!.userRegistrationRequired!
                              ? const Color(0xFF34AD64)
                              : const Color(0xffFABC57),
                        )
                      : option!.trailingIconButton ?? const 
                  : const ,
            ),
          ],
        ),
      ),
    ),
  );
}
```







1.  [talawa](../../index.html)
2.  [custom_list_tile](../../widgets_custom_list_tile/)
3.  [CustomListTile](../../widgets_custom_list_tile/CustomListTile-class.html)
4.  build method

##### CustomListTile class







