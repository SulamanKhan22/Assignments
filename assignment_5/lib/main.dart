import 'package:assignment_5/provider/notification_provider.dart';
import 'package:assignment_5/screens/crud_screen.dart';
import 'package:assignment_5/screens/css_color_screen.dart';
import 'package:assignment_5/screens/home_screen.dart';
import 'package:assignment_5/screens/main_screen.dart';
import 'package:assignment_5/screens/notification_list_screen.dart';
import 'package:assignment_5/screens/notification_screen.dart';
import 'package:assignment_5/screens/url_launcher_screen.dart';
import 'package:assignment_5/services/firebase_message_serivce.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

//late final NotificationCountProvider? notificationProvider;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyASlesqR68WWuRdrOufZsbKJ5lcyuaYCM0',
    appId: '1:35247946670:android:cd0c838e275029b444663',
    messagingSenderId: '35247946670',
    projectId: 'assignment5-df416',
  ));
  final fireBaseMessageService = FireBaseMessageService(navigatorKey);
  fireBaseMessageService.initNotifications();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NotificationCountProvider()),
        Provider<FireBaseMessageService>.value(value: fireBaseMessageService),
        // Add other providers if needed
      ],
      child: const MyApp(),
    ),
  );

  // Create a GlobalKey for the navigatorKey
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
      navigatorKey: navigatorKey,
      routes: {
        '/notification_screen': (context) => const NotificationScreen(),
        '/home_screen': (context) => const MyHomePage(),
        '/crud_screen': (context) => CrudScreen(),
        '/notification_list': (context) => const NotificationListScreen(),
        '/css_colors': (context) => const CssColorScreen(),
        '/url_launcher_screen': (context) => UrlLauncherScreen(),
      },
    );
  }
}






// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Color color = Theme.of(context).primaryColor;
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Flutter layout demo'),
//           ),
//           body: Column(
//             children: [
//               Image.asset(
//                 'assets/images/lake2.jpg',
//                 width: 600,
//                 height: 240,
//                 fit: BoxFit.cover,
//               ),
//               titleSection,
//               buttonSection(color),
//               textSection,
//             ],
//           )),
//     );
//   }
// }

// Widget titleSection = Container(
//   padding: const EdgeInsets.all(32),
//   child: Row(
//     children: [
//       Expanded(
//         /*1*/
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /*2*/
//             Container(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: const Text(
//                 'Oeschinen Lake Campground',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Text(
//               'Kandersteg, Switzerland',
//               style: TextStyle(
//                 color: Colors.grey[500],
//               ),
//             ),
//           ],
//         ),
//       ),
//       /*3*/
//       Icon(
//         Icons.star,
//         color: Colors.red[500],
//       ),
//       const Text('41'),
//     ],
//   ),
// );

// Widget buttonSection(Color color) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       _buildButtonColumn(color, Icons.call, 'CALL'),
//       _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//       _buildButtonColumn(color, Icons.share, 'SHARE'),
//     ],
//   );
// }

// Widget textSection = Container(
//   padding: const EdgeInsets.all(32),
//   child: const Text(
//     'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
//     'Alps. Situated 1,578 meters above sea level, it is one of the '
//     'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
//     'half-hour walk through pastures and pine forest, leads you to the '
//     'lake, which warms to 20 degrees Celsius in the summer. Activities '
//     'enjoyed here include rowing, and riding the summer toboggan run.',
//     softWrap: true,
//   ),
// );

// Column _buildButtonColumn(Color color, IconData icon, String label) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Icon(icon, color: color),
//       Container(
//         margin: const EdgeInsets.only(top: 8),
//         child: Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//             color: color,
//           ),
//         ),
//       ),
//     ],
//   );
// }


