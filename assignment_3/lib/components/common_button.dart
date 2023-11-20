import 'package:assignment_3/provider/tasklist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildCustomButton({
  required BuildContext context,
  required TextEditingController controller,
  required String buttonText,
  VoidCallback? onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed ??
        () {
          if (controller.text.isNotEmpty) {
            Provider.of<TaskList>(context, listen: false).addTask(controller.text);
            controller.clear();
          }
        },
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    child: Text(buttonText),
  );
}
