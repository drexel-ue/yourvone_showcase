import 'package:flutter/material.dart';
import 'package:yourvone_showcase/utils.dart';

class Auth extends StatefulWidget {
  const Auth({Key key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    width: 150,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(
                    color: Colors.teal,
                    child: const Text(
                      'Log In',
                      style: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, loginRoute);
                    },
                  ),
                  FlatButton(
                    color: Colors.teal,
                    child: const Text(
                      'Register',
                      style: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, registrationRoute);
                    },
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
