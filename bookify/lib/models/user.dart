import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  late String uid;
  late String email;
  late String fullName;
  late Timestamp? accountCreated;
  late String groupId;

  OurUser({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.accountCreated,
    required this.groupId,
  });
}
