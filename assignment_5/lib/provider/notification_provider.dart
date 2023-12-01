import 'package:flutter/material.dart';

class NotificationCountProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void clear() {
    _count = 0;
    notifyListeners();
  }
}
