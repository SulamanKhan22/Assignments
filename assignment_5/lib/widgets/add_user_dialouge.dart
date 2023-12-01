import 'package:assignment_5/services/firebase_serivce.dart';
import 'package:flutter/material.dart';

class AddUserDialog extends StatefulWidget {
  final FirestoreService firestoreService;

  // ignore: prefer_const_constructors_in_immutables
  AddUserDialog({super.key, required this.firestoreService});

  @override
  // ignore: library_private_types_in_public_api
  _AddUserDialogState createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add User'),
      content: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            await widget.firestoreService.addUser(_nameController.text, _emailController.text);
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
