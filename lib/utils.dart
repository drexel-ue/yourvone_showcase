import 'package:flutter/material.dart';

const landingRoute = 'LANDING';
const nexusRoute = 'NEXUS';
const authRoute = 'AUTH';
const loginRoute = 'LOGIN';
const registrationRoute = 'REGISTRATION';
const chatRoute = 'CHAT';
const notiRoute = 'PUSH NOTIFICATIONS';

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );
}
