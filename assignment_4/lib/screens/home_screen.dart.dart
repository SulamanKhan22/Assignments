import 'package:assignment_4/components/customcard.dart';
import 'package:assignment_4/screens/data_persistance_screen.dart';
import 'package:assignment_4/screens/product_screen.dart';
import 'package:assignment_4/screens/profile_screen.dart';
import 'package:assignment_4/screens/socket_screen.dart';
import 'package:assignment_4/screens/task_screen.dart';
import 'package:flutter/material.dart';

class HomeDcreen extends StatefulWidget {
  const HomeDcreen({super.key});

  @override
  State<HomeDcreen> createState() => _HomeDcreenState();
}

class _HomeDcreenState extends State<HomeDcreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Two Cards in One Row
                Row(
                  children: [
                    Expanded(
                      child: CustomCard(
                        icon: Icons.message,
                        title: 'Chat',
                        color: Colors.blue, // Customize color
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SocketScreen()),
                          );
                        },
                      ),
                    ),
                    // SizedBox(width: 16), // Add spacing between the two cards
                    Expanded(
                      child: CustomCard(
                        icon: Icons.api,
                        title: 'Dio API',
                        color: Colors.green, // Customize color
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProductScreen()),
                          );
                          // Add navigation logic for Dio API screen
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    // SizedBox(width: 16), // Add spacing between the two cards
                    Expanded(
                      child: CustomCard(
                        icon: Icons.wifi,
                        title: 'HTTP',
                        color: Colors.orange, // Customize color
                        onTap: () {
                          // Add navigation logic for HTTP screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()),
                          );
                        },
                      ),
                    ),
                    // SizedBox(width: 16),
                    Expanded(
                      child: CustomCard(
                        icon: Icons.task_alt_outlined,
                        title: 'Task Manager',
                        color: Colors.purple, // Customize color
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TasksScreen()),
                          );
                        },
                      ),
                    )
                  ],
                ),

                // SizedBox(width: 16), // Add spacing between the two cards
                Container(
                  margin: const EdgeInsets.only(right: 185, top: 15),
                  child: CustomCard(
                    icon: Icons.personal_injury,
                    title: 'Data Persistance',
                    color: const Color.fromARGB(255, 243, 33, 222), // Customize color
                    onTap: () {
                      // Add navigation logic for HTTP screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PreferencesScreen()),
                      );
                    },
                  ),
                ),
                // SizedBox(width: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
