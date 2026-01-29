import 'package:flutter/material.dart';
import 'package:talawa/models/events/event_venue.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/widgets/common/cached_image.dart';

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

  /// Whether the widget is currently loading venues.
  bool isLoading = false;

  /// Handles venue selection from the bottom sheet.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _selectVenue() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      final List<Venue> venues = await widget.model.fetchVenues();
      if (!mounted) return;

      final Venue? selected = await showModalBottomSheet<Venue>(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return VenueBottomSheet(venues: venues);
        },
      );

      if (selected != null && mounted) {
        setState(() {
          selectedVenue = selected;
        });
      }
    } catch (error) {
      // Handle error gracefully - could show snackbar in real app
      debugPrint('Error fetching venues: $error');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  /// Clears the selected venue.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _clearVenue() {
    setState(() {
      selectedVenue = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          key: const Key('venue_selector_gesture'),
          onTap: _selectVenue,
          child: selectedVenue == null
              ? Container(
                  key: const Key('add_venue_container'),
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
                      if (isLoading)
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      else
                        const Icon(
                          Icons.add_location,
                          color: Colors.blueAccent,
                        ),
                      const SizedBox(width: 10.0),
                      Text(
                        isLoading
                            ? 'Loading...'
                            : AppLocalizations.of(context)!
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
                  key: const Key('selected_venue_container'),
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
                          child: AppCachedImage(
                            url: selectedVenue!.imageUrl!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
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
                            key: const Key('clear_venue_button'),
                            onPressed: _clearVenue,
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.redAccent,
                            ),
                          ),
                          IconButton(
                            key: const Key('edit_venue_button'),
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
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              'Select Venue',
              style: Theme.of(context).textTheme.titleMedium,
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
                                ? AppCachedImage(
                                    url: venue.imageUrl!,
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
