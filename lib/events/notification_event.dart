abstract class NotificationEvent {}

class Initialize extends NotificationEvent {
  Initialize(this.uid);
  String uid;
}
