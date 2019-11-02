import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/subjects.dart';
import 'package:yourvone_showcase/events/notification_event.dart';

class NotificationBloc {
  final _fcm = FirebaseMessaging();
  String _fcmToken;
  final _usersRef = Firestore.instance.collection('users').reference();

  final eventSubject = BehaviorSubject<NotificationEvent>();

  NotificationBloc() {
    eventSubject.listen((NotificationEvent event) {
      if (event is Initialize) {
        _initialize(event.uid);
      }
    });
  }

  void _initialize(String uid) async {
    if (_fcmToken == null) {
      _fcm.requestNotificationPermissions();
      _fcmToken = await _fcm.getToken();

      await _usersRef.document(uid).setData({
        'fcmToken': _fcmToken,
      }, merge: true);

      _fcm.configure(
        onMessage: (Map<String, dynamic> message) async {
          print('>>>>>>>>>>>>mes');
          print('on message $message');
        },
        onResume: (Map<String, dynamic> message) async {
          print('>>>>>>>>>>>>res');
          print('on resume $message');
        },
        onLaunch: (Map<String, dynamic> message) async {
          print('>>>>>>>>>>>>lau');
          print('on launch $message');
        },
      );
    }
  }

  dispose() {
    eventSubject?.drain();
  }
}
