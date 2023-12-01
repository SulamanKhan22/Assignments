import 'package:flutter/material.dart';
import 'package:css_colors/css_colors.dart';

class CssColorScreen extends StatelessWidget {
  const CssColorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Use CSS-style color names
    final textColor = CSSColors.darkOrange;

    return Scaffold(
      appBar: AppBar(title: Text('CSS Color Example'), backgroundColor: CSSColors.royalBlue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, CSS Color!',
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              color: CSSColors.tomato,
            ),
          ],
        ),
      ),
    );
  }
}
