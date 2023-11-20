import 'package:assignment_1/card_modal.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final List<CardData> cardDataList = [
    CardData(heading: "Card 1 Heading", details: "Card 1 Details"),
    CardData(heading: "Card 2 Heading", details: "Card 2 Details"),
    CardData(heading: "Card 3 Heading", details: "Card 3 Details"),
    CardData(heading: "Card 4 Heading", details: "Card 4 Details"),
  ];
  Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // title: Text("Screen 2"), // You can add a title here if needed
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 4, // Number of cards you want
          itemBuilder: (BuildContext context, int index) {
            final cardData = cardDataList[index];
            return Card(
              child: Row(
                children: [
                  // Image on the left side
                  Container(
                    width: 100, // Set the width as needed
                    child: Image.asset(
                      'assets/images/download.png',
                    ), // Replace with your image
                  ),
                  // Content/Details on the right side
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cardData.heading),
                          Text(cardData.details),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
