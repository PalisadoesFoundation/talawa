import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// ProfilePageViewModel class helps to interact with model to serve data and react to user's input in Profile Page view.
///
/// Methods include:
/// * `logout`
class ProfilePageViewModel extends BaseModel {
  // Services
  final _userConfig = locator<UserConfig>();
  final _navigationService = locator<NavigationService>();

  /// GlobalKey for scaffoldKey.
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// FocusNode for donationField.
  final FocusNode donationField = FocusNode();

  /// Text Controller for donation Amount.
  TextEditingController donationAmount = TextEditingController();

  /// Hive Box of user.
  late final Box<User> user;

  /// Hive Box of url.
  late final Box<dynamic> url;

  /// Hive Box of organisation.
  late final Box<OrgInfo> organisation;

  /// Holds Current Organization.
  late OrgInfo currentOrg;

  /// Holds Current user.
  late User currentUser;

  /// Size of Bottom Sheet Height.
  double bottomSheetHeight = SizeConfig.screenHeight! * 0.68;

  /// donationCurrency.
  String donationCurrency = "USD";

  /// Currency Symbol.
  String donationCurrencySymbol = "\$";

  /// denomination.
  final List<String> denomination = ['1', '5', '10'];

  /// First function to initialize the viewmodel.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialize() {
    setState(ViewState.busy);
    currentOrg = _userConfig.currentOrg;
    currentUser = _userConfig.currentUser;
    setState(ViewState.idle);
  }

  /// This method changes the currency of the user for donation purpose.
  ///
  /// **params**:
  /// * `context`: BuildContext of the widget
  /// * `setter`: Setter Function
  ///
  /// **returns**:
  ///   None
  void changeCurrency(
    BuildContext context,
    void Function(void Function()) setter,
  ) {
    showCurrencyPicker(
      context: context,
      currencyFilter: supportedCurrencies,
      onSelect: (Currency currency) {
        setter(() {
          donationCurrency = currency.code;
          donationCurrencySymbol = currency.symbol;
        });
      },
    );
  }

  /// This widget returns the button for social media sharing option.
  ///
  /// **params**:
  /// * `icon`: This is Widget type with icon details.
  /// * `onTap`: This is Function which invoke on tap.
  ///
  /// **returns**:
  /// * `Widget`: Icon Button
  Widget iconButton(Widget icon, void Function() onTap) {
    return Stack(
      children: [
        IconButton(
          key: const Key('iconbtn1'),
          onPressed: () {
            print('tapped');
            onTap();
          },
          icon: icon,
        ),
      ],
    );
  }

  /// This widget returns button for domination.
  ///
  /// **params**:
  /// * `amount`: donation Amount.
  /// * `context`: BuildContext.
  /// * `setter`: `Function` type, which on tap set the amount to `donationAmount`.
  ///
  /// **returns**:
  /// * `Widget`: Icon Button
  Widget dominationButton(
    String amount,
    BuildContext context,
    void Function(void Function()) setter,
  ) {
    return InkWell(
      key: Key('domBtn_$amount'),
      onTap: () {
        setter(() {
          donationAmount.text = amount;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight! * 0.02,
          horizontal: SizeConfig.screenWidth! * 0.075,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: donationAmount.text == amount
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primary,
        ),
        child: Text(
          '$donationCurrencySymbol $amount',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }

  /// This widget returns button for domination.
  ///
  /// **params**:
  /// * `setter`: SetState holder.
  ///
  /// **returns**:
  ///   None
  void attachListener(void Function(void Function()) setter) {
    donationField.addListener(() {
      if (donationField.hasFocus) {
        setter(() {
          bottomSheetHeight = SizeConfig.screenHeight! * 0.8725;
        });
      } else {
        Future.delayed(const Duration(milliseconds: 300), () {
          {
            setter(() {
              bottomSheetHeight = SizeConfig.screenHeight! * 0.68;
            });
          }
        });
      }
    });
  }

  /// pop the route from `navigationService`.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void popBottomSheet() {
    _navigationService.pop();
  }

  /// to update the bottom sheet height.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void updateSheetHeight() {
    bottomSheetHeight = SizeConfig.screenHeight! * 0.65;
    notifyListeners();
  }

  /// show message on Snack Bar.
  ///
  /// **params**:
  /// * `message`: String Message to show on snackbar
  ///
  /// **returns**:
  ///   None
  void showSnackBar(String message) {
    _navigationService.showTalawaErrorDialog(message, MessageType.error);
  }
}
