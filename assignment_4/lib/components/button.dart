// Add this in custom_button.dart
import 'package:flutter/material.dart';

class NextScreenButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  NextScreenButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey,
        onPrimary: Colors.white,
        minimumSize: Size(200, 50),
      ),
    );
  }
}
