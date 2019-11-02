import 'package:rxdart/subjects.dart';
import 'package:yourvone_showcase/auth_services/user.dart';
import 'package:yourvone_showcase/events/user_event.dart';

export 'package:yourvone_showcase/events/user_event.dart';

class UserBloc {
  User user;

  final _userSubject = BehaviorSubject<User>();
  Stream<User> get userStream => _userSubject.stream;

  final eventSubject = BehaviorSubject<UserEvent>();

  UserBloc() {
    eventSubject.listen((UserEvent event) {});
  }

  void dispose() {
    _userSubject?.drain();
    eventSubject?.drain();
  }
}
