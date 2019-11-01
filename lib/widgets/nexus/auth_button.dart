import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourvone_showcase/auth_services/user.dart';
import 'package:yourvone_showcase/blocs/user_bloc.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = Provider.of<UserBloc>(context);

    return StreamBuilder<User>();
  }
}
