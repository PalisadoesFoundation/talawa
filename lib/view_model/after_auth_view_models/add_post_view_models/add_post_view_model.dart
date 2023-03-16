// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/post_text_field.dart';

/// AddPostViewModel class have different functions that are used
/// to interact with the model to add a new post in the organization.
class AddPostViewModel extends BaseModel {
  //Services
  late MultiMediaPickerService _multiMediaPickerService;
  late NavigationService _navigationService;

  // ignore: unused_field
  late File? _imageFile;
  late User _currentUser;
  late OrgInfo _selectedOrg;
  final PostTextController _controller = PostTextController();
  final List<String> _fetchedhashtags = [];
  late bool _showHashtagList;

  // Getters
  File? get imageFile => _imageFile;
  String get userName => _currentUser.firstName! + _currentUser.lastName!;
  String get orgName => _selectedOrg.name!;
  PostTextController get controller => _controller;
  List<String> get fetchedhashtags => [..._fetchedhashtags];
  bool get showHashtagList => _showHashtagList;

  // initialisation
  void initialise() {
    _currentUser = locator<UserConfig>().currentUser;
    _navigationService = locator<NavigationService>();
    _selectedOrg = locator<UserConfig>().currentOrg;
    _imageFile = null;
    _multiMediaPickerService = locator<MultiMediaPickerService>();
    _showHashtagList = false;
  }

  /// This function is used to get the image from gallery.
  /// The function uses the `_multiMediaPickerService` services.
  ///
  /// params:
  /// * [camera] : if true then open camera for image, else open gallery to select image.
  Future<void> getImageFromGallery({bool camera = false}) async {
    final image =
        await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
    if (image != null) {
      _imageFile = image;
      notifyListeners();
    }
  }

  /// This function uploads the post finally, and navigate the success message in Snack Bar.
  void uploadPost() {
    removeImage();
    _controller.text = "";
    _navigationService.showTalawaErrorSnackBar(
      "Post is uploaded",
      MessageType.info,
    );
  }

  /// This function removes the image selected.
  void removeImage() {
    _imageFile = null;
    notifyListeners();
  }

  /// This function will return the start and end index of the current tag where the pointer/
  /// cursor is currently placed
  MapEntry<int, int> _getCurrentString() {
    final text = _controller.text;
    final cursorPosition = _controller.selection;
    final cursorIndex = cursorPosition.baseOffset - 1;

    int left = 0;
    int right = 0;

    int temp = cursorIndex;
    while (temp > 0) {
      if (text[temp] == ' ' || text[temp] == '\n') {
        left = temp + 1;
        break;
      }
      temp--;
    }
    if (temp == 0) {
      left = 0;
    }
    temp = cursorIndex;

    while (temp < text.length) {
      if (text[temp] == ' ' || text[temp] == '\n') {
        right = temp;
        break;
      }
      temp++;
    }
    if (temp == text.length) {
      right = text.length;
    }
    return MapEntry(left, right);
  }

  /// This function is used to fetch the hashtags from server based on the prefix.
  /// params:
  /// * [prefix] : prefix of the hashtags
  List<String> _fetchTags(String prefix) {
    // function that will make a request for trending tags and add it to provide user
    return [];
  }

  /// This function is used to add the tag in the post(textField) on tapping the one of the tag from suggestions
  /// and is responsible to reposition the cursor at the end of the string
  /// params:
  /// * [tag] : String value of the tag
  void onTagClick(String tag) {
    final list = _controller.text.split(' ');

    final vals = _getCurrentString();
    final currString = _controller.text.substring(vals.key, vals.value);

    final index = list.indexOf(currString);

    if (index != -1) {
      list[index] = "#$tag";
    } else {
      list.add("#$tag");
    }

    _controller.text = list.join(' ');

    _controller.selection = TextSelection.fromPosition(
      TextPosition(
        offset:
            (index == -1) ? _controller.text.length : vals.key + tag.length + 1,
      ),
    );

    _showHashtagList = false;

    notifyListeners();
  }

  /// This function is responsible to detect weather the tag is being added to the string currently
  /// and is responsible to reposition the cursor at the end of the string
  void handleTextChange(_) {
    final vals = _getCurrentString();
    final currText = _controller.text.substring(vals.key, vals.value);

    if (currText == '#' || currText.startsWith('#')) {
      _fetchedhashtags.clear();
      if (currText.length > 1) {
        print("In here");
        _fetchedhashtags.addAll(_fetchTags(currText.substring(1)));
      }
      _showHashtagList = true;
    } else {
      _showHashtagList = false;
    }

    notifyListeners();
  }
}
