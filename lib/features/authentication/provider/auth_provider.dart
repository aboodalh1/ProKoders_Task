import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prokoders_login_task/core/util/object_validator.dart';
import 'package:prokoders_login_task/features/authentication/data/user_session.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isLoading = false;
  bool loginIsPasswordShown = true;
  bool registerIsPasswordShown = true;

  void showHidePassword({required bool isRegister}) {
    isRegister? registerIsPasswordShown = !registerIsPasswordShown: loginIsPasswordShown = !loginIsPasswordShown;
    notifyListeners();
  }

  ObjectValidator objectValidator = ObjectValidator();

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    isLoading = true;
    notifyListeners();
    try {
      if (objectValidator.verifyEmailAndPassword(email, password) != "true") {
        throw objectValidator.verifyEmailAndPassword(email, password);
      }
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );

      UserSession().setUser(
        userCredential.user!.uid,
        userCredential.user!.email ?? '',
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code.contains("unknown")) {
        throw "Not Available in your region";
      } else {
        throw e.code;
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<UserCredential> signUpWithEmailandPassword(
    String email,
    String password,
  ) async {
    isLoading = true;
    notifyListeners();
    try {
      if (objectValidator.verifyEmailAndPassword(email, password) != "true") {
        throw objectValidator.verifyEmailAndPassword(email, password);
      }

      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );
      UserSession().setUser(
        userCredential.user!.uid,
        userCredential.user!.email ?? '',
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code.contains("unknown")) {
        throw "Not Available in your region";
      } else {
        throw e.code;
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
