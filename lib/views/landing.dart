import 'package:flutter/material.dart';
import 'package:yourvone_showcase/utils.dart';

class Landing extends StatelessWidget {
  const Landing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/logo.png',
                height: 150,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'YourVOne Showcase',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, authRoute);
              },
              color: Colors.teal,
              child: const Text(
                'ENTER',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
