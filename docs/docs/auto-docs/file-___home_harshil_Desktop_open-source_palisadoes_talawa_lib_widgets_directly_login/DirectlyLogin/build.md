




build method - DirectlyLogin class - directly\_login library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/directly\_login.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_directly_login/)
3. [DirectlyLogin](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_directly_login/DirectlyLogin-class.html)
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
  return FutureBuilder(
    future: model.fetchPrevUser(),
    builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
      if (snapshot.hasError ||
          snapshot.connectionState == ConnectionState.waiting) {
        return const SizedBox();
      }
      return Visibility(
        visible:
            model.prevUserEmail != null && model.prevUserPassword != null,
        child: Center(
          child: Text.rich(
            overflow: TextOverflow.ellipsis,
            TextSpan(
              text:
                  '${AppLocalizations.of(context)!.translate("Login directly with")} ',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                  ),
              children: <InlineSpan>[
                TextSpan(
                  text: model.prevUserEmail,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: const Color(0xFF4285F4),
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = loginUsingPrevCredentials,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [directly\_login](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_directly_login/)
3. [DirectlyLogin](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_directly_login/DirectlyLogin-class.html)
4. build method

##### DirectlyLogin class





talawa
1.0.0+1






