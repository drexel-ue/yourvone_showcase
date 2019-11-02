import 'package:flutter/material.dart';

class PushNotis extends StatelessWidget {
  const PushNotis({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Hero(
          tag: 'logo',
          child: Image.asset('assets/full_logo.png'),
        ),
        title: const Text('Push Notifications'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.notifications_off),
              title: Text('Enable Push Notifications'),
              trailing: Switch.adaptive(
                value: false,
                onChanged: (bool value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
