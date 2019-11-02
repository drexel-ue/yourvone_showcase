import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/subjects.dart';
import 'package:yourvone_showcase/events/notification_event.dart';

class NotificationBloc {
  final _fcm = FirebaseMessaging();
  String fcmToken;

  final eventSubject = BehaviorSubject<NotificationEvent>();

  NotificationBloc() {
    eventSubject.listen((NotificationEvent event) {
      if (event is Initialize) {
        _initialize();
      } else if (event is RevokePermission) {
        _revokePermissions();
      }
    });
  }

  void _initialize() async {
    if (fcmToken == null) {
      _fcm.requestNotificationPermissions();
      fcmToken = await _fcm.getToken();

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

  void _revokePermissions() async {
    fcmToken = null;
    await _fcm.deleteInstanceID();
  }

  dispose() {
    eventSubject?.drain();
  }
}
