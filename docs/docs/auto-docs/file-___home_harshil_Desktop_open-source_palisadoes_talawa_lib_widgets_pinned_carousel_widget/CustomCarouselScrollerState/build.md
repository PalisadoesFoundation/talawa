




build method - CustomCarouselScrollerState class - pinned\_carousel\_widget library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/pinned\_carousel\_widget.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_carousel_widget/)
3. [CustomCarouselScrollerState](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_carousel_widget/CustomCarouselScrollerState-class.html)
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
  // Stack is a widget that positions its
  // children relative to the edges of its box.
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ListTile(
              leading: const CircleAvatar(
                radius: 15.0,
                backgroundColor: Color(0xff737373),
              ),
              title: Text(
                "${widget.pinnedPosts[pindex].creator!.firstName} ${widget.pinnedPosts[pindex].creator!.lastName}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.pinnedPosts[pindex].description!.length > 90
                    ? "${widget.pinnedPosts[pindex].description!.substring(0, 90)}..."
                    : widget.pinnedPosts[pindex].description!,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: const Color(0xFF737373)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Divider(
                          thickness: 3.0,
                          color: pindex == i
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            pindex = index;
          });
        },
        children: List.generate(
          widget.pinnedPosts.length,
          (index) => Container(),
        ),
      ),
    ],
  );
}
```

 


1. [talawa](../../index.html)
2. [pinned\_carousel\_widget](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_carousel_widget/)
3. [CustomCarouselScrollerState](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_carousel_widget/CustomCarouselScrollerState-class.html)
4. build method

##### CustomCarouselScrollerState class





talawa
1.0.0+1






