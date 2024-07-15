import 'package:flutter/material.dart';
import 'package:talawa/models/events/event_venue.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/venue_card.dart';

/// a_line_ending_with_end_punctuation.
class VenueBottomSheet extends StatefulWidget {
  const VenueBottomSheet({super.key, required this.venues});

  /// a_line_ending_with_end_punctuation.
  final List<Venue> venues;

  @override
  _VenueBottomSheetState createState() => _VenueBottomSheetState();
}

class _VenueBottomSheetState extends State<VenueBottomSheet> {
  /// Controller for the search text field.
  TextEditingController searchController = TextEditingController();

  /// The list of venues filtered based on the search query.
  List<Venue> filteredVenues = [];

  /// Whether the search field is currently active.
  bool isSearching = false;

  /// The venue that is currently selected by the user.
  Venue? selectedVenue;

  @override
  void initState() {
    super.initState();
    filteredVenues = widget.venues;
  }

  /// Filters the venues based on the search query.
  ///
  /// **params**:
  /// * `query`: The search query entered by the user.
  ///
  /// **returns**:
  ///   None
  void _searchVenue(String query) {
    setState(() {
      filteredVenues = widget.venues
          .where(
            (venue) => venue.name!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  /// Toggles the search field on and off.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        searchController.clear();
        filteredVenues = widget.venues;
      }
    });
  }

  /// Selects a venue and marks it as the currently selected venue.
  ///
  /// **params**:
  /// * `venue`: The venue to select.
  ///
  /// **returns**:
  ///   None
  void _selectVenue(Venue venue) {
    setState(() {
      selectedVenue = venue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('gestureDetector1'),
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.95,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (!isSearching)
                  Expanded(
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!
                            .strictTranslate('Add Venue'),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                if (isSearching)
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: _searchVenue,
                      decoration: const InputDecoration(
                        hintText: 'Search Venue',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                if (selectedVenue != null)
                  IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      Navigator.of(context).pop(selectedVenue);
                    },
                  ),
                IconButton(
                  icon: Icon(isSearching ? Icons.close : Icons.search),
                  onPressed: _toggleSearch,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            if (widget.venues.isEmpty)
              const Center(child: Text('No Venues added yet'))
            else if (filteredVenues.isEmpty)
              const Center(child: Text('No venues available'))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: filteredVenues.length,
                  itemBuilder: (context, index) {
                    final venue = filteredVenues[index];
                    return GestureDetector(
                      onTap: () => _selectVenue(venue),
                      child: VenueCard(
                        venue: venue,
                        isSelected: selectedVenue == venue,
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
