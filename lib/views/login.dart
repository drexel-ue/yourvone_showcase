import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yourvone_showcase/auth_services/firebase_auth_service.dart';
import 'package:yourvone_showcase/auth_services/user.dart';
import 'package:yourvone_showcase/blocs/user_bloc.dart';
import 'package:yourvone_showcase/views/nexus.dart';
import 'package:yourvone_showcase/widgets/custom_button.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;

  final _auth = FirebaseAuthService();

  Future<void> _loginUser(UserBloc userBloc) async {
    User _user =
        await _auth.signInWithEmailAndPassword(_email, _password, context);

    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (_user != null) {
      userBloc.eventSubject.add(SetUser(_user));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Nexus(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _userBloc = Provider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                text: 'Log In',
                callback: () async {
                  await _loginUser(_userBloc);
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
