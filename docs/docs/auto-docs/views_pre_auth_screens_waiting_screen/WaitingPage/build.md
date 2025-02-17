::::::::: {#dartdoc-main-content .main-content above-sidebar="views_pre_auth_screens_waiting_screen/WaitingPage-class-sidebar.html" below-sidebar=""}
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
[build](../../views_pre_auth_screens_waiting_screen/WaitingPage/build.html)
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
  return BaseView<WaitingViewModel>(
    onModelReady: (model) => model.initialise(context),
    builder: (context, model, child) {
      return Scaffold(
        key: const Key('WaitingPageScaffold'),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SignupProgressIndicator(
                key: const Key('Waiting'),
                currentPageIndex: 2,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                  SizeConfig.screenWidth! * 0.06,
                  SizeConfig.screenHeight! * 0.01,
                  SizeConfig.screenWidth! * 0.06,
                  SizeConfig.screenHeight! * 0.01,
                ),
                width: SizeConfig.screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Greeting text
                    CustomRichText(
                      key: const Key('WaitingPageText'),
                      words: model.greeting,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.03,
                    ),
                    Text(
                      AppLocalizations.of(context)!
                          .strictTranslate('Request Sent to'),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              //Information of the organization to which the request is sent.
              Expanded(
                child: ListView.builder(
                  key: const Key('PendingRequestList'),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: model.pendingRequestOrg.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomListTile(
                      key: const Key('WaitingJoin'),
                      index: index,
                      type: TileType.org,
                      orgInfo: model.pendingRequestOrg[index],
                      onTapOrgInfo: (item) {},
                    );
                  },
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.0215,
              ),
              //Join organization button
              RaisedRoundedButton(
                key: const Key('JoinOrg'),
                buttonLabel: AppLocalizations.of(context)!
                    .strictTranslate('Join Organisation'),
                onTap: model.joinOrg,
                showArrow: true,
                textColor: Theme.of(context).colorScheme.secondaryContainer,
                backgroundColor: Theme.of(context)
                    .inputDecorationTheme
                    .focusedBorder!
                    .borderSide
                    .color,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.0215,
              ),
              //Logout button
              RaisedRoundedButton(
                key: const Key('Logout'),
                buttonLabel:
                    AppLocalizations.of(context)!.strictTranslate('Log out'),
                onTap: model.logout,
                textColor: Theme.of(context)
                    .inputDecorationTheme
                    .focusedBorder!
                    .borderSide
                    .color,
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.0215,
              ),
            ],
          ),
        ),
      );
    },
  );
}
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [waiting_screen](../../views_pre_auth_screens_waiting_screen/)
3.  [WaitingPage](../../views_pre_auth_screens_waiting_screen/WaitingPage-class.html)
4.  build method

##### WaitingPage class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
