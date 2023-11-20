// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_assigment_2/Themes/colors.dart';
import 'package:flutter_assigment_2/componenets/button.dart';
import 'package:flutter_assigment_2/componenets/food_tile.dart';
import 'package:flutter_assigment_2/models/food_model.dart';
import 'package:flutter_assigment_2/models/shop.dart';
import 'package:flutter_assigment_2/pages/food_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List foodMenu = [
    Food(
      name: 'Samon Sushi',
      imagePath: 'lib/images/sushi.png',
      price: '21',
      rating: '4',
      description: 'This is great food once you eat you love it and that will not be forgattable for you',
    ),
    Food(
      name: 'My Sushi Taste',
      imagePath: 'lib/images/sushi2.png',
      price: '25',
      rating: '5',
      description: 'Hello do you want to eat that food you loved it and eat everytime to come to lahori hotel',
    ),
    Food(name: 'Chicken Biryani', imagePath: 'lib/images/sushi3.png', price: '12', rating: '4.7', description: 'Hi Please give the chicken that i love and it is only avaliable in that hotel'),
  ];

  navigateToFoodDetailPage(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetails(
          index,
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();

    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          'Lahori Resturant',
          style: TextStyle(
            color: Colors.grey[900],
          ),
        ),
        actions: [
          Consumer<Shop>(
            builder: (context, shop, child) {
              return IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cartPage');
                },
                icon: Stack(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.grey[900],
                      size: 35,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 102, 60, 40),
                        ),
                        child: Center(
                          child: Text(
                            '${shop.cart.length}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 40,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GET 32% Promo',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyButton(text: 'Get Promo', onTap: () {})
                    ],
                  ),
                  Image.asset(
                    'lib/images/sushi2.png',
                    height: 100,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'Search Here ...'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Food Menu',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            //Food Items

            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateToFoodDetailPage(index),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 25,
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/images/sushi.png',
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sulmon Eggs',
                            style: GoogleFonts.dmSerifDisplay(fontSize: 24),
                          ),
                          Text(
                            '\$21.00',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite_outline,
                    color: Colors.grey,
                    size: 24,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
