import 'package:yourvone_showcase/auth_services/user.dart';

abstract class UserEvent {}

class SetUser extends UserEvent {
  SetUser(this.user);
  User user;
}

class UnsetUser extends UserEvent {}
