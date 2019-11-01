import 'package:flutter/material.dart';
import 'package:yourvone_showcase/utils.dart';
import 'package:yourvone_showcase/widgets/nexus/navigation_tile.dart';

class Nexus extends StatelessWidget {
  const Nexus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Hero(
          tag: 'logo',
          child: Image.asset('assets/full_logo.png'),
        ),
        title: const Text('Widgets'),
      ),
      body: ListView(
        children: <Widget>[
          NavigationTile(
            leading: Icon(Icons.message),
            route: loginRoute,
            title: 'Chat',
          ),
        ],
      ),
    );
  }
}
