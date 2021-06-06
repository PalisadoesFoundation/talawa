import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/utils/ui_scaling.dart';

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({Key key, this.isShowingError, this.isTest = false})
      : super(key: key);
  final bool isShowingError;
  final bool isTest;
  @override
  _LoaderWidgetState createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> {
  bool loading = true;
  Timer _timer;
  void loadingFunc() {
    if (mounted) {
      setState(() {
        loading = true;
      });
    }
    _timer = Timer(const Duration(seconds: 10), () {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadingFunc();
    print(1);
  }

  @override
  void didUpdateWidget(LoaderWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    loadingFunc();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return loading && widget.isShowingError == null
        ? const CircularProgressIndicator()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/error.svg',
                width: widget.isTest ? 30 : SizeConfig.screenWidth / 1.3,
              ),
              SizedBox(
                  height:
                      widget.isTest ? 2 : SizeConfig.safeBlockVertical * 3.75),
              Text(
                widget.isShowingError != null
                    ? widget.isShowingError
                        ? AppLocalizations.of(context)
                            .translate("Something went wrong")
                        : AppLocalizations.of(context)
                            .translate("No News Feed to show")
                    : AppLocalizations.of(context)
                        .translate('No data or something went wrong'),
                style: const TextStyle(color: Colors.red),
              ),
            ],
          );
  }
}
