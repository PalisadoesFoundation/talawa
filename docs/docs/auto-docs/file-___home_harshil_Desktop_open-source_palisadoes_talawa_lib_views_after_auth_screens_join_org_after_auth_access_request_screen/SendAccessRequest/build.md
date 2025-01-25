




build method - SendAccessRequest class - access\_request\_screen library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/join\_org\_after\_auth/access\_request\_screen.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_join_org_after_auth_access_request_screen/)
3. [SendAccessRequest](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_join_org_after_auth_access_request_screen/SendAccessRequest-class.html)
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
  return BaseView<AccessScreenViewModel>(
    onModelReady: (model) => model.initialise(org),
    builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          resizeToAvoidBottomInset: false,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/Group 8948.png'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You need access",
                      style: AppTheme.title.copyWith(color: AppTheme.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Request access, or switch to an account with access",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextField(
                        style: const TextStyle(color: AppTheme.blackPrimary),
                        minLines: 15,
                        maxLines: 20,
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                            maxWidth: 400,
                            minWidth: 100,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.white,
                            ),
                          ),
                          hintText: "Message (optional)",
                          hintStyle: const TextStyle(
                            color: AppTheme.blackSecondary,
                          ),
                          filled: true,
                          fillColor: AppTheme.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    model.sendMembershipRequest();
                  },
                  style:
                      TextButton.styleFrom(backgroundColor: AppTheme.green),
                  child: const Text(
                    "Request Access",
                    style: TextStyle(
                      color: AppTheme.white,
                    ),
                  ),
                ),
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
2. [access\_request\_screen](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_join_org_after_auth_access_request_screen/)
3. [SendAccessRequest](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_join_org_after_auth_access_request_screen/SendAccessRequest-class.html)
4. build method

##### SendAccessRequest class





talawa
1.0.0+1






