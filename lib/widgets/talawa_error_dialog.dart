import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TalawaErrorWidget extends StatelessWidget {
  const TalawaErrorWidget(this.errorMessage, {Key? key}) : super(key: key);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AlertDialog(
        title: const Text("Error", style: TextStyle(color: Colors.red)),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text(errorMessage)],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

// void showTalawaErrorDialog(String errorMessage) {
//   showDialog(
//     context: navigatorKey.currentContext!,
//     barrierColor: Colors.transparent,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return SizedBox(
//         child: AlertDialog(
//           title: const Text(
//             "Error",
//             style: TextStyle(color: Colors.red),
//           ),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[Text(errorMessage)],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Close'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
