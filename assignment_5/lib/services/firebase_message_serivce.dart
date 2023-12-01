import 'package:assignment_5/provider/notification_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FireBaseMessageService {
  final _firebaseMessaging = FirebaseMessaging.instance;
  GlobalKey<NavigatorState> navigatorKey;

  // Store received messages
  final List<RemoteMessage> _receivedMessages = [];

  // Getter for received messages
  List<RemoteMessage> get receivedMessages => List.from(_receivedMessages);

  // Pass the context when initializing FireBaseMessageService
  FireBaseMessageService(this.navigatorKey);

  void initNotifications() {
    _firebaseMessaging.requestPermission();

    _firebaseMessaging.getToken().then((fcmToken) {
      print('Token: $fcmToken');
    });

    initPushNotification();
  }

  void handleMessages(RemoteMessage? message) {
    if (message == null) return;

    // Store received messages
    _receivedMessages.add(message);
    Provider.of<NotificationCountProvider>(navigatorKey.currentContext!, listen: false).increment();
    // Check if the notification list screen is already open
    final isNotificationListScreenOpen = navigatorKey.currentState?.canPop() ?? false;

    if (isNotificationListScreenOpen) {
      // If notification list screen is open, refresh the list
      navigatorKey.currentState?.pushReplacementNamed('/notification_list', arguments: _receivedMessages);
    } else {
      // If notification list screen is not open, navigate to notification screen
      // navigatorKey.currentState?.pushNamed('/notification_screen', arguments: message);
    }
  }

  void initPushNotification() {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessages);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      handleMessages(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
  }
}
