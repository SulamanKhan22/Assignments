import 'package:assignment_5/models/user_model.dart';
import 'package:assignment_5/services/firebase_serivce.dart';
import 'package:assignment_5/widgets/add_user_dialouge.dart';
import 'package:assignment_5/widgets/user_list_title.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CrudScreen extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  CrudScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore CRUD Demo'),
      ),
      body: StreamBuilder(
        stream: _firestoreService.getUsers(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;

              return UserListTile(
                user: UserModel(
                  id: document.id,
                  name: data['name'],
                  email: data['email'],
                ),
                onDelete: () => _firestoreService.deleteUser(document.id),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => AddUserDialog(firestoreService: _firestoreService),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
