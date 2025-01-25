




build method - DateTimeTile class - event\_date\_time\_tile library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/event\_date\_time\_tile.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_event_date_time_tile/)
3. [DateTimeTile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_event_date_time_tile/DateTimeTile-class.html)
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
    color: Theme.of(context).colorScheme.primaryContainer,
    height: SizeConfig.screenHeight! * 0.068,
    width: double.infinity,
    child: Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.083),
      child: Row(
        children: [
          const Icon(
            Icons.calendar_today,
            color: Color(0xff524F4F),
            size: 19,
          ),
          SizedBox(
            width: SizeConfig.screenWidth! * 0.045,
          ),
          InkWell(
            key: const Key('EventDateTimeTileDate'),
            onTap: () async {
              setDate();
            },
            child: Text(
              date,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          if (!isAllDay) ...[
            const Spacer(),
            const Icon(
              Icons.schedule,
              color: Color(0xff524F4F),
              size: 19,
            ),
            SizedBox(
              width: SizeConfig.screenWidth! * 0.045,
            ),
            InkWell(
              key: const Key('EventDateTimeTileTime'),
              onTap: () async {
                setTime();
              },
              child: Text(
                time,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ],
      ),
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [event\_date\_time\_tile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_event_date_time_tile/)
3. [DateTimeTile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_event_date_time_tile/DateTimeTile-class.html)
4. build method

##### DateTimeTile class





talawa
1.0.0+1






