import 'dart:io';

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// CreateEventViewModel class have methods to interact with model in
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

  TextEditingController eventTitleTextController = TextEditingController();
  TextEditingController eventLocationTextController = TextEditingController();
  TextEditingController eventDescriptionTextController =
      TextEditingController();
  TimeOfDay eventStartTime = TimeOfDay.now();
  TimeOfDay eventEndTime = TimeOfDay.now();
  DateTime eventStartDate = DateTime.now();
  DateTime eventEndDate = DateTime.now();
  bool isPublicSwitch = true;
  bool isRegisterableSwitch = true;
  FocusNode titleFocus = FocusNode();
  FocusNode locationFocus = FocusNode();
  FocusNode descriptionFocus = FocusNode();

  double? latitude;
  double? longitude;

  //late OrganizationService _organizationService;
  late final Map<String, bool> _adminCheckedMap = {};
  late final List<User> _selectedAdmins = [];
  late final Map<String, bool> _memberCheckedMap = {};
  late final List<User> _selectedMembers = [];
  late List<User> orgMembersList = [];

  final formKey = GlobalKey<FormState>();
  final _eventService = locator<EventService>();
  AutovalidateMode validate = AutovalidateMode.disabled;

  late OrgInfo _currentOrg;
  final _userConfig = locator<UserConfig>();
  List<User> get selectedAdmins => _selectedAdmins;
  List<User> get selectedMembers => _selectedMembers;
  Map<String, bool> get adminCheckedMap => _adminCheckedMap;
  Map<String, bool> get memberCheckedMap => _memberCheckedMap;
  File? get imageFile => _imageFile;

  initialize() {
    _currentOrg = _userConfig.currentOrg;
    //_organizationService = locator<OrganizationService>();

    _imageFile = null;
    _multiMediaPickerService = locator<MultiMediaPickerService>();
  }

  /// This function is used to create the event for the organization.
  /// The function uses `database_mutation_functions` services to call the graphQL mutation
  /// for creating an event and passes the required variables for the event.
  Future<void> createEvent() async {
    titleFocus.unfocus();
    locationFocus.unfocus();
    descriptionFocus.unfocus();
    validate = AutovalidateMode.always;
    if (formKey.currentState!.validate()) {
      validate = AutovalidateMode.disabled;

      // variables initialisation
      final DateTime startDate = eventStartDate;
      final DateTime endDate = eventEndDate;
      final DateTime startTime = DateTime(
        startDate.year,
        startDate.month,
        startDate.day,
        eventStartTime.hour,
        eventStartTime.minute,
      );
      final DateTime endTime = DateTime(
        endDate.year,
        endDate.month,
        endDate.day,
        eventEndTime.hour,
        eventEndTime.minute,
      );
      // all required data for creating an event
      final Map<String, dynamic> variables = {
        'startDate': startDate.toString(),
        'endDate': endDate.toString(),
        'organizationId': _currentOrg.id,
        'title': eventTitleTextController.text,
        'description': eventDescriptionTextController.text,
        'location': eventLocationTextController.text,
        'isPublic': isPublicSwitch,
        'isRegisterable': isRegisterableSwitch,
        'recurring': false,
        'allDay': false,
        'startTime': startTime.microsecondsSinceEpoch.toString(),
        'endTime': endTime.microsecondsSinceEpoch.toString(),
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
      };

      navigationService.pushDialog(
        const CustomProgressDialog(key: Key('EventCreationProgress')),
      );
      final tokenResult = await databaseFunctions
          .refreshAccessToken(userConfig.currentUser.refreshToken!);
      print(tokenResult);
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
  /// The function uses the `_multiMediaPickerService` services.
  ///
  /// params:
  /// * [camera] : if true then open camera for image, else open gallery to select image.
  Future<void> getImageFromGallery({bool camera = false}) async {
    final _image =
        await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
    if (_image != null) {
      _imageFile = _image;
      notifyListeners();
    }
  }

  /// This function remove the selected image.
  void removeImage() {
    _imageFile = null;
    notifyListeners();
  }

  /// This function fetch all the users in the current organization and return `List`.
  ///
  /// params:
  /// * [isAdmin]
  Future<List<User>> getCurrentOrgUsersList({required bool isAdmin}) async {
    if (orgMembersList.isEmpty) {
      orgMembersList = await organizationService
          .getOrgMembersList(userConfig.currentOrg.id!);
    }

    // loop through list
    orgMembersList.forEach((orgMember) {
      // if `orgMember` is admin
      if (isAdmin) {
        _adminCheckedMap.putIfAbsent(orgMember.id!, () => false);
      } else {
        _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
      }
      _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
    });
    // return list
    return orgMembersList;
  }

  /// This function build the user list. `_selectedAdmins` for admins and `_selectedMembers` for members.
  ///
  /// params:
  /// * [isAdmin]
  void buildUserList({required bool isAdmin}) {
    isAdmin ? _selectedAdmins.clear() : _selectedMembers.clear();

    // loop through the organization member list

    orgMembersList.forEach((orgMember) {
      // if admin
      if (_adminCheckedMap[orgMember.id] == true && isAdmin) {
        _selectedAdmins.add(orgMember);
      } else if (_memberCheckedMap[orgMember.id] == true && !isAdmin) {
        _selectedMembers.add(orgMember);
      }
    });
    notifyListeners();
  }

  /// This function is used to remove a user from user's list.
  ///
  /// params:
  /// * [isAdmin] : true if the user that need to be removed is admin else false.
  /// * [userId] : id of the user that need to be removed.
  void removeUserFromList({required bool isAdmin, required String userId}) {
    // if the user is admin.
    if (isAdmin) {
      _selectedAdmins.removeWhere((user) => user.id == userId);
      _adminCheckedMap[userId] = false;
    } else {
      _selectedMembers.removeWhere((user) => user.id == userId);
      _memberCheckedMap[userId] = false;
    }

    notifyListeners();
  }
}
