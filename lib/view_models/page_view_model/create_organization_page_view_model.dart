import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/enums/exception_type.dart';
import 'package:talawa/enums/viewstate.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/services/exception.dart';
import 'package:talawa/services/image_service.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/view_models/base_model.dart';
import 'package:graphql/utilities.dart' show multipartFileFrom;
import 'package:talawa/views/pages/home_page.dart';

class CreateOrganizationViewModel extends BaseModel {
  //defining the Organization creation state
  BuildContext _context;
  final _orgNameController = TextEditingController();
  final _orgDescController = TextEditingController();
  final _orgMemberDescController = TextEditingController();
  final Queries _queries = Queries();
  bool _progressBarState = false;
  bool _isFromProfile = false;

  int _radioValue = -1;
  int _radioValue1 = -1;
  bool _isPublic = true;
  bool _isVisible = true;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  final AuthController _authController = AuthController();
  File _image;

  bool get progressBarState => _progressBarState;
  TextEditingController get orgNameController => _orgNameController;
  TextEditingController get orgDescController => _orgDescController;
  TextEditingController get orgMemberDescController => _orgMemberDescController;
  int get radioValue => _radioValue;
  int get radioValue1 => _radioValue1;
  File get image => _image;

  void setIsPublic(bool val) {
    _isPublic = val;
    notifyListeners();
  }

  void setIsVisible(bool val) {
    _isVisible = val;
    notifyListeners();
  }

  void setRadioValue(int val) {
    _radioValue = val;
    notifyListeners();
  }

  void setRadioValue1(int val) {
    _radioValue1 = val;
    notifyListeners();
  }

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
    notifyListeners();
  }

  void initialise(BuildContext context, bool isFromProfile) {
    _context = context;
    _isFromProfile = isFromProfile;
  }

  createOrg(bool imgPresent, BuildContext context) async {
    //this is the function which will be called when the organization is created
    setState(ViewState.busy);
    final GraphQLClient _client = graphQLConfiguration.authClient();
    _orgNameController.text =
        _orgNameController.text.trim().replaceAll('\n', ' ');
    _orgDescController.text =
        _orgDescController.text.trim().replaceAll('\n', ' ');
    _orgMemberDescController.text =
        _orgMemberDescController.text.trim().replaceAll('\n', ' ');

    QueryResult result;

    if (imgPresent) {
      final img = await multipartFileFrom(_image);
      result = await _client.mutate(MutationOptions(
        documentNode: gql(_queries.createOrg(
          _orgNameController.text,
          _orgDescController.text,
          _orgMemberDescController.text,
          isPublic: _isPublic,
          visibleInSearch: _isVisible,
        )),
        variables: {
          'file': img,
        },
      ));
    } else {
      result = await _client.mutate(MutationOptions(
        documentNode: gql(_queries.createOrgWithoutImg(
          _orgNameController.text,
          _orgDescController.text,
          _orgMemberDescController.text,
          isPublic: _isPublic,
          visibleInSearch: _isVisible,
        )),
      ));
    }
    if (result.hasException) {
      print(result.exception);
      final ExceptionType exceptionType = retrieveExceptionType(result);
      if (exceptionType == ExceptionType.accesstokenException) {
        _authController.getNewToken();
        return createOrg(imgPresent, context);
      } else {
        setState(ViewState.idle);
        CustomToast.exceptionToast(msg: result.exception.toString());
      }
      return;
    }

    if (!result.loading) {
      setState(ViewState.idle);
      CustomToast.sucessToast(
          msg: AppLocalizations.of(context).translate("Success!"));
      print(result.data);

      if (_isFromProfile) {
        Navigator.pop(_context);
        Navigator.pop(_context);
      } else {
        Navigator.of(_context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(
                  openPageIndex: 4,
                )));
      }
    }
  }

  getImageFromCamera() async {
    final File capturedImage = await ImageService.fetchImageFromCamera();
    if (capturedImage != null) {
      final File croppedImage = await ImageService.cropImage(capturedImage);
      if (croppedImage != null) {
        _image = croppedImage;
        notifyListeners();
      }
    }
  }

  getImageFromGallery() async {
    final File capturedImage = await ImageService.fetchImageFromGallery();
    if (capturedImage != null) {
      final File croppedImage = await ImageService.cropImage(capturedImage);
      if (croppedImage != null) {
        _image = croppedImage;
        notifyListeners();
      }
    }
  }
}
