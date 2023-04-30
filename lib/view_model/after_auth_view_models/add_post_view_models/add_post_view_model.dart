import 'dart:io';
import 'package:flutter/material.dart';
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

import 'package:talawa/widgets/post_text_field.dart';

/// This class is used to function like a tuple.
class StringRange {
  StringRange(this.left, this.right);

  /// This variable is for the first index of the String.
  final int left;

  /// This variable is for the second index of the String.
  final int right;
}

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

  final PostTextController controller = PostTextController();
  final List<String> _fetchedhashtags = [];
  bool _showHashtagList = false;

  /// Get Method for Post Controller.
  PostTextController get postController => controller;

  /// Get Method for getting Hashtag List.
  List<String> get fetchedhashtags => [..._fetchedhashtags];

  /// Get Method for checking if to show Hashtag List or not.
  bool get showHashtagList => _showHashtagList;

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
            "text": controller.text,
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

  /// Getting the Current String.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `StringRange`: Getting the String Range with two indexes.
  StringRange getCurrentString() {
    final text = controller.text;
    final cursorPosition = controller.selection;
    final cursorIndex = cursorPosition.extentOffset - 1;
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
    return StringRange(left, right);
  }

  /// Function for getting the tags.
  ///
  /// **params**:
  /// * `prefix`: getting what the user has typed.
  ///
  /// **returns**:
  /// * `List<String>`: Getting the list of tags.
  List<String> fetchTags(String prefix) {
    final tags = [
      "CodeNewbie",
      "ProgrammingHumor",
      "DevCommunity",
      "StackOverflow",
      "Github",
      "CodeChallenge",
      "CodeReview",
      "TechTalk",
      "CleanCode",
      "DeveloperLife",
      "WebDevelopment",
      "SoftwareEngineering",
      "OpenSource",
      "JavaScript",
      "Flutter",
      "Flask",
      "Java",
      "CSharp",
      "PHP",
      "ReactJS",
      "AngularJS",
      "NodeJS",
      "VueJS",
      "TypeScript",
      "GraphQL",
      "DevOps",
      "AgileMethodology",
      "MobileDevs",
      "ContinuousIntegration",
      "Git",
      "CodeQuality",
      "BackendDevelopment",
      "FrontendDevelopment",
      "MobileDevelopment",
      "TestAutomation",
      "SoftwareArchitecture",
      "Microservices",
      "Serverless",
      "CloudComputing",
      "MachineLearning",
      "ArtificialIntelligence",
      "DataScience",
      "BigData",
      "Blockchain",
      "Cryptocurrency",
      "Cybersecurity",
      "Hackathon",
    ];

    return tags
        .where((element) => element.toLowerCase().startsWith(prefix))
        .toList();
  }

  /// Function to be called when a particular tag is clickex.
  ///
  /// **params**:
  /// * `tag`: the tag which is clicked.
  ///
  /// **returns**:
  ///   None
  void onTagClick(String tag) {
    final list = controller.text.split(' ');

    final currString = controller.text
        .substring(getCurrentString().left, getCurrentString().right);

    final index = list.indexOf(currString);

    if (index != -1) {
      list[index] = "#$tag";
    } else {
      list.add("#$tag");
    }

    controller.text = list.join(' ');

    controller.selection = TextSelection.fromPosition(
      TextPosition(
        offset: (index == -1)
            ? controller.text.length
            : getCurrentString().left + tag.length + 1,
      ),
    );

    _showHashtagList = false;

    notifyListeners();
  }

  /// Funciton for handling the text change.
  ///
  /// **params**:
  /// * `_`: to be ignored
  ///
  /// **returns**:
  ///   None
  void handleTextChange(_) {
    final currText = controller.text
        .substring(getCurrentString().left, getCurrentString().right);

    if (currText == '#' || currText.startsWith('#')) {
      _fetchedhashtags.clear();
      if (currText.length > 1) {
        _fetchedhashtags.addAll(fetchTags(currText.substring(1)));
      }
      _showHashtagList = true;
    } else {
      _showHashtagList = false;
    }

    notifyListeners();
  }
}
