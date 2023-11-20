import 'package:flutter/material.dart';
import 'package:flutter_assigment_2/models/food_model.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
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

  final List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addTocart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    cart.remove(food);
    notifyListeners();
  }
}
