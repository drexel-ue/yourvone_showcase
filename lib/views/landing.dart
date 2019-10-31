import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              height: 150,
            ),
            const SizedBox(height: 10),
            const Text(
              'YourVOne Showcase',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            FlatButton(
              onPressed: () {},
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
