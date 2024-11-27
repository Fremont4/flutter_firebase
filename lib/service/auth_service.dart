import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_babs/models/user_model.dart';

//  communicate with Firebase Auth on the back-end.
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // method that returns usermodel object.
  UserModel? _userModelFromFirebase(user) {
    if (user != null) {
      return UserModel(uid: user.uid);
    } else {
      return null;
    }
  }

  // asynchronous task going to return a future
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;

      return _userModelFromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  // auth change user stream
  Stream get onAuthStateChanged {
    return _auth
        .authStateChanges()
        // .map((User user) => _userModelFromFirebase(user));
        .map(_userModelFromFirebase);
  }
}
