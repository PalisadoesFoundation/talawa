//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//pages are called here
import 'package:provider/provider.dart';
import 'package:talawa/services/groups_provider.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/services/preferences.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/views/pages/chat/chat.dart';
import 'package:talawa/views/widgets/loading.dart';

class Groups extends StatefulWidget {
  const Groups({Key key}) : super(key: key);

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  FToast fToast;

  /// Get the list of posts
  Future<void> getEventsList(BuildContext context) async {
    await Provider.of<GroupsProvider>(context, listen: false).getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('GROUPS_APP_BAR'),
        title: const Text(
          'Chats',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: getEventsList(context),
        builder: (BuildContext context, AsyncSnapshot<void> snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return (Provider.of<GroupsProvider>(context).isCurrOrgIdNull || 
            Provider.of<GroupsProvider>(context).isEventsEmpty)
          ? Center(
            child: Loading(
              key: UniqueKey(),
              isNetworkError: Provider.of<GroupsProvider>(context).isErrorOccurred,
              emptyContentMsg: 'Register in an Event to start chatting!',
              refreshFunction: () => getEventsList(context),
            ),
          )
          //Refresh indicator for calling getEvents
          : RefreshIndicator(
              onRefresh: () async {
                try {
                  await getEventsList(context);
                } catch (e) {
                  _exceptionToast(e.toString());
                }
              },
              //List of chat groups
              child: ListView.builder(
                  itemCount: Provider.of<GroupsProvider>(context).displayedEvents.length,
                  itemBuilder: (context, index) {
                    final displayedEvents = Provider.of<GroupsProvider>(context).displayedEvents;
                    final String groupName =
                        '${displayedEvents[index]['title']}';
                    final String _imgSrc = displayedEvents[index]
                        ['organization']['image'] as String;
                    return Card(
                      child: ListTile(
                        title: Text(groupName),
                        leading: CircleAvatar(
                          backgroundColor: UIData.secondaryColor,
                          child: _imgSrc == null
                              ? Image.asset(UIData.talawaLogo)
                              : NetworkImage(
                                  Provider.of<GraphQLConfiguration>(context)
                                          .displayImgRoute +
                                      _imgSrc) as Widget,
                        ),
                        trailing: const Icon(Icons.arrow_right),
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: Chat(
                              groupName: groupName,
                            ),
                          );
                        },
                      ),
                    );
                  }),
            );
          }
      ),
    );
  }

  //function to show exceptions
  _exceptionToast(String msg) {
    final Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(msg),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 1),
    );
  }
}
