import 'package:flutter/material.dart';
import 'package:flutter_assigment_2/Themes/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization code here
    _navigateToMainScreen();
  }

  // Navigate to the main screen after a certain duration
  void _navigateToMainScreen() async {
    await Future.delayed(const Duration(seconds: 2)); // Change the duration as needed

    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/intropage'); // Replace '/main' with the route to your main screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/sushi3.png'),
              fit: BoxFit.cover,
            ),
          ),
          // child: const Center(
          //   child: FlutterLogo(
          //     size: 200,
          //   ),
          // ),
        ),
      ),
    );
  }
}
