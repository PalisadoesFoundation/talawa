




build method - JoinOrganisationAfterAuth class - join\_organisation\_after\_auth library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/join\_org\_after\_auth/join\_organisation\_after\_auth.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_join_org_after_auth_join_organisation_after_auth/)
3. [JoinOrganisationAfterAuth](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_join_org_after_auth_join_organisation_after_auth/JoinOrganisationAfterAuth-class.html)
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
  return BaseView<SelectOrganizationViewModel>(
    onModelReady: (model) => model.initialise(orgId),
    builder: (context, model, child) {
      return Scaffold(
        key: const Key('JoinOrgScreen'),
        // header for the widget
        appBar: AppBar(
          centerTitle: true,
          // title of the header.
          title: Text(
            AppLocalizations.of(context)!
                .strictTranslate('Join Organisation'),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
          ),
          // action button for the option to join the organization using QR code.
          actions: [
            IconButton(
              icon: const Icon(
                Icons.qr_code_scanner,
                size: 30,
                semanticLabel: 'Join Organisation with QR',
              ),
              onPressed: () => scanQR(context, model),
            ),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Divider(
                color: Colors.grey,
                thickness: 2.0,
              ),
            ),
            Expanded(
              // if model searching is under process then renders OrganizationSearchList widget
              // else renders OrganizationList widget.
              child: model.searching
                  ? OrganizationSearchList(model: model)
                  : OrganizationList(model: model),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.0215,
            ),
          ],
        ),
      );
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [join\_organisation\_after\_auth](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_join_org_after_auth_join_organisation_after_auth/)
3. [JoinOrganisationAfterAuth](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_join_org_after_auth_join_organisation_after_auth/JoinOrganisationAfterAuth-class.html)
4. build method

##### JoinOrganisationAfterAuth class





talawa
1.0.0+1






