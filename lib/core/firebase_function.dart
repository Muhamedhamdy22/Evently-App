import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunction {
  static Future<void> createUser(
    String email,
    String password,
    String name,
    Function onSuccess,
    Function onError,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      credential.user!.sendEmailVerification();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError("SomeThing Went Wrong");
    }
  }

  static Future<void> login(
    String email,
    String password,
    Function onSuccess,
    Function onError,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user!.emailVerified) {
        onSuccess();
      } else {
        onError("Please verify your email");
      }
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    }
  }
}
