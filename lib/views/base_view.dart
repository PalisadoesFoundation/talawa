//the flutter material package is called
import 'package:flutter/material.dart';

//Pages are imported here
import 'package:provider/provider.dart';
import 'package:talawa/locator.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  const BaseView({@required this.builder, this.onModelReady});
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final Function(T) onModelReady;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
