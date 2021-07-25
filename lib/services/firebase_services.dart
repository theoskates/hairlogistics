import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hairlogistics/models/Product.dart';

class FirebaseServices {
  static final instance = FirebaseServices();

  final _instance = FirebaseAuth.instance;
  final _ref = FirebaseFirestore.instance.collection('Products');

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

  Future<List<Product>> getProducts() async {
    try {
      var data = await _ref.get();
      return data.docs
          .map((e) => Product.fromJson({...e.data(), "id": e.id}))
          .toList()
          .cast<Product>();
    } catch (e) {
      return e;
    }
  }
}
