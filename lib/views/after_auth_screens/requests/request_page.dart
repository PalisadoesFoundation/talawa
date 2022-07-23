import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/request_view_model/request_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/request_card.dart';
import 'package:talawa/widgets/request_search_delegate.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({
    Key? key,
    this.homeModel,
  }) : super(key: key);
  final MainScreenViewModel? homeModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<RequestViewModel>(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
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
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: RequestSearch(
                        requestList: model.requests,
                        requestViewModel: model,
                      ),
                    );
                  },
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
                    "Pending Requests: ${model.requests.length}",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.0215,
                  ),
                  model.requests.isEmpty
                      ? SizedBox(
                          height: SizeConfig.screenHeight! * 0.5,
                          child: Center(
                            child: Text(model.emptyListMessage),
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: SizeConfig.screenWidth! * 0.027,
                            crossAxisSpacing: SizeConfig.screenWidth! * 0.027,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.requests.length,
                          itemBuilder: (BuildContext context, int index) {
                            return RequestCard(
                              request: model.requests[index],
                              requestViewModel: model,
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
