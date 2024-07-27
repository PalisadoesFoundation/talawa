


# build method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) build
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)

_<span class="feature">override</span>_



<p>Describes the part of the user interface represented by this widget.</p>
<p>The framework calls this method when this widget is inserted into the tree
in a given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a> and when the dependencies of this widget change
(e.g., an <a href="https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html">InheritedWidget</a> referenced by this widget changes). This
method can potentially be called in every frame and should not have any side
effects beyond building a widget.</p>
<p>The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether the
widget returned by this method can update the root of the existing
subtree, as determined by calling <a href="https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html">Widget.canUpdate</a>.</p>
<p>Typically implementations return a newly created constellation of widgets
that are configured with information from this widget's constructor and
from the given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a>.</p>
<p>The given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a> contains information about the location in the
tree at which this widget is being built. For example, the context
provides the set of inherited widgets for this location in the tree. A
given widget might be built with multiple different <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a>
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.</p>
<p>The implementation of this method must only depend on:</p>
<ul>
<li>the fields of the widget, which themselves must not change over time,
and</li>
<li>any ambient state obtained from the <code>context</code> using
<a href="https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html">BuildContext.dependOnInheritedWidgetOfExactType</a>.</li>
</ul>
<p>If a widget's <a href="../../views_pre_auth_screens_waiting_to_join_private_org/WaitingPage/build.md">build</a> method is to depend on anything else, use a
<a href="https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html">StatefulWidget</a> instead.</p>
<p>See also:</p>
<ul>
<li><a href="https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html">StatelessWidget</a>, which contains the discussion on performance considerations.</li>
</ul>



## Implementation

```dart
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







