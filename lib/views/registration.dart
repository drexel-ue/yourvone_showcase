import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yourvone_showcase/auth_services/firebase_auth_service.dart';
import 'package:yourvone_showcase/auth_services/user.dart';
import 'package:yourvone_showcase/views/nexus.dart';
import 'package:yourvone_showcase/widgets/custom_button.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _email;
  String _password;
  String _name;

  final _auth = FirebaseAuthService();

  Future<void> _registerUser() async {
    User _user = await _auth.createUserWithEmailAndPassword(
        _name, _email, _password, context);

    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (_user != null)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Nexus(),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
              TextField(
                onChanged: (String value) => _name = value.trim(),
                keyboardAppearance: Brightness.dark,
                decoration: const InputDecoration(
                  hintText: 'Enter Name Please',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (String value) => _email = value.trim(),
                keyboardType: TextInputType.emailAddress,
                keyboardAppearance: Brightness.dark,
                decoration: const InputDecoration(
                  hintText: 'Enter Email Please',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (String value) => _password = value,
                autocorrect: false,
                obscureText: true,
                keyboardAppearance: Brightness.dark,
                decoration: const InputDecoration(
                  hintText: 'Enter Password Please',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Register',
                callback: () async {
                  await _registerUser();
                },
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
