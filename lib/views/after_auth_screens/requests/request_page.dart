import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/request_card.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({
    Key? key,
    // required this.model,
  }) : super(key: key);
  // final RequestModel? model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color,
        ),
        title: Text(
          "Requests",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.screenWidth! * 0.027,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, size: 20),
              color: Theme.of(context).iconTheme.color,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * 0.027,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.0215,
              ),
              Text(
                "Pending Requests: 20",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.0215,
              ),
              GridView.count(
                mainAxisSpacing: SizeConfig.screenWidth! * 0.027,
                crossAxisSpacing: SizeConfig.screenWidth! * 0.027,
                shrinkWrap: true,
                crossAxisCount: 2,
                padding: EdgeInsets.zero,
                children: [
                  const RequestCard(
                    name: "First",
                    description: "First Description",
                  ),
                  const RequestCard(
                    name: "Second",
                    description: "Second Description",
                  ),
                  const RequestCard(
                    name: "Third",
                    description: "Third Description",
                  ),
                  const RequestCard(
                    name: "Fourth",
                    description: "Fourth Description",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
