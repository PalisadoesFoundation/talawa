import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:graphql/utilities.dart' show multipartFileFrom;
import 'package:talawa/enums/exception_type.dart';
import 'package:talawa/enums/image_from.dart';
import 'package:talawa/enums/viewstate.dart';
import 'package:talawa/services/exception.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/view_models/base_model.dart';
import 'package:talawa/view_models/vm_register.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';

import '../../locator.dart';

class UpdateProfilePageViewModel extends BaseModel {
  List _userDetails = [];
  File _profileImage;
  final Queries _updateProfileQuery = Queries();
  RegisterViewModel _userModel = RegisterViewModel();
  final AuthController _authController = AuthController();
  GraphQLConfiguration graphQLConfiguration = locator<GraphQLConfiguration>();
  BuildContext _viewContext;

  List get userDetails => _userDetails;
  File get userProfileImage => _profileImage;
  RegisterViewModel get userModel => _userModel;

  initialise(List userDetailsFromWidget, BuildContext context) {
    _viewContext = context;
    _userDetails = userDetailsFromWidget;
  }

  setUserFirstName(String firstName) {
    _userModel.firstName = firstName;
  }

  setUserEmail(String email) {
    _userModel.email = email;
  }

  setUserLastname(String lastname) {
    _userModel.firstName = lastname;
  }

  setProfileImage(File file) {
    _profileImage = file;
    notifyListeners();
  }

  //get image from camera and gallery based on the enum passed
  imgFrom({From pickFrom = From.none}) async {
    File pickImageFile;
    if (pickFrom != From.none) {
      final PickedFile selectedImage = await ImagePicker().getImage(
          source: pickFrom == From.camera
              ? ImageSource.camera
              : ImageSource.gallery);
      pickImageFile = File(selectedImage.path);
      _profileImage = pickImageFile;
      notifyListeners();
    }
  }

  //Function called when the user update without the image
  updateProfile() async {
    setState(ViewState.busy);

    final GraphQLClient _client = graphQLConfiguration.authClient();
    QueryResult result;
    Map<String, dynamic> _variables = {};

    if (_profileImage != null) {
      final img = await multipartFileFrom(_profileImage);
      _variables = {
        'file': img,
        "firstName": _userModel.firstName,
        "lastName": _userModel.lastName,
        "email": _userDetails[0]['email'] == _userModel.email
            ? null
            : _userModel.email,
      };
    } else {
      _variables = {
        "firstName": _userModel.firstName,
        "lastName": _userModel.lastName,
        "email": _userDetails[0]['email'] == _userModel.email
            ? null
            : _userModel.email,
      };
    }

    result = await _client.mutate(
      MutationOptions(
        documentNode: gql(_updateProfileQuery.updateUserProfile()),
        variables: _variables,
      ),
    );

    if (result.hasException) {
      final ExceptionType exceptionType = retrieveExceptionType(result);
      if (exceptionType == ExceptionType.accesstokenException) {
        _authController.getNewToken();
        return updateProfile();
      } else {
        setState(ViewState.idle);
        if (result.exception.clientException != null) {
          CustomToast.exceptionToast(
              msg: result.exception.clientException.message);
        } else {
          CustomToast.exceptionToast(
              msg: result.exception.graphqlErrors.first.message);
        }
        return;
      }
    }
    if (!result.loading) {
      setState(ViewState.idle);
      CustomToast.sucessToast(msg: 'Profile Updated');
      Navigator.of(_viewContext).popUntil(ModalRoute.withName("/"));
      pushNewScreen(
        _viewContext,
        screen: const ProfilePage(),
      );
    }
  }
}
