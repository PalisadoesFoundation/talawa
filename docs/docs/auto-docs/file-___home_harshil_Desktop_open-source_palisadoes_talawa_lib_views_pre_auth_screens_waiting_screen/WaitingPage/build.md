




build method - WaitingPage class - waiting\_screen library - Dart API







menu

1. [talawa](../../index.html)
2. [views/pre\_auth\_screens/waiting\_screen.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_pre_auth_screens_waiting_screen/)
3. [WaitingPage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_pre_auth_screens_waiting_screen/WaitingPage-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [waiting\_screen](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_pre_auth_screens_waiting_screen/)
3. [WaitingPage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_pre_auth_screens_waiting_screen/WaitingPage-class.html)
4. build method

##### WaitingPage class





talawa
1.0.0+1






