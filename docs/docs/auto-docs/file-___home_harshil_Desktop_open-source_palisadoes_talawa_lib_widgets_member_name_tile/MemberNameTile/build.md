




build method - MemberNameTile class - member\_name\_tile library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/member\_name\_tile.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_member_name_tile/)
3. [MemberNameTile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_member_name_tile/MemberNameTile-class.html)
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
  return Padding(
    padding: const EdgeInsets.only(top: 10, right: 5),
    child: Container(
      width: SizeConfig.screenWidth! * (0.3 + userName.length / 50),
      height: SizeConfig.screenHeight! * 0.04,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.screenHeight! * 0.02),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Background is set with the image uploaded by the user.
          userImage != null
              ? CircleAvatar(
                  radius: SizeConfig.screenHeight! * 0.0201,
                  backgroundImage: NetworkImage(userImage!),
                )
              // If the user has not uploaded his/her image,
              // then a circle avatar is created.
              // It has the first character of the user's name
              //in uppercase and the default background color.
              : CircleAvatar(
                  radius: SizeConfig.screenHeight! * 0.0201,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Text(
                    userName.substring(0, 1).toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
          // The name of the member in text form.
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              userName,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => onDelete(),
            icon: const Icon(
              Icons.cancel_rounded,
              color: Color(0xff524F4F),
              size: 19,
            ),
          ),
        ],
      ),
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [member\_name\_tile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_member_name_tile/)
3. [MemberNameTile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_member_name_tile/MemberNameTile-class.html)
4. build method

##### MemberNameTile class





talawa
1.0.0+1






