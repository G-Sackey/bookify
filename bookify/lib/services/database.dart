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
        OurUser(uid: '', email: '', fullName: '', accountCreated: null, groupId: '');

    try {
      DocumentSnapshot<Map<String, dynamic>> docSnapShot =
          await _firestore.collection('users').doc(uid).get();
      retVal.uid = uid;
      retVal.fullName = docSnapShot.data()!['fullname'];
      retVal.email = docSnapShot.data()!['email'];
      retVal.accountCreated = docSnapShot.data()!['accountCreated'];
      retVal.groupId = docSnapShot.data()!['groupId'];
    } catch (e) {
      print(e);
    }

    return retVal;
  }

   Future<String> createGroup(String groupName, String userUid) async {
    String retVal = 'error';
    List members = [];

    try {
      members.add(userUid);
      DocumentReference _docRef = await _firestore.collection('groups').add({
        'name': groupName,
        'leader': userUid,
        'members': members,
        'groupCreated': Timestamp.now(),
      });

      await _firestore.collection('users').doc(userUid).update({
        'groupId': _docRef.id,
      });

      retVal = 'success';
    } catch (e) {
      print(e);
    }

    return retVal;
  }

   Future<String> joinGroup(String groupId, String userUid) async {
    String retVal = 'error';
    List<String> members = [];

    try {
      members.add(userUid);
      await _firestore.collection('groups').doc(groupId).update({
        'members': FieldValue.arrayUnion(members),
      });

       await _firestore.collection('users').doc(userUid).update({
        'groupId': groupId,
      });

      retVal = 'success';
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}
