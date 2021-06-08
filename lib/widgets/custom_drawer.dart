import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).iconTheme.color!.withOpacity(0.2),
                  child: Text(
                    "R",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 40),
                  ),
                ),
                accountName: const Text("Rutvik Chandla"),
                accountEmail: const Text("Selected Organization"),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 8.0),
                child: Text(
                  "Switch Organization",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: Text(
                        'Organization $index',
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(
                  Icons.add,
                  size: 30,
                ),
                title: Text("Join new Organization"),
                trailing: Icon(
                  Icons.arrow_forward,
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.switch_right,
                  size: 30,
                ),
                title: Text("Switch Organization"),
                trailing: Icon(
                  Icons.arrow_forward,
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.logout,
                  size: 30,
                ),
                title: Text("Leave Current Organization"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: [
                Text(
                  'from',
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  'PALISADOES',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(letterSpacing: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
