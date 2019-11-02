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
    eventSubject.listen((UserEvent event) {
      if (event is SetUser) {
        _setUser(event.user);
      } else if (event is UnsetUser) {
        _unsetUser();
      }
    });
  }

  void _setUser(User _user) {
    user = _user;
    _userSubject.add(user);
  }

  void _unsetUser() {
    user = null;
    _userSubject.add(user);
  }

  void dispose() {
    _userSubject?.drain();
    eventSubject?.drain();
  }
}
