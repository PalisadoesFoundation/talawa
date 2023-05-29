import 'package:flutter/material.dart';
import 'package:talawa/apptheme.dart';

class SendAccessRequest extends StatelessWidget {
  const SendAccessRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   // title of the header.
        //   title: Text(
        //     AppLocalizations.of(context)!
        //         .strictTranslate('Request Access'),
        //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
        //       fontWeight: FontWeight.w600,
        //       fontSize: 20,
        //     ),
        //   ),
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 100, 0),
              child: Image.asset('assets/images/Group 8948.png'),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: Text(
                    "You need access",
                    style: AppTheme.title.copyWith(color: AppTheme.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "Request access, or switch to an account with access",),
                ),
                TextField(
                  style: const TextStyle(color: AppTheme.blackPrimary),
                  minLines: 15,
                  maxLines: 20,
                  decoration: InputDecoration(
                    constraints: const BoxConstraints(maxWidth: 400, minWidth: 100),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        width: 3, //<-- SEE HERE
                        color: Colors.greenAccent,
                      ),
                    ),
                    hintText: "Message (optional)",
                    hintStyle: const TextStyle(color: AppTheme.blackSecondary),
                    filled: true,
                    fillColor: AppTheme.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: TextButton(
                    onPressed: () {},
                    style:
                        TextButton.styleFrom(backgroundColor: AppTheme.green),
                    child: const Text(
                      "Request Access",
                      style: TextStyle(
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
