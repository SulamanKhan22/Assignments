import 'package:assignment_5/provider/notification_provider.dart';
import 'package:assignment_5/services/firebase_message_serivce.dart';
import 'package:assignment_5/widgets/custome_card.dart';
import 'package:flutter/material.dart';
import 'package:my_package/my_package.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 36, 36),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 36, 36),
        centerTitle: true,
        elevation: 0,
        title: Text(capitalize('main screen')),
        actions: [
          Consumer<NotificationCountProvider>(
            builder: (context, notificationProvider, _) {
              final fireBaseMessageService = Provider.of<FireBaseMessageService>(context, listen: false);
              return IconButton(
                icon: Stack(
                  children: [
                    const Icon(Icons.notifications),
                    if (notificationProvider.count > 0)
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 8,
                          child: Text(
                            notificationProvider.count.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                  ],
                ),
                onPressed: () {
                  notificationProvider.clear(); // Clear count when the bell icon is pressed
                  Navigator.pushNamed(context, '/notification_list', arguments: fireBaseMessageService.receivedMessages);
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/home_screen'),
                  child: const CustomCard(icon: Icons.home, text: 'Home Screen'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/crud_screen');
                  },
                  child: const CustomCard(icon: Icons.settings, text: 'Crud Screen'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/css_colors'),
                  child: const CustomCard(icon: Icons.colorize, text: 'Css Color Screen'),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/url_launcher_screen'),
                  child: const CustomCard(icon: Icons.browser_updated, text: 'Url Browser'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
