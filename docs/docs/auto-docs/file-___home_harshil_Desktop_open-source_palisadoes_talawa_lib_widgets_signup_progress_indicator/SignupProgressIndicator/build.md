




build method - SignupProgressIndicator class - signup\_progress\_indicator library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/signup\_progress\_indicator.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_signup_progress_indicator/)
3. [SignupProgressIndicator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_signup_progress_indicator/SignupProgressIndicator-class.html)
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
  return Container(
    alignment: Alignment.center,
    height: SizeConfig.screenHeight! * 0.15,
    child: Timeline.tileBuilder(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      builder: TimelineTileBuilder.connected(
        contentsBuilder: (_, index) => Text(
          AppLocalizations.of(context)!.strictTranslate(progressLabel[index]),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                // If the flow index is greater than currentPageIndex then
                // show green(visited) color else show fade(not visited) color.
                color: index <= currentPageIndex
                    ? const Color(0xFF008A37)
                    : const Color(0xFF737373),
              ),
          textAlign: TextAlign.center,
        ),
        connectorBuilder: (_, index, __) {
          return SolidLineConnector(
            space: 30,
            // If the flow index is greater than currentPageIndex then
            // show green(visited) color else show fade(not visited) color.
            color: index < currentPageIndex
                ? const Color(0xFF008A37)
                : const Color(0xFF737373),
          );
        },
        indicatorBuilder: (_, index) {
          return DotIndicator(
            size: 25,
            color: index <= currentPageIndex
                ? const Color(0xFF008A37)
                : const Color(0xFF737373),
            child: index < currentPageIndex
                ? const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 20,
                  )
                : const SizedBox(),
          );
        },
        itemExtentBuilder: (_, __) => MediaQuery.of(context).size.width / 3,
        itemCount: 3,
      ),
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [signup\_progress\_indicator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_signup_progress_indicator/)
3. [SignupProgressIndicator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_signup_progress_indicator/SignupProgressIndicator-class.html)
4. build method

##### SignupProgressIndicator class





talawa
1.0.0+1






