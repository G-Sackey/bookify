import 'package:bookify/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class OurDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async {
    String retVal = 'error';

    try {
      await _firestore.collection('users').doc(user.uid).set({
        'fullname': user.fullName,
        'email': user.email,
        'accountCreated': Timestamp.now(),
      });
      retVal = 'success';
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal =
        OurUser(uid: '', email: '', fullName: '', accountCreated: null);

    try {
      DocumentSnapshot <Object> _docSnapShot =
          await _firestore.collection('users').doc(uid).get();
      retVal.uid = uid;
      retVal.fullName = _docSnapShot.data()['fullname']?
      retVal.email = _docSnapShot.data()?['email'];
      retVal.accountCreated = _docSnapShot.data()['accountCreated'];
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}
