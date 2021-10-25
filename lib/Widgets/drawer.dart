import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Drawer(
        elevation: 0,
        child: Column(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  accountName: Text('User-Name'),
                  accountEmail: Text('Example@gmail.com'),
                  currentAccountPicture: CircleAvatar(),
                )
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home',textScaleFactor: 1.2,),
            ),
            
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled),
              title: Text('Profile',textScaleFactor: 1.2,),
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Mail',textScaleFactor: 1.2,),
            ),
            Divider(),
            Spacer(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
            )
            

          ],
        ),
      ),
    );
  }
}
