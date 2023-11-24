import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  List<Map<String, dynamic>>? _allUsersData;
  List<Map<String, dynamic>> _displayedUsersData = [];

  void setAllUsersData(List<Map<String, dynamic>> data) {
    _allUsersData = data;
    _displayedUsersData = data;
    notifyListeners();
  }

  List<Map<String, dynamic>> get displayedUsersData => _displayedUsersData;

  void filterUsers(String query) {
    _displayedUsersData = _allUsersData!.where((user) => user['name'].toString().toLowerCase().contains(query.toLowerCase()) || user['email'].toString().toLowerCase().contains(query.toLowerCase())).toList();
    notifyListeners();
  }
}
