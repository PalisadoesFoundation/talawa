import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/model/token.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/home_page.dart';
import 'package:talawa/views/pages/organization/join_organization_view.dart';
import 'package:graphql/utilities.dart' show multipartFileFrom;

class SignupLoginController with ChangeNotifier {
  final Preferences _pref = Preferences();
  final Queries _query = Queries();
  File profileImage;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  File get getImage {
    return profileImage;
  }

  Future<void> setProfileImage(File image) async {
    profileImage = image;
    notifyListeners();
  }

  void deleteImage() {
    profileImage = null;
    notifyListeners();
  }

  Future<void> registerNewUser({
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
    @required BuildContext context,
    @required Function exceptionState,
    @required Function successState,
  }) async {
    profileImage != null
        ? await registerUser(
            context: context,
            image: profileImage,
            email: email,
            firstName: firstName,
            lastName: lastName,
            password: password,
            exceptionState: exceptionState,
            successState: successState,
          )
        : await registerUserWithoutImg(
            context: context,
            email: email,
            firstName: firstName,
            lastName: lastName,
            password: password,
            exceptionState: exceptionState,
            successState: successState,
          );
  }

  //function called when the user is called without the image
  Future<void> registerUserWithoutImg({
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
    @required BuildContext context,
    @required Function exceptionState,
    @required Function successState,
  }) async {
    final GraphQLClient _client = graphQLConfiguration.clientToQuery();
    final QueryResult result = await _client.mutate(
      MutationOptions(
        documentNode: gql(
          _query.registerUserWithoutImg(
            firstName,
            lastName,
            email,
            password,
          ),
        ),
      ),
    );
    if (result.hasException) {
      print(result.exception);
      exceptionState();
      CustomToast.exceptionToast(
        msg: result.exception.toString(),
      );
    } else if (!result.hasException && !result.loading) {
      successState();

      final String userFName =
          result.data['signUp']['user']['firstName'].toString();
      await _pref.saveUserFName(
        userFName,
      );
      final String userLName =
          result.data['signUp']['user']['lastName'].toString();
      await _pref.saveUserLName(
        userLName,
      );
      final Token accessToken = Token(
        tokenString: result.data['signUp']['accessToken'].toString(),
      );
      await _pref.saveToken(
        accessToken,
      );
      final Token refreshToken = Token(
        tokenString: result.data['signUp']['refreshToken'].toString(),
      );
      await _pref.saveRefreshToken(
        refreshToken,
      );
      final String currentUserId =
          result.data['signUp']['user']['_id'].toString();
      await _pref.saveUserId(
        currentUserId,
      );

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const JoinOrganization(
              fromProfile: false,
            ),
          ),
          (route) => false);
    }
  }

  //function for registering user which gets called when sign up is press
  Future<void> registerUser({
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
    @required BuildContext context,
    @required Function exceptionState,
    @required Function successState,
    @required File image,
  }) async {
    final GraphQLClient _client = graphQLConfiguration.clientToQuery();
    final img = await multipartFileFrom(image);
    final QueryResult result = await _client.mutate(
      MutationOptions(
        documentNode: gql(
          _query.registerUser(
            firstName,
            lastName,
            email,
            password,
          ),
        ),
        variables: {
          'file': img,
        },
      ),
    );
    if (result.hasException) {
      debugPrint(result.exception.toString());
      exceptionState();

      CustomToast.exceptionToast(msg: result.hasException.toString());
    } else if (!result.hasException && !result.loading) {
      successState();

      final String userFName =
          result.data['signUp']['user']['firstName'].toString();
      await _pref.saveUserFName(
        userFName,
      );
      final String userLName =
          result.data['signUp']['user']['lastName'].toString();
      await _pref.saveUserLName(
        userLName,
      );

      final Token accessToken = Token(
        tokenString: result.data['signUp']['accessToken'].toString(),
      );
      await _pref.saveToken(
        accessToken,
      );
      final Token refreshToken = Token(
        tokenString: result.data['signUp']['refreshToken'].toString(),
      );
      await _pref.saveRefreshToken(
        refreshToken,
      );
      final String currentUserId =
          result.data['signUp']['user']['_id'].toString();
      await _pref.saveUserId(
        currentUserId,
      );
      //Navigate user to join organization screen
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const JoinOrganization(fromProfile: false)),
          (route) => false);
    }
  }

  //function for login user which gets called when sign in is press
  Future loginUser({
    @required String email,
    @required String password,
    @required BuildContext context,
    @required Function exceptionState,
    @required Function successState,
  }) async {
    final GraphQLClient _client = graphQLConfiguration.clientToQuery();
    final QueryResult result = await _client.mutate(
      MutationOptions(
        documentNode: gql(
          _query.loginUser(
            email,
            password,
          ),
        ),
      ),
    );
    if (result.hasException) {
      print(result.exception);
      exceptionState();

      CustomToast.exceptionToast(
        msg: result.exception.toString(),
      );
    } else if (!result.hasException && !result.loading) {
      successState();

      CustomToast.sucessToast(msg: "All Set!");
      final Token accessToken = Token(
        tokenString: result.data['login']['accessToken'].toString(),
      );
      await _pref.saveToken(accessToken);
      final Token refreshToken = Token(
        tokenString: result.data['login']['refreshToken'].toString(),
      );
      await _pref.saveRefreshToken(refreshToken);
      final String currentUserId =
          result.data['login']['user']['_id'].toString();
      await _pref.saveUserId(currentUserId);
      final String userFName =
          result.data['login']['user']['firstName'].toString();
      await _pref.saveUserFName(userFName);
      final String userLName =
          result.data['login']['user']['lastName'].toString();
      await _pref.saveUserLName(userLName);

      final List organisations =
          result.data['login']['user']['joinedOrganizations'] as List;
      if (organisations.isEmpty) {
        //skip the steps below
      } else {
        //execute the steps below
        final String currentOrgId = result.data['login']['user']
                ['joinedOrganizations'][0]['_id']
            .toString();
        await _pref.saveCurrentOrgId(
          currentOrgId,
        );

        final String currentOrgImgSrc = result.data['login']['user']
                ['joinedOrganizations'][0]['image']
            .toString();
        await _pref.saveCurrentOrgImgSrc(
          currentOrgImgSrc,
        );

        final String currentOrgName = result.data['login']['user']
                ['joinedOrganizations'][0]['name']
            .toString();
        await _pref.saveCurrentOrgName(
          currentOrgName,
        );
      }
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const HomePage(openPageIndex: 0)),
        (route) => false,
      );
    }
  }
}
