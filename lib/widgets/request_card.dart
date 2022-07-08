import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/models/request/request_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    Key? key,
     this.name,
     this.description,
    // required this.longdesc,
     this.request,
    // required this.isSearchItem,
    // required this.onPressed,
  }) : super(key: key);
  final String? name;
  final String? description;
  // final String longdesc;
  final Request? request;
  // final bool isSearchItem;
  // final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          elevation: 4.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.82,
                decoration: const BoxDecoration(
                  color: Colors.black38,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth! * 0.027,
                      vertical: SizeConfig.screenWidth! * 0.027,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          alignment: Alignment.topRight,
                          child: FloatingActionButton(
                            elevation: 0.0,
                            mini: true,
                            onPressed: () => Navigator.of(context).pop(),
                            backgroundColor: Theme.of(context).primaryColor,
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 40,
                        // ),
                        Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          name!,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.25,
                          child: SingleChildScrollView(
                            child: Text(
                                "Lorem ipsum dolor sit amet. Est repudiandae commodi cum molestias ipsa vel explicabo doloribus sit tenetur nisi sed accusantium fuga ad iusto atque. Ea culpa illum sit Quis sunt est similique dolore.Lorem ipsum dolor sit amet. Est repudiandae commodi cum molestias ipsa vel explicabo doloribus sit tenetur nisi sed accusantium fuga ad iusto atque. Ea culpa illum sit Quis sunt est similique dolore.Lorem ipsum dolor sit amet. Est repudiandae commodi cum molestias ipsa vel explicabo doloribus sit tenetur nisi sed accusantium fuga ad iusto atque. Ea culpa illum sit Quis sunt est similique dolore.Lorem ipsum dolor sit amet. Est repudiandae commodi cum molestias ipsa vel explicabo doloribus sit tenetur nisi sed accusantium fuga ad iusto atque. Ea culpa illum sit Quis sunt est similique dolore.Lorem ipsum dolor sit amet. Est repudiandae commodi cum molestias ipsa vel explicabo doloribus sit tenetur nisi sed accusantium fuga ad iusto atque. Ea culpa illum sit Quis sunt est similique dolore.Lorem ipsum dolor sit amet. Est repudiandae commodi cum molestias ipsa vel explicabo doloribus sit tenetur nisi sed accusantium fuga ad iusto atque. Ea culpa illum sit Quis sunt est similique dolore.",
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Created Date:${DateFormat('dd/MM/yyyy').format(DateTime.now())}",
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        RaisedRoundedButton(
                          key: const Key("AcceptButton"),
                          buttonLabel: "Accept",
                          backgroundColor: Theme.of(context)
                              .inputDecorationTheme
                              .focusedBorder!
                              .borderSide
                              .color,
                          textColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          onTap: () {},
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.0215,
                        ),
                        RaisedRoundedButton(
                          key: const Key("RejectButton"),
                          buttonLabel: "Reject",
                          backgroundColor: Colors.red.shade400,
                          textColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        // margin: const EdgeInsets.all(8),

        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              name!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description!,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
