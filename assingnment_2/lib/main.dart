import 'package:flutter/material.dart';
import 'package:flutter_assigment_2/models/shop.dart';
import 'package:flutter_assigment_2/pages/Intro_Page.dart';
import 'package:flutter_assigment_2/pages/Menu_Page.dart';
import 'package:flutter_assigment_2/pages/cart_page.dart';
import 'package:flutter_assigment_2/pages/checkout_page.dart';
import 'package:flutter_assigment_2/pages/order_confirmation_page.dart';
import 'package:flutter_assigment_2/pages/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
        '/cartPage': (context) => const CartPage(),
        '/checkout': (context) => const CheckoutScreen(),
        '/orderConfirmation': (context) => const OrderConfirmationScreen(),
      },
    );
  }
}
