import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          curve: Curves.easeInOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                height: 150,
              ),
              SizedBox(height: 10),
              Text(
                'YourVOne Showcase',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 40),
              FlatButton(
                onPressed: () {},
                color: Colors.teal,
                child: Text(
                  'ENTER',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
