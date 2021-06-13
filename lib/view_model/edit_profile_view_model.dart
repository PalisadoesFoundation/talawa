import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/view_model/base_view_model.dart';

class EditProfilePageViewModel extends BaseModel {
  final user = Hive.box<User>('currentUser');
  final org = Hive.box<OrgInfo>('currentOrg');
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  final databaseService = locator<DataBaseMutationFunctions>();

  initialize() {}
}
