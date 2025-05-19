import 'package:flutter/material.dart';
import 'package:talawa/models/events/event_venue.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';

/// This class returns the VenueCard widget.
class VenueCard extends StatelessWidget {
  const VenueCard({
    super.key,
    required this.venue,
    this.isSelected = false,
  });

  /// The venue object containing details about the venue.
  final Venue venue;

  /// Indicates whether the venue card is selected.
  ///
  /// When true, the venue card will visually indicate that it is selected.
  final bool isSelected;

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
                ? Colors.blue.withAlpha((0.3 * 255).toInt())
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
                      color: Colors.grey.withAlpha((0.3 * 255).toInt()),
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
}
