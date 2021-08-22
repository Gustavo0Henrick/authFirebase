import 'package:auth_firebase/src/core/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

enum AuthState { idle, sucess, erro, loading }

class AuthController extends ChangeNotifier {
  var state = AuthState.idle;
  Future firebase = Firebase.initializeApp();

  Future signup(email, password, name) async {
    state = AuthState.loading;
    notifyListeners();
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;

      state = AuthState.sucess;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        state = AuthState.erro;
        notifyListeners();
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        state = AuthState.erro;
        notifyListeners();
      } else {
        print('SignUp Error');
        state = AuthState.erro;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  Future signin(email, password) async {
    state = AuthState.loading;
    notifyListeners();
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      user = auth.currentUser;
      globaUserModel = UserModel(user!.displayName!, user.email!, user.uid);

      state = AuthState.sucess;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');

        state = AuthState.erro;
        notifyListeners();
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');

        state = AuthState.erro;
        notifyListeners();
      } else {
        print('Invalid Email and/or Password');
        state = AuthState.erro;
        notifyListeners();
      }
    }
  }

  Future signOut() async {
    state = AuthState.loading;
    notifyListeners();
    try {
      await FirebaseAuth.instance.signOut();
      globaUserModel = UserModel('', '', '');

      state = AuthState.sucess;
      notifyListeners();
    } catch (e) {
      state = AuthState.erro;
      notifyListeners();
    }
  }
}
