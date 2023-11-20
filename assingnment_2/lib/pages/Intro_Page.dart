// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_assigment_2/componenets/button.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 116, 51, 47),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 10,
            ),
            //Resturant Name
            Text(
              'Lahore Resturant',
              style: GoogleFonts.dmSerifDisplay(fontSize: 24, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/sushi.png'),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Text(
              'The Taste of Lahori food.',
              style: GoogleFonts.dmSerifDisplay(fontSize: 35, color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Feel the taste of lahore food everywhere anytime',
              style: TextStyle(color: Colors.grey[300], height: 2),
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              text: 'Get Started',
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}
