import 'package:flutter/material.dart';

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
        title: Text('Widgets'),
      ),
    );
  }
}
