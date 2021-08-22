import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class AuthController extends ChangeNotifier {
  Future firebase = Firebase.initializeApp();

  Future signup(email, password, name) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();

      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  Future signin(email, password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    return user;
  }
}
