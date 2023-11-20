import 'package:flutter/material.dart';
import 'package:flutter_assigment_2/Themes/colors.dart';
import 'package:flutter_assigment_2/componenets/button.dart';
import 'package:flutter_assigment_2/models/food_model.dart';
import 'package:flutter_assigment_2/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );

    // Start the animation when the widget is created
    _animationController.forward();
  }

  void removerCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);

    // Show animated dialog
    _showDeleteSuccessDialog(context);
  }

  Future<void> _showDeleteSuccessDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog from closing on tap outside
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pop();
        });
        return ScaleTransition(
          scale: _scaleAnimation,
          child: AlertDialog(
            content: const Icon(Icons.check_circle, color: Colors.red, size: 50),
            title: const Text("Order Deleted Successfully"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
              // Automatically close the dialog after 2 seconds
            ],
          ),
        );
      },
    );
    // Automatically close the dialog after 2 seconds
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('My Cart'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      final Food food = value.cart[index];
                      final String foodName = food.name;
                      final String foodPrice = food.price;
                      return Container(
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                        ),
                        child: ListTile(
                          title: Text(
                            foodName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          subtitle: Text(
                            foodPrice,
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () => removerCart(food, context),
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: value.cart.isNotEmpty
                      ? MyButton(
                          text: 'Pay Now',
                          onTap: () {
                            Navigator.pushNamed(context, '/checkout');
                          },
                        )
                      : Container(), // Empty container when cart is not empty
                ),
              ],
            ),
            if (value.cart.isEmpty)
              Positioned.fill(
                child: Image.asset(
                  'lib/images/empty.jpg',
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
