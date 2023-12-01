import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationListScreen extends StatelessWidget {
  const NotificationListScreen({super.key});

  String formatNotificationDate(DateTime? date) {
    if (date == null) {
      return 'Unknown date';
    }

    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      // Today
      return 'Today at ${DateFormat('h:mm a').format(date)}';
    } else if (difference.inDays == 1) {
      // Yesterday
      return 'Yesterday at ${DateFormat('h:mm a').format(date)}';
    } else {
      // Other days
      return DateFormat('MMM d, yyyy ' 'at' ' h:mm a').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<RemoteMessage> receivedMessages = ModalRoute.of(context)!.settings.arguments as List<RemoteMessage>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification List'),
      ),
      body: receivedMessages.isEmpty
          ? const Center(
              child: Text('No notifications available'),
            )
          : ListView.builder(
              itemCount: receivedMessages.length,
              itemBuilder: (context, index) {
                final notificationTitle = receivedMessages[index].notification?.title ?? 'No title';
                final notificationSubtitle = receivedMessages[index].notification?.body ?? 'No subtitle';

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                  child: Card(
                    color: Colors.grey[200],
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blue, // Customize the color as needed
                        child: Icon(Icons.notifications, color: Colors.white),
                      ),
                      title: Text(
                        notificationTitle,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notificationSubtitle),
                          const SizedBox(height: 8.0),
                          Text(
                            formatNotificationDate(receivedMessages[index].sentTime),
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/notification_screen',
                          arguments: receivedMessages[index],
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
