import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yourvone_showcase/auth_services/firebase_auth_service.dart';
import 'package:yourvone_showcase/auth_services/user.dart';
import 'package:yourvone_showcase/utils.dart';
import 'package:yourvone_showcase/widgets/custom_button.dart';

import 'chat.dart';

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
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  CustomButton(
                    text: 'Log In',
                    callback: () async {
                      Navigator.pushNamed(context, loginRoute);
                    },
                  ),
                  CustomButton(
                    text: 'Register',
                    callback: () async {
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
