import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yourvone_showcase/blocs/user_bloc.dart';
import 'package:yourvone_showcase/utils.dart';
import 'package:yourvone_showcase/views/auth.dart';
import 'package:yourvone_showcase/views/chat.dart';
import 'package:yourvone_showcase/views/landing.dart';
import 'package:yourvone_showcase/views/login.dart';
import 'package:yourvone_showcase/views/nexus.dart';
import 'package:yourvone_showcase/views/registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiProvider(
      providers: <SingleChildCloneableWidget>[
        Provider(
          builder: (BuildContext context) => UserBloc(),
          dispose: (BuildContext context, UserBloc userBloc) =>
              userBloc.dispose(),
        ),
      ],
      child: MaterialApp(
        title: 'Chat Demo',
        theme: ThemeData.dark(),
        initialRoute: landingRoute,
        routes: {
          landingRoute: (BuildContext context) => Landing(),
          nexusRoute: (BuildContext context) => Nexus(),
          authRoute: (BuildContext context) => Auth(),
          registrationRoute: (BuildContext context) => Registration(),
          loginRoute: (BuildContext context) => Login(),
          chatRoute: (BuildContext context) => Chat(),
        },
      ),
    ),
  );
}
