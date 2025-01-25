




build method - CustomAvatar class - custom\_avatar library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/custom\_avatar.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_avatar/)
3. [CustomAvatar](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_avatar/CustomAvatar-class.html)
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
  return isImageNull
      //creating the avatar with the icon-theme color when the image is null
      ? CircleAvatar(
          backgroundColor:
              Theme.of(context).iconTheme.color!.withOpacity(0.2),
          maxRadius: maxRadius,
          child: Center(
            child: Text(
              firstAlphabet!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: fontSize,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
          ),
        )
      //creating the avatar with the provided image
      : CachedNetworkImage(
          cacheManager: cacheManager,
          imageBuilder: (context, imageProvider) {
            return CircleAvatar(
              backgroundColor:
                  Theme.of(context).iconTheme.color!.withOpacity(0.2),
              backgroundImage: imageProvider,
            );
          },
          imageUrl: imageUrl!,
          placeholder: (context, url) => CircleAvatar(
            child: Shimmer.fromColors(
              baseColor: Colors.transparent,
              highlightColor: Colors.white30,
              child: const CircleAvatar(),
            ),
          ),
          errorWidget: (context, url, error) =>
              const CircleAvatar(child: Icon(Icons.error)),
        );
}
```

 


1. [talawa](../../index.html)
2. [custom\_avatar](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_avatar/)
3. [CustomAvatar](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_avatar/CustomAvatar-class.html)
4. build method

##### CustomAvatar class





talawa
1.0.0+1






