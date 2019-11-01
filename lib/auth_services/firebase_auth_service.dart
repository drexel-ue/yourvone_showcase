import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yourvone_showcase/auth_services/auth.dart';
import 'package:yourvone_showcase/auth_services/error_message.dart';
import 'package:yourvone_showcase/auth_services/user.dart';
import 'package:yourvone_showcase/utils.dart';

class FirebaseAuthService extends Auth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _errorHandler = ErrorHandling();
  PlatformException _error;

  @override
  Future<User> createUserWithEmailAndPassword(
      String name, String email, String password, BuildContext context) async {
    showLoading(context);

    AuthResult result = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError((e) {
      _error = e;
    });

    if (result != null && result.user != null) {
      UserUpdateInfo info = UserUpdateInfo();
      info.displayName = name;
      await result.user.updateProfile(info);

      return _userFromFirebaseUser(result.user, name: name);
    } else {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(_errorHandler.getErrorMessage(_error)),
        ),
      );
      return null;
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    showLoading(context);

    AuthResult result = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((e) {
      _error = e;
    });

    if (result == null) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(_errorHandler.getErrorMessage(_error)),
        ),
      );
      return null;
    }

    return _userFromFirebaseUser(result.user);
  }

  @override
  Future<void> signOut() async => await _firebaseAuth.signOut();

  @override
  // TODO: implement onAuthStateChange
  Stream<User> get onAuthStateChange => _firebaseAuth.onAuthStateChanged
      .map((FirebaseUser user) => _userFromFirebaseUser(user));

  _userFromFirebaseUser(FirebaseUser user, {String name}) {
    if (user == null) {
      return null;
    }
    return User(
        uid: user.uid, name: name ?? user.displayName, emailId: user.email);
  }
}
