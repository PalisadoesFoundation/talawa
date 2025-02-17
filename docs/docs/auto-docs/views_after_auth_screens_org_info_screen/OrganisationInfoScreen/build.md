::::::::: {#dartdoc-main-content .main-content above-sidebar="views_after_auth_screens_org_info_screen/OrganisationInfoScreen-class-sidebar.html" below-sidebar=""}
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

If a widget\'s
[build](../../views_after_auth_screens_org_info_screen/OrganisationInfoScreen/build.html)
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
  final double imageHeight = SizeConfig.screenHeight! * 0.38;
  final SelectOrganizationViewModel model = SelectOrganizationViewModel();
  final Map<String, OrgInfo> joinedOrgsMap = {};
  for (final org
      in userConfig.currentUser.joinedOrganizations ?? <OrgInfo>[]) {
    joinedOrgsMap[org.id!] = org;
  }

  return Scaffold(
    extendBodyBehindAppBar: true,
    floatingActionButton: !joinedOrgsMap.containsKey(orgInfo.id)
        ? FloatingActionButton.extended(
            onPressed: () {
              model.selectOrg(orgInfo);
            },
            label: Text(
              'Join',
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: SizeConfig.screenHeight! * 0.022,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 86, 194, 65),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )
        : FloatingActionButton.extended(
            onPressed: () {},
            label: Text(
              'Leave',
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: SizeConfig.screenHeight! * 0.022,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 208, 51, 51),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Stack(
                children: [
                  orgInfo.image != null
                      ? Image.network(
                          orgInfo.image!,
                          height: imageHeight,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                          child: Image.asset(
                            'assets/images/Organisation_Default_Image.jpeg',
                            height: imageHeight,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                  Container(
                    key: const Key('image_container'),
                    height: imageHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha((0.55 * 255).toInt()),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 45,
                left: 16,
                child: Row(
                  children: [
                    Text(
                      orgInfo.name ?? 'Organization Name',
                      style: const TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (orgInfo.address != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 8),
                        child: Center(
                          child: Text(
                            '${orgInfo.address?.city}, ${orgInfo.address?.countryCode}',
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 179, 168, 168),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Positioned(
                bottom: 24,
                left: 16,
                child: Text(
                  'Created by: ${orgInfo.creatorInfo?.firstName ?? 'User name'} ${orgInfo.creatorInfo?.lastName ?? ''}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Description',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    !orgInfo.userRegistrationRequired!
                        ? const Icon(
                            Icons.lock_open,
                            size: 18,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.lock,
                            size: 18,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    const SizedBox(width: 8),
                    !orgInfo.userRegistrationRequired!
                        ? Text(
                            "Public",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      const Color.fromARGB(255, 98, 98, 98),
                                ),
                          )
                        : Text(
                            "Private",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color: const Color.fromARGB(
                                    255,
                                    103,
                                    103,
                                    103,
                                  ),
                                ),
                          ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 16,
              right: 20,
              bottom: 10,
            ),
            child: Text(
              orgInfo.description ?? 'No description provided.',
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          _buildSectionTitle(
            context,
            'Admins',
            orgInfo.admins,
            () => _showAllMembersBottomSheet(
              context,
              orgInfo.admins!,
              'Admins',
            ),
            2,
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSurface,
            thickness: 1,
            endIndent: 16,
            indent: 16,
          ),
          _buildUserList(context, orgInfo.admins, 2),
          _buildSectionTitle(
            context,
            'Members',
            orgInfo.members,
            () => _showAllMembersBottomSheet(
              context,
              orgInfo.members!,
              'Members',
            ),
            4,
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSurface,
            thickness: 1,
            endIndent: 16,
            indent: 16,
          ),
          _buildUserList(context, orgInfo.members, 4),
        ],
      ),
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
2.  [org_info_screen](../../views_after_auth_screens_org_info_screen/)
3.  [OrganisationInfoScreen](../../views_after_auth_screens_org_info_screen/OrganisationInfoScreen-class.html)
4.  build method

##### OrganisationInfoScreen class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
