import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// CreateEventViewModel class have methods to interact with model in.
///
/// the context of creating the event in the organization.
///
/// Methods include:
/// * `createEvent` : to create an event.
/// * `getImageFromGallery` : to select image for a post.
/// * `removeImage` : to remove the image.
/// * `getCurrentOrgUsersList` : to get all user list of current organization.
/// * `removeUserFromList` : to remove a user from list.
class CreateEventViewModel extends BaseModel {
  late MultiMediaPickerService _multiMediaPickerService;
  late File? _imageFile;

  /// Event Title Text Controller.
  TextEditingController eventTitleTextController = TextEditingController();

  /// Event Location Text Controller.
  TextEditingController eventLocationTextController = TextEditingController();

  /// Event Description Text Controller.
  TextEditingController eventDescriptionTextController =
      TextEditingController();

  /// Repeats Every count controller.
  TextEditingController repeatsEveryCountController =
      TextEditingController(text: '1');

  /// Event ends After n occurences controller.
  TextEditingController endOccurenceController =
      TextEditingController(text: '1');

  /// Event Start Time.
  TimeOfDay eventStartTime = TimeOfDay.now();

  /// Event End Time.
  TimeOfDay eventEndTime = TimeOfDay.now().replacing(
    hour: (TimeOfDay.now().hour + (TimeOfDay.now().minute >= 30 ? 1 : 0)) % 24,
    minute: (TimeOfDay.now().minute + 30) % 60,
  );

  /// Event Start Date.
  DateTime eventStartDate = DateTime.now();

  /// Event End Date.
  DateTime? eventEndDate = DateTime.now();

  /// Public Event or Not.
  bool isPublicSwitch = true;

  /// If event is registerable after creation.
  bool isRegisterableSwitch = true;

  /// TitleFocus FocusNode.
  FocusNode titleFocus = FocusNode();

  /// LocationFocus FocusNode.
  FocusNode locationFocus = FocusNode();

  /// DescriptionFocus FocusNode.
  FocusNode descriptionFocus = FocusNode();

  /// is an allday event.
  bool isAllDay = true;

  /// Is a recurring event.
  bool isRecurring = false;

  /// RecurrenceRuleData frequency.
  String recurrenceInterval = EventIntervals.weekly;

  /// Event end type.
  String eventEndType = EventEndTypes.never;

  /// represents the frequency of the event.
  String frequency = Frequency.weekly;

  /// represents the week days of the event.
  Set<String>? weekDays = {
    days[DateTime.now().weekday],
  };

  /// represents the interval of the event.
  int interval = 1;

  /// represents the count of the event.
  int? count;

  /// represents the week day occurence in Month.
  int? weekDayOccurenceInMonth;

  /// represents the recurrence label.
  String recurrenceLabel = 'Does not repeat';

  //late OrganizationService _organizationService;
  late final Map<String, bool> _memberCheckedMap = {};
  late final List<User> _selectedMembers = [];

  /// Organisation Members List.
  late List<User> orgMembersList = [];

  /// Global FormKey.
  final formKey = GlobalKey<FormState>();
  final _eventService = locator<EventService>();

  /// AutoValidateMode default to disabled.
  AutovalidateMode validate = AutovalidateMode.disabled;

  late OrgInfo _currentOrg;
  final _userConfig = locator<UserConfig>();

  /// Getter to return selected members.
  ///
  /// params:
  /// None
  ///
  /// returns:
  /// * `List<User>`: Returns a list of selectedMembers for events
  List<User> get selectedMembers => _selectedMembers;

  /// Getter to return members map.
  ///
  /// params:
  /// None
  ///
  /// returns:
  /// * `Map<String, bool>`: Returns a map of entries with id and boolean if they are
  /// selected for events or not in bottom sheet.
  Map<String, bool> get memberCheckedMap => _memberCheckedMap;

  /// Getter to return imageFile.
  ///
  /// params:
  /// None
  ///
  /// returns:
  /// * `File?`: Returns imageFile.
  File? get imageFile => _imageFile;

  /// Function To Initialize.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialize() {
    _currentOrg = _userConfig.currentOrg;
    //_organizationService = locator<OrganizationService>();

    _imageFile = null;
    _multiMediaPickerService = locator<MultiMediaPickerService>();
  }

  /// This function is used to create the event for the organization.
  ///
  /// The function uses `database_mutation_functions` services to call the graphQL mutation
  /// for creating an event and passes the required variables for the event.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> createEvent() async {
    titleFocus.unfocus();
    locationFocus.unfocus();
    descriptionFocus.unfocus();
    validate = AutovalidateMode.always;
    if (formKey.currentState!.validate()) {
      validate = AutovalidateMode.disabled;

      // variables initialisation
      final DateTime startTime = DateTime(
        eventStartDate.year,
        eventStartDate.month,
        eventStartDate.day,
        eventStartTime.hour,
        eventStartTime.minute,
      );
      final DateTime endTime = DateTime(
        eventEndDate?.year ?? DateTime.now().year,
        eventEndDate?.month ?? DateTime.now().month,
        eventEndDate?.day ?? DateTime.now().day,
        eventEndTime.hour,
        eventEndTime.minute,
      );

      // all required data for creating an event
      final Map<String, dynamic> variables = {
        "data": {
          'title': eventTitleTextController.text,
          'description': eventDescriptionTextController.text,
          'location': eventLocationTextController.text,
          'isPublic': isPublicSwitch,
          'isRegisterable': isRegisterableSwitch,
          'recurring': isRecurring,
          'allDay': isAllDay,
          'organizationId': _currentOrg.id,
          'startDate': DateFormat('yyyy-MM-dd').format(eventStartDate),
          if (eventEndDate != null)
            'endDate': DateFormat('yyyy-MM-dd').format(eventEndDate!),
          'startTime': '${DateFormat('HH:mm:ss').format(startTime)}Z',
          if (eventEndDate != null)
            'endTime': '${DateFormat('HH:mm:ss').format(endTime)}Z',
        },
        if (isRecurring)
          'recurrenceRuleData': {
            'frequency': frequency,
            'weekDays': weekDays,
            'interval': interval,
            'count': count,
            'weekDayOccurenceInMonth': weekDayOccurenceInMonth,
          },
      };

      navigationService.pushDialog(
        const CustomProgressDialog(key: Key('EventCreationProgress')),
      );
      // invoke the `gqlAuthMutation` function of `databaseFunctions`
      // service along with the mutation query and variable map.
      final result = await databaseFunctions.gqlAuthMutation(
        EventQueries().addEvent(),
        variables: variables,
      );
      navigationService.pop();
      if (result != null) {
        navigationService.pop();
        await _eventService.getEvents();
      }
    }
  }

  /// This function is used to get the image from gallery.
  ///
  /// The function uses the `_multiMediaPickerService` services.
  ///
  /// **params**:
  /// * `camera`: if true then open camera for image, else open gallery to select image.
  ///
  /// **returns**:
  ///   None
  Future<void> getImageFromGallery({bool camera = false}) async {
    final image =
        await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
    if (image != null) {
      _imageFile = image;
      notifyListeners();
    }
  }

  /// This function remove the selected image.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void removeImage() {
    _imageFile = null;
    notifyListeners();
  }

  /// This function fetch all the users in the current organization and return `List`.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<List<User>>`: Current Organization Users List
  Future<List<User>> getCurrentOrgUsersList() async {
    if (orgMembersList.isEmpty) {
      orgMembersList = await organizationService
          .getOrgMembersList(userConfig.currentOrg.id!);
    }

    // loop through list
    orgMembersList.forEach((orgMember) {
      _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
      _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
    });
    // return list
    return orgMembersList;
  }

  /// This function build the user list.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void buildUserList() {
    _selectedMembers.clear();

    // loop through the organization member list

    orgMembersList.forEach((orgMember) {
      if (_memberCheckedMap[orgMember.id] == true) {
        _selectedMembers.add(orgMember);
      }
    });
    notifyListeners();
  }

  /// This function is used to remove a user from user's list.
  ///
  /// **params**:
  /// * `userId`: id of the user that need to be removed.
  ///
  /// **returns**:
  ///   None
  void removeUserFromList({required String userId}) {
    _selectedMembers.removeWhere((user) => user.id == userId);
    _memberCheckedMap[userId] = false;

    notifyListeners();
  }

  /// Updates the event end date to selected event end date.
  ///
  /// **params**:
  /// * `selectedEndDate`: new event end date selected by user.
  ///
  /// **returns**:
  ///   None
  void setEventEndDate(DateTime? selectedEndDate) {
    eventEndDate = selectedEndDate;
    notifyListeners();
  }
}
