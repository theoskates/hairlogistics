import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  static final instance = FirebaseServices();

  final _instance = FirebaseAuth.instance;

  User get currentUser => this._instance.currentUser;

  Future signIn(String email, String password) async {
    try {
      var credentials = await this
          ._instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (!(credentials is UserCredential))
        throw new Exception("User sign in failed");
    } catch (e) {
      return e;
    }
  }

  Future signUp(String email, String password) async {
    try {
      var credentials = await this
          ._instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (!(credentials is UserCredential))
        throw new Exception("User sign Up failed");
    } catch (e) {
      return e;
    }
  }

  Future signOut() async {
    await this._instance.signOut();
  }

  Future forgotPassword(String email) async {
    try {
      await this._instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      return e;
    }
  }
}
