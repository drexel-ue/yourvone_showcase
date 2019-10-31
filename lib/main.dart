import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yourvone_showcase/views/landing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MaterialApp(
      title: 'Chat Demo',
      theme: ThemeData.dark(),
      // initialRoute: landingRoute,
      // routes: {
      //   landingRoute: (BuildContext context) => Landing(),
      //   registrationRoute: (BuildContext context) => Registration(),
      //   loginRoute: (BuildContext context) => Login(),
      //   chatRoute: (BuildContext context) => Chat(),
      // },
      home: Landing(),
    ),
  );
}
