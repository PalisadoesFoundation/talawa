import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/views/pages/organization/join_organization_view.dart';

class Loading extends StatefulWidget {
  const Loading(
      {Key key,
      this.isCurrentOrgNull = false,
      this.isNetworkError,
      this.emptyContentIcon,
      this.emptyContentMsg,
      this.refreshFunction})
      : super(key: key);

  final bool isCurrentOrgNull;
  final bool isNetworkError;
  final IconData emptyContentIcon;
  final String emptyContentMsg;
  final Future Function() refreshFunction;
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool loading = true;
  Timer _timer;
  void loadingFunc() {
    if (mounted) {
      setState(() {
        loading = true;
      });
    }

    _timer = Timer(const Duration(seconds: 5), () {
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
    debugPrint("1");
  }

  @override
  void didUpdateWidget(
    Loading oldWidget,
  ) {
    super.didUpdateWidget(
      oldWidget,
    );
    loadingFunc();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  refreshLoading() async {
    setState(() {
      loading = true;
    });
    await widget.refreshFunction();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading && widget.isNetworkError == null
        ? const CircularProgressIndicator()
        : widget.isCurrentOrgNull
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)
                        .translate('No organization found!'),
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 2.5,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 3.75),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const JoinOrganization(
                                    fromProfile: false,
                                  )),
                          (route) => false);
                    },
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('Join Organization!'),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            : ListView(
                shrinkWrap: true,
                children: [
                  widget.isNetworkError == false
                      ? Icon(
                          widget.emptyContentIcon,
                          size: SizeConfig.screenWidth / 5,
                          color: Colors.orange,
                        )
                      : SvgPicture.asset(
                          'assets/images/error.svg',
                          width: SizeConfig.screenWidth / 1.3,
                        ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 3.75),
                  widget.isNetworkError != null
                      ? widget.isNetworkError
                          ? showErrorText("Something went wrong", context)
                          : showEmptyContentText(widget.emptyContentMsg)
                      : showErrorText(
                          'No data or something went wrong', context),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 10,
                  ),
                  Container(
                    height: SizeConfig.safeBlockVertical * 7,
                    width: SizeConfig.safeBlockVertical * 14,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment(-1.0, -4.0),
                            end: Alignment(1.0, 4.0),
                            colors: [
                              Color(0xFFd9d9d9),
                              Color(0xFFffffff),
                            ]),
                        borderRadius: BorderRadius.all(Radius.circular(
                            SizeConfig.safeBlockVertical * 3.2)),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xFFd9d9d9),
                              offset: Offset(5.0, 5.0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0),
                          BoxShadow(
                              color: Color(0xFFffffff),
                              offset: Offset(-5.0, -5.0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0),
                        ]),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: refreshLoading,
                        borderRadius: BorderRadius.all(Radius.circular(
                            SizeConfig.safeBlockVertical * 3.2)),
                        child: Center(
                          child: Text(
                            loading
                                ? '${AppLocalizations.of(context).translate("Refreshing")}...'
                                : AppLocalizations.of(context)
                                    .translate('Refresh'),
                            style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
  }
}

Widget showErrorText(String msg, BuildContext context) {
  return Text(
    AppLocalizations.of(context).translate(msg),
    style: const TextStyle(color: Colors.red),
  );
}

Widget showEmptyContentText(String msg) {
  return Text(
    msg,
    style: TextStyle(
      fontSize: SizeConfig.safeBlockVertical * 2.5,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),
  );
}
