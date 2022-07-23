import 'package:flutter/material.dart';
import 'package:talawa/models/request/request_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/request_view_model/request_view_model.dart';
import 'package:talawa/widgets/request_card.dart';

class RequestSearch extends SearchDelegate<Request> {
  RequestSearch({
    required this.requestList,
    required this.requestViewModel,
  });
  RequestViewModel requestViewModel;

  final List<Request> requestList;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query.isNotEmpty ? query = '' : close(context, requestList.first);
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, requestList.first);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = requestList.where((request) {
      final requestLowerCase = request.name!.toLowerCase();
      final queryLowerCase = query.toLowerCase();
      return requestLowerCase.startsWith(queryLowerCase);
    }).toList();
    return buildSuggestionsSucess(suggestions);
  }

  Widget buildSuggestionsSucess(List<Request> suggestions) {
    return SingleChildScrollView(
      child: GridView.builder(
        padding: EdgeInsets.all(SizeConfig.screenWidth! * 0.027),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: SizeConfig.screenWidth! * 0.027,
          crossAxisSpacing: SizeConfig.screenWidth! * 0.027,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return RequestCard(
            request: suggestions[index],
            requestViewModel: requestViewModel,
          );
        },
      ),
    );
  }
}
