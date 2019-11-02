import 'package:flutter/material.dart';
import 'package:yourvone_showcase/auth_services/firebase_auth_service.dart';
import 'package:yourvone_showcase/utils.dart';
import 'package:yourvone_showcase/widgets/nexus/navigation_tile.dart';

class Nexus extends StatelessWidget {
  Nexus({Key key}) : super(key: key);

  final _auth = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Hero(
          tag: 'logo',
          child: Image.asset('assets/full_logo.png'),
        ),
        title: const Text('Widgets'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pushNamedAndRemoveUntil(
                context,
                authRoute,
                (Route route) => false,
              );
            },
            child: const Text('SIGN OUT'),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          NavigationTile(
            leading: Icon(Icons.message),
            route: chatRoute,
            title: 'Chat',
          ),
          NavigationTile(
            leading: Icon(Icons.notifications),
            route: chatRoute,
            title: 'Push Notifications',
          ),
        ],
      ),
    );
  }
}
