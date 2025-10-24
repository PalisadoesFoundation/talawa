import 'package:flutter/material.dart';
import 'package:talawa/models/events/event_venue.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

/// VenueSelectionWidget provides UI for selecting a venue for an event.
class VenueSelectionWidget extends StatefulWidget {
  const VenueSelectionWidget({super.key, required this.model});

  /// The model used for venue operations.
  final CreateEventViewModel model;

  @override
  State<VenueSelectionWidget> createState() => _VenueSelectionWidgetState();
}

class _VenueSelectionWidgetState extends State<VenueSelectionWidget> {
  /// The currently selected venue.
  Venue? selectedVenue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            final List<Venue> venues = await widget.model.fetchVenues();
            if (!context.mounted) return;
            final Venue? selected = await showModalBottomSheet<Venue>(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return VenueBottomSheet(venues: venues);
              },
            );
            if (selected != null) {
              setState(() {
                selectedVenue = selected;
              });
            }
          },
          child: selectedVenue == null
              ? Container(
                  height: 50.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.2,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.add_location, color: Colors.blueAccent),
                      const SizedBox(width: 10.0),
                      Text(
                        AppLocalizations.of(context)!
                            .strictTranslate('Add Venue'),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                )
              : Container(
                  height: 100.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.2,
                    ),
                  ),
                  child: Row(
                    children: [
                      if (selectedVenue!.imageUrl != null &&
                          selectedVenue!.imageUrl!.isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network(
                            selectedVenue!.imageUrl!.replaceAll(
                              'http://localhost:4000',
                              GraphqlConfig.orgURI!
                                  .replaceFirst('/graphql', ''),
                            ),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        )
                      else
                        Image.asset(
                          'assets/images/defaultImg.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              selectedVenue!.name ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            if (selectedVenue!.capacity != null)
                              Text(
                                'Capacity: ${selectedVenue!.capacity}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selectedVenue = null;
                              });
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.redAccent,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // You can implement edit venue logic here
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

/// VenueBottomSheet shows a list of available venues for selection.
class VenueBottomSheet extends StatelessWidget {
  const VenueBottomSheet({super.key, required this.venues});

  /// List of available venues.
  final List<Venue> venues;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Select Venue',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: venues.isEmpty
                ? const Center(child: Text('No venues available'))
                : ListView.builder(
                    itemCount: venues.length,
                    itemBuilder: (context, index) {
                      final venue = venues[index];
                      return ListTile(
                        leading:
                            venue.imageUrl != null && venue.imageUrl!.isNotEmpty
                                ? Image.network(
                                    venue.imageUrl!.replaceAll(
                                      'http://localhost:4000',
                                      GraphqlConfig.orgURI!
                                          .replaceFirst('/graphql', ''),
                                    ),
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/images/defaultImg.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                        title: Text(venue.name ?? 'Unnamed Venue'),
                        subtitle: venue.capacity != null
                            ? Text('Capacity: ${venue.capacity}')
                            : null,
                        onTap: () {
                          Navigator.pop(context, venue);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
