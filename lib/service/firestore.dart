// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String uname) async {
    try {
      await userCollection.doc(uid).set({
        'username': uname,
      });
    } catch (e) {
      print(e.toString());
    }
  }

}
