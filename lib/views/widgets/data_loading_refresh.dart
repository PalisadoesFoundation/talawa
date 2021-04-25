import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talawa/utils/uidata.dart';

class LoadAndRefresh extends StatelessWidget {
  const LoadAndRefresh({Key key, this.loading, this.error = ' ', this.refresh})
      : super(key: key);
  final bool loading;
  final String error;
  final Function refresh;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const CircularProgressIndicator()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              error == null
                  ? SvgPicture.asset(
                      'assets/images/error.svg',
                      width: MediaQuery.of(context).size.width / 1.3,
                    )
                  : const SizedBox(),
              const SizedBox(height: 30),
              Text(
                error ?? 'Something went wrong',
                style: TextStyle(
                    color: error == null ? Colors.red : UIData.primaryColor),
              ),
              ElevatedButton(
                onPressed: () {
                  refresh();
                },
                child: const Text('Refresh'),
              )
            ],
          );
  }
}
