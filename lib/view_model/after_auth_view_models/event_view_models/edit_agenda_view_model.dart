import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// a_line_ending_with_end_punctuation.
class EditAgendaItemViewModel extends BaseModel {
  final _eventService = locator<EventService>();
  final _multiMediaPickerService = locator<MultiMediaPickerService>();

  late EventAgendaItem _agendaItem;
  List<AgendaCategory> _categories = [];
  List<AgendaCategory> _selectedCategories = [];
  List<String> _initialUrls = [];
  List<String> _currentUrls = [];
  List<String> _initialAttachments = [];
  List<String> _currentAttachments = [];

  // ── Text fields (owned here as plain Strings; the View creates its own
  //    TextEditingControllers that are synced to these via onChanged).

  /// Current title text.
  String titleText = '';

  /// Current description text.
  String descriptionText = '';

  /// Current URL input text.
  String urlText = '';

  /// Current duration text.
  String durationText = '';

  /// Get the list of all available categories.
  List<AgendaCategory> get categories => _categories;

  /// Get the list of selected categories.
  List<AgendaCategory> get selectedCategories => _selectedCategories;

  /// Get the list of URLs for the agenda item.
  List<String> get urls => _currentUrls;

  /// Get the list of attachments for the agenda item.
  List<String> get attachments => _currentAttachments;

  /// aInitializes the ViewModel with the provided agenda item and categories.
  ///
  /// **params**:
  /// * `agendaItem`: The [EventAgendaItem] to be edited.
  /// * `categories`: List of all available [AgendaCategory] for the event.
  ///
  /// **returns**:
  ///   None
  void initialize(EventAgendaItem agendaItem, List<AgendaCategory> categories) {
    _agendaItem = agendaItem;
    _categories = categories;
    _fillEditForm();
  }

  /// Populates the form with the current agenda item details.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _fillEditForm() {
    titleText = _agendaItem.name ?? '';
    descriptionText = _agendaItem.description ?? '';
    durationText = _agendaItem.duration ?? '';
    _initialUrls = List<String>.from(_agendaItem.urls ?? []);
    _currentUrls = List<String>.from(_initialUrls);
    _initialAttachments = List<String>.from(_agendaItem.attachments ?? []);
    _currentAttachments = List<String>.from(_initialAttachments);
    final agendaCategoryIds =
        _agendaItem.categories?.map((cat) => cat.id).toList() ?? [];

    _selectedCategories = _categories
        .where((category) => agendaCategoryIds.contains(category.id))
        .toList();
    notifyListeners();
  }

  /// Updates the selected categories in the form.
  ///
  /// **params**:
  /// * `categories`: The list of selected [AgendaCategory].
  ///
  /// **returns**:
  ///   None
  void setSelectedCategories(List<AgendaCategory> categories) {
    _selectedCategories = categories;
    notifyListeners();
  }

  /// Adds a URL to the agenda item.
  ///
  /// **params**:
  /// * `url`: The URL string to be added.
  ///
  /// **returns**:
  ///   None
  void addUrl(String url) {
    if (url.isNotEmpty) {
      _currentUrls.add(url);
      urlText = '';
      notifyListeners();
    }
  }

  /// Removes a URL from the agenda item.
  ///
  /// **params**:
  /// * `url`: The URL string to be removed.
  ///
  /// **returns**:
  ///   None
  void removeUrl(String url) {
    _currentUrls.remove(url);
    notifyListeners();
  }

  /// Removes an attachment from the agenda item.
  ///
  /// **params**:
  /// * `image`: The base64 string representing the attachment to be removed.
  ///
  /// **returns**:
  ///   None
  void removeAttachment(String image) {
    _currentAttachments.remove(image);
    notifyListeners();
  }

  /// Picks an attachment for the agenda item from the gallery or camera.
  ///
  /// **params**:
  /// * `fromCamera`: If `true`, opens the camera to pick an image, otherwise opens the gallery.
  ///
  /// **returns**:
  ///   None
  Future<void> pickAttachment({bool fromCamera = false}) async {
    final File? pickedFile =
        await _multiMediaPickerService.getPhotoFromGallery(camera: fromCamera);
    if (pickedFile != null) {
      final base64PickedFile = await imageService.convertToBase64(pickedFile);
      _currentAttachments.add(base64PickedFile);
      notifyListeners();
    }
  }

  /// Checks if there are any unsaved changes in the form.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `bool`: define_the_return
  bool checkForChanges() {
    final bool titleChanged = titleText != (_agendaItem.name ?? '');
    final bool descriptionChanged =
        descriptionText != (_agendaItem.description ?? '');
    final bool durationChanged = durationText != (_agendaItem.duration ?? '');

    final selectedCategoryIds =
        _selectedCategories.map((cat) => cat.id).toSet();
    final agendaCategoryIds =
        _agendaItem.categories?.map((cat) => cat.id).toSet() ?? {};
    final bool categoriesChanged =
        !setEquals(selectedCategoryIds, agendaCategoryIds);

    final bool urlsChanged = !listEquals(_initialUrls, _currentUrls);
    final bool attachmentsChanged =
        !listEquals(_initialAttachments, _currentAttachments);

    final bool hasChange = titleChanged ||
        descriptionChanged ||
        durationChanged ||
        categoriesChanged ||
        urlsChanged ||
        attachmentsChanged;

    return hasChange;
  }

  /// Updates the agenda item with the modified values.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> updateAgendaItem() async {
    try {
      if (!checkForChanges()) return;
      final List<String> attachmentPaths = _currentAttachments;
      final List<String> categoryIds =
          _selectedCategories.map((category) => category.id!).toList();

      final updatedAgendaItem = {
        'title': titleText,
        'description': descriptionText,
        'duration': durationText,
        'attachments': attachmentPaths,
        'urls': _currentUrls,
        'categories': categoryIds,
      };

      await _eventService.updateAgendaItem(
        _agendaItem.id!,
        updatedAgendaItem,
      ) as QueryResult<Object?>;
    } catch (e) {
      print('Error updating agenda item: $e');
    }
  }

  /// Navigate back to the previous screen.
  ///
  /// This method provides a clean interface for the View to navigate back
  /// without directly accessing the NavigationService.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void navigateBack() {
    navigationService.pop();
  }
}
