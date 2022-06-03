import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            Expanded(child: buildMenuItems(context)),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
    padding: EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
        child: Row(
          children: [
            Image.asset('assets/images/meeting.png',width: 50,),
            SizedBox(width: 20,),
            Column(
              children: [
                Text("savagenur"),
                Text(
                  "Profile",
                  style: TextStyle(color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              PopupMenuDivider(),
              ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
              ),
              PopupMenuDivider(),
              Spacer(),
              PopupMenuDivider(),

              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout_sharp),
              )
            ],
          ),
        ),
      );
}