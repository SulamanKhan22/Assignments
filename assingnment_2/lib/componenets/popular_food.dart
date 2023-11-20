import 'package:flutter/material.dart';
import 'package:flutter_assigment_2/models/food_model.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularFood extends StatelessWidget {
  final Food food;

  const PopularFood({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                food.imagePath,
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 24),
                  ),
                  Text(
                    '\$${food.price}',
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
    );
  }
}
