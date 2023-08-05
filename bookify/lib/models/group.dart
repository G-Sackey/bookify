import 'package:cloud_firestore/cloud_firestore.dart';

class OurGroup{
  late String id;
  late String name;
  late String leader;
  late List<String> members;
  late Timestamp groupCreated;

  OurGroup({
    required this.id,
    required this.name,
    required this.leader,
    required this.members,
    required this.groupCreated,

  });
}