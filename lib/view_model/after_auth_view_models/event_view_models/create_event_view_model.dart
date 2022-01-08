import 'dart:io';

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/org_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

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

  late OrganizationService _organizationService;
  late final Map<String, bool> _adminCheckedMap = {};
  late final List<User> _selectedAdmins = [];
  late final Map<String, bool> _memberCheckedMap = {};
  late final List<User> _selectedMembers = [];
  late List<User> orgMembersList = [];

  final formKey = GlobalKey<FormState>();
  final _eventService = locator<EventService>();
  final _dbFunctions = locator<DataBaseMutationFunctions>();
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
    _organizationService = locator<OrganizationService>();

    _imageFile = null;
    _multiMediaPickerService = locator<MultiMediaPickerService>();
  }

  Future<void> createEvent() async {
    titleFocus.unfocus();
    locationFocus.unfocus();
    descriptionFocus.unfocus();
    validate = AutovalidateMode.always;
    if (formKey.currentState!.validate()) {
      validate = AutovalidateMode.disabled;

      final DateTime startDate = eventStartDate;
      final DateTime endDate = eventEndDate;
      final DateTime startTime = DateTime(startDate.year, startDate.month,
          startDate.day, eventStartTime.hour, eventStartTime.minute);
      final DateTime endTime = DateTime(endDate.year, endDate.month,
          endDate.day, eventEndTime.hour, eventEndTime.minute);
      final Map<String, dynamic> variables = {
        'startDate': startDate.toString(),
        'endDate': endDate.toString(),
        'organizationId': _currentOrg.id!,
        'title': eventTitleTextController.text,
        'description': eventDescriptionTextController.text,
        'location': eventLocationTextController.text,
        'isPublic': isPublicSwitch,
        'isRegisterable': isRegisterableSwitch,
        'recurring': false,
        'allDay': false,
        'startTime': startTime.microsecondsSinceEpoch.toString(),
        'endTime': endTime.microsecondsSinceEpoch.toString(),
      };

      navigationService.pushDialog(
          const CustomProgressDialog(key: Key('EventCreationProgress')));
      final tokenResult = await _dbFunctions
          .refreshAccessToken(userConfig.currentUser.refreshToken!);
      print(tokenResult);
      final result = await _dbFunctions.gqlAuthMutation(
        EventQueries().addEvent(),
        variables: variables,
      );
      navigationService.pop();
      print('Result is : $result');
      if (result != null) {
        navigationService.pop();

        await _eventService.getEvents();
      }
    }
  }

  Future<void> getImageFromGallery({bool camera = false}) async {
    final _image =
        await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
    if (_image != null) {
      _imageFile = _image;
      notifyListeners();
    }
  }

  void removeImage() {
    _imageFile = null;
    notifyListeners();
  }

  Future<List<User>> getCurrentOrgUsersList({required bool isAdmin}) async {
    if (orgMembersList.isEmpty) {
      orgMembersList = await _organizationService
          .getOrgMembersList(userConfig.currentOrg.id!);
    }

    orgMembersList.forEach((orgMember) {
      if (isAdmin) {
        _adminCheckedMap.putIfAbsent(orgMember.id!, () => false);
      } else {
        _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
      }
      _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
    });
    return orgMembersList;
  }

  void buildUserList({required bool isAdmin}) {
    isAdmin ? _selectedAdmins.clear() : _selectedMembers.clear();

    orgMembersList.forEach((orgMember) {
      if (_adminCheckedMap[orgMember.id] == true && isAdmin) {
        _selectedAdmins.add(orgMember);
      } else if (_memberCheckedMap[orgMember.id] == true && !isAdmin) {
        _selectedMembers.add(orgMember);
      }
    });
    notifyListeners();
  }

  void removeUserFromList({required bool isAdmin, required String userId}) {
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
