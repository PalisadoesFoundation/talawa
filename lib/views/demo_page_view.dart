import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// PageView is a scrollable list that works page by page.
///
/// DemoPageView is demo PageView of Talawa Mobile App.
class DemoPageView extends StatelessWidget {
  const DemoPageView({required Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<DemoViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title:
              Text(AppLocalizations.of(context)!.strictTranslate('Demo Page')),
        ),
        body: Container(
          child: Text(model.title),
        ),
      ),
    );
  }
}

/// ViewModel uses property-based data binding to establish a connection.
///
/// between the ViewModel and the View, and drives the View changes
/// through the ViewModel. DemoViewModel is the ViewModel for DemoPageView.
class DemoViewModel extends BaseModel {
  /// Demo title to be used.
  final String _title = "Title from the viewMode GSoC branch";

  /// Getter function of the title.
  ///
  /// params:
  /// None
  /// returns:
  /// * `String`: title  of the model
  String get title => _title;
}
