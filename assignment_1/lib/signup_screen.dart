import 'package:assignment_1/login_screen.dart';
import 'package:assignment_1/signup_modal.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showSuccessMessage = false;
  Future<void> saveUserData(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', user.username);
    prefs.setString('email', user.email);
    prefs.setString('password', user.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true, // Hide password text
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: double.infinity, // Set the button width to 100%
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate form
                        if (_formKey.currentState?.validate() ?? true) {
                          // Data is valid, proceed with signup
                          final user = User(
                            username: usernameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          // Save user data to local storage
                          saveUserData(user);

                          // Show success message
                          setState(() {
                            _showSuccessMessage = true;
                          });

                          // Navigate to the login screen after a delay (you can adjust the duration)
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                          });
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                  ),
                  if (_showSuccessMessage)
                    const Text(
                      'Sign up successful! Redirecting to login...',
                      style: TextStyle(color: Colors.green),
                    ),
                  const SizedBox(height: 16.0), // Add spacing between the "Login" button and the text
                  TextButton(
                    onPressed: () {
                      // Navigate to the signup screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                    },
                    child: const Text(
                      "Already have an account? Login",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue, // Customize the text color
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
