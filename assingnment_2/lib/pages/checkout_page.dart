import 'package:flutter/material.dart';
import 'package:flutter_assigment_2/Themes/colors.dart';
import 'package:flutter_assigment_2/componenets/button.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text('Checkout'),
        elevation: 0,
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Set border radius
                    borderSide: const BorderSide(color: Colors.white), // Set border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Set border radius
                    borderSide: const BorderSide(color: Colors.white), // Set border color
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 45),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Set border radius
                    borderSide: const BorderSide(color: Colors.white), // Set border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Set border radius
                    borderSide: const BorderSide(color: Colors.white), // Set border color
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 45),
              TextFormField(
                controller: cardNumberController,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Set border radius
                    borderSide: const BorderSide(color: Colors.white), // Set border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Set border radius
                    borderSide: const BorderSide(color: Colors.white), // Set border color
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your card number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 45),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: expiryDateController,
                      decoration: InputDecoration(
                        labelText: 'Expiry Date',
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0), // Set border radius
                          borderSide: const BorderSide(color: Colors.white), // Set border color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0), // Set border radius
                          borderSide: const BorderSide(color: Colors.white), // Set border color
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the expiry date';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      cursorColor: Colors.white,
                      controller: cvvController,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0), // Set border radius
                          borderSide: const BorderSide(color: Colors.white), // Set border color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0), // Set border radius
                          borderSide: const BorderSide(color: Colors.white), // Set border color
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the CVV';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              MyButton(
                  text: 'Place Order',
                  onTap: () {
                    Navigator.pushNamed(context, '/orderConfirmation');
                  })
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    return nameController.text.isNotEmpty && addressController.text.isNotEmpty && cardNumberController.text.isNotEmpty && expiryDateController.text.isNotEmpty && cvvController.text.isNotEmpty;
  }
}
