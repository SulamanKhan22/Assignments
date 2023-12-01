import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String name, String email) async {
    await usersCollection.add({'name': name, 'email': email});
  }

  Stream<QuerySnapshot> getUsers() {
    return usersCollection.snapshots();
  }

  Future<void> updateUser(String userId, String newName) async {
    await usersCollection.doc(userId).update({'name': newName});
  }

  Future<void> deleteUser(String userId) async {
    await usersCollection.doc(userId).delete();
  }
}
