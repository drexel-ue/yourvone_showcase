import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yourvone_showcase/utils.dart';
import 'package:yourvone_showcase/views/chat.dart';
import 'package:yourvone_showcase/views/landing.dart';
import 'package:yourvone_showcase/views/login.dart';
import 'package:yourvone_showcase/views/nexus.dart';
import 'package:yourvone_showcase/views/registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MaterialApp(
      title: 'Chat Demo',
      theme: ThemeData.dark(),
      initialRoute: landingRoute,
      routes: {
        landingRoute: (BuildContext context) => Landing(),
        nexusRoute: (BuildContext context) => Nexus(),
        registrationRoute: (BuildContext context) => Registration(),
        loginRoute: (BuildContext context) => Login(),
        chatRoute: (BuildContext context) => Chat(),
      },
    ),
  );
}
