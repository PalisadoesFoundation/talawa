import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/app_localization.dart';

class PaginationIcon extends StatelessWidget {
  const PaginationIcon({
    Key key,
    @required this.result,
    @required this.isNextPageExist,
    @required this.fetchMoreHelper,
  }) : super(key: key);

  final QueryResult result;
  final bool isNextPageExist;
  final Function fetchMoreHelper;

  @override
  Widget build(BuildContext context) {
    return _paginationWidget(context);
  }

  /// WIDGET TO BE DISPLAYED BASED ON THE [PAGINATION] TENDENCY
  Widget _paginationWidget(BuildContext context) {
    if (isNextPageExist) {
      //fetchMoreHelper();
      if (result.loading) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else {
        fetchMoreHelper();
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: GestureDetector(
              onTap: () => fetchMoreHelper(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(
                    Icons.add_circle_outline_outlined,
                    size: 50,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context).translate('Load More'),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        );
      }
    } else {
      return const SizedBox(height: 64);
    }
  }
}
