import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesScreen extends StatefulWidget {
  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  TextEditingController _themeController = TextEditingController();
  String _savedTheme = '';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedTheme = prefs.getString('theme') ?? ''; // Use empty string if not found
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _themeController,
              decoration: const InputDecoration(labelText: 'Enter theme preference'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _savePreferences();
              },
              child: const Text('Save Preferences'),
            ),
            const SizedBox(height: 16),
            Text('Saved Theme: $_savedTheme'),
          ],
        ),
      ),
    );
  }

  _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', _themeController.text);
    _themeController.clear();
    _loadPreferences(); // Update the displayed saved theme

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Preferences saved successfully'),
      ),
    );
  }
}
