import 'package:bookify/main.dart';
import 'package:bookify/models/user.dart';
import 'package:bookify/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class CurrentUser extends ChangeNotifier {
  OurUser _currentUser =
      OurUser(uid: '', accountCreated: null, email: '', fullName: '');

  OurUser get getcurrentUser => _currentUser;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String retVal = 'error';

    try {
      User? _firebaseUser = await _auth.currentUser;
      _currentUser.uid = _firebaseUser!.uid;
      _currentUser.email = _firebaseUser.email!;
      retVal = 'success';
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> signOut() async {
    String retVal = 'error';

    try {
      await _auth.signOut();
      _currentUser =
          OurUser(uid: '', accountCreated: null, email: '', fullName: '');
      retVal = 'success';
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> signUpUser(
      String email, String password, String fullName) async {
    String retVal = "error";
    OurUser _user =
        OurUser(uid: '', email: '', fullName: '', accountCreated: null);

    try {
      UserCredential _userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      _user.uid = _userCredential.user!.uid;
      _user.email = _userCredential.user!.email!;
      _user.fullName = fullName;

      String _returnString = await OurDatabase().createUser(_user);

      if (_returnString == 'success') {
        retVal = 'success';
      }
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
        _currentUser.uid = _userCredential.user!.uid;
        _currentUser.email = _userCredential.user!.email!;
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

    OurUser _user =
        OurUser(uid: '', email: '', fullName: '', accountCreated: null);

    try {
      GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth =
          await _googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);

      UserCredential _userCredential =
          await _auth.signInWithCredential(credential);
      if (_userCredential.additionalUserInfo!.isNewUser) {
        _user.uid = _userCredential.user!.uid;
        _user.email = _userCredential.user!.email!;
        _user.fullName = _userCredential.user!.displayName!;
        OurDatabase().createUser(_user);
      }
      if (_userCredential.user != null) {
        _currentUser.uid = _userCredential.user!.uid;
        _currentUser.email = _userCredential.user!.email!;
        retVal = "success";
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }

    return retVal;
  }
}
