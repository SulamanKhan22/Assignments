import 'package:assignment_1/screen1.dart';
import 'package:assignment_1/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Welcome to Lorem Ipsum.',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true, // Hide password text
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16.0),
            Container(
              width: double.infinity, // Set the button width to 100%
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  // Validate and check the entered username and password
                  final enteredUsername = usernameController.text;
                  final enteredPassword = passwordController.text;
                  final prefs = await SharedPreferences.getInstance();
                  final storedUsername = prefs.getString('username');
                  final storedPassword = prefs.getString('password');
                  // Check the entered credentials (replace with your authentication logic)
                  if (enteredUsername == storedUsername && enteredPassword == storedPassword) {
                    // Navigate to the next screen (e.g., main app screen)
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const Screen1(),
                    ));
                  } else {
                    // Show an error message or handle invalid credentials
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Login Failed'),
                          content: const Text('Invalid username or password.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 16.0), // Add spacing between the "Login" button and the text
            TextButton(
              onPressed: () {
                // Navigate to the signup screen
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignupScreen(),
                ));
              },
              child: const Text(
                "Don't have an account? Sign up",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue, // Customize the text color
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
