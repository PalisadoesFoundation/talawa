import 'dart:io';

import 'package:flutter/material.dart';
import 'package:talawa/widgets/post_text_field.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/post_queries.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// AddPostViewModel class have different functions that are used.
///
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
  final TextEditingController _titleController = TextEditingController();

  /// The image file that is to be uploaded.
  ///
  /// params:
  /// None
  /// returns:
  /// * `File?`: The image file
  File? get imageFile => _imageFile;

  /// The Username.
  ///
  /// params:
  /// None
  /// returns:
  /// * `String`: The username of the currentUser
  String get userName => _currentUser.firstName! + _currentUser.lastName!;

  /// The organisation name.
  ///
  /// params:
  /// None
  /// returns:
  /// * `String`: The organisation name
  String get orgName => _selectedOrg.name!;

  /// Post body text controller.
  ///
  /// params:
  /// None
  /// returns:
  /// * `TextEditingController`: The main text controller of the post body
  PostTextController get controller => _controller;
  List<String> get fetchedhashtags => [..._fetchedhashtags];
  bool get showHashtagList => _showHashtagList;

  /// Post title text controller.
  ///
  /// params:
  /// None
  /// returns:
  /// * `TextEditingController`: The text controller of the title body
  TextEditingController get titleController => _titleController;
  late DataBaseMutationFunctions _dbFunctions;

  /// This function is usedto do initialisation of stuff in the view model.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialise() {
    _currentUser = locator<UserConfig>().currentUser;
    _navigationService = locator<NavigationService>();
    _selectedOrg = locator<UserConfig>().currentOrg;
    _imageFile = null;
    _multiMediaPickerService = locator<MultiMediaPickerService>();
    _dbFunctions = locator<DataBaseMutationFunctions>();
    _showHashtagList = false;
  }

  /// This function is used to get the image from gallery.
  ///
  /// The function uses the `_multiMediaPickerService` services.
  ///
  /// **params**:
  /// * `camera`: if true then open camera for image, else open gallery to select image.
  ///
  /// **returns**:
  /// * `Future<void>`: Getting image from gallery returns future
  Future<void> getImageFromGallery({bool camera = false}) async {
    final image =
        await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
    if (image != null) {
      _imageFile = image;
      _navigationService.showTalawaErrorSnackBar(
        "Image is added",
        MessageType.info,
      );
      notifyListeners();
    }
  }

  /// This function uploads the post finally, and navigate the success message or error message in Snack Bar.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<void>`: Uploading post by contacting queries
  Future<void> uploadPost() async {
    // {TODO: }
    if (_imageFile == null) {
      try {
        await _dbFunctions.gqlAuthMutation(
          PostQueries().uploadPost(),
          variables: {
            "text": _controller.text,
            "organizationId": _selectedOrg.id,
            "title": _titleController.text
          },
        );
        _navigationService.showTalawaErrorSnackBar(
          "Post is uploaded",
          MessageType.info,
        );
      } on Exception catch (_) {
        _navigationService.showTalawaErrorSnackBar(
          "Something went wrong",
          MessageType.error,
        );
      }
    }
    removeImage();
    _controller.text = "";
    _titleController.text = "";
    notifyListeners();
  }

  /// This function removes the image selected.
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
  /// This function will return the start and end index of the current tag where the pointer/
  /// 
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
  /// 
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
