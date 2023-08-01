import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class CurrentUser extends ChangeNotifier {
  late String _uid;
  late String _email;

  String get getUid => _uid;
  String get getEmail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser(String email, String password) async {
    String retVal = "error";

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      retVal = 'success';
    } catch (e) {
      print('Error: ${e.toString()}');
    }

    return retVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String retVal = "error";

    try {
      UserCredential _userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (_userCredential.user != null) {
        _uid = _userCredential.user!.uid;
        _email = _userCredential.user!.email!;
        retVal = "success";
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }

    return retVal;
  }

  Future<String> loginUserWithGoogle() async {
    String retVal = "error";
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    try {
      GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth =
          await _googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);

      UserCredential _userCredential =
          await _auth.signInWithCredential(credential);
      if (_userCredential.user != null) {
        _uid = _userCredential.user!.uid;
        _email = _userCredential.user!.email!;
        retVal = "success";
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }

    return retVal;
  }
}
