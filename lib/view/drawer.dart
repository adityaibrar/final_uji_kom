import 'package:final_uji_kom/services/auth-services.dart';
import 'package:final_uji_kom/view/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_uji_kom/shared/shared.dart';

class Drawwer extends StatefulWidget {
  const Drawwer({Key? key}) : super(key: key);

  @override
  State<Drawwer> createState() => _DrawwerState();
}

class _DrawwerState extends State<Drawwer> {
  Firebase_Auth Auth = Firebase_Auth();

  void logout() async {
    await Auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("${user?.displayName}"),
            accountEmail: Text("${user?.email}"),
            decoration: BoxDecoration(color: primaryColor),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile())),
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: () => logout(),
          ),
        ],
      ),
    );
  }
}
