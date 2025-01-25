




build method - VenueCard class - venue\_card library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/venue\_card.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_venue_card/)
3. [VenueCard](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_venue_card/VenueCard-class.html)
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
  final orgURI = GraphqlConfig.orgURI!.replaceFirst('/graphql', '');
  final imageURl =
      venue.imageUrl!.replaceAll('http://localhost:4000', orgURI);

  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Stack(
      children: [
        Card(
          surfaceTintColor: Theme.of(context).colorScheme.secondaryContainer,
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          elevation: 3,
          color: isSelected
              ? Colors.blue.withOpacity(0.3)
              : Theme.of(context).primaryColor,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 2.5,
                child: Container(
                  key: const Key('image_container'),
                  height: SizeConfig.screenHeight! * 0.11,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topCenter,
                      image: venue.imageUrl!.isNotEmpty
                          ? NetworkImage(imageURl)
                          : const AssetImage('assets/images/defaultImg.png')
                              as ImageProvider,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.48,
                          child: Text(
                            venue.name!,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        const Icon(
                          Icons.people,
                          size: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Capacity: ${venue.capacity}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.006,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.description,
                          size: 12,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.015,
                        ),
                        Expanded(
                          child: Text(
                            venue.description!,
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (isSelected)
          const Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
          ),
      ],
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [venue\_card](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_venue_card/)
3. [VenueCard](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_venue_card/VenueCard-class.html)
4. build method

##### VenueCard class





talawa
1.0.0+1






