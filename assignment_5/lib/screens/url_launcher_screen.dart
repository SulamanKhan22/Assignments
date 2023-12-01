import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherScreen extends StatelessWidget {
  const UrlLauncherScreen({super.key});

  //const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF3E1F92),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Get in touch', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10.0),
                const Text("We'd love to hear from you. Our friendly team is always here to chat.", style: TextStyle(color: Color(0xFFA895D1), fontSize: 15.0, fontWeight: FontWeight.normal)),
                const SizedBox(height: 30.0),
                TextButton(
                  onPressed: () {
                    //logic  goes here
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.phone, color: Color(0xFFED92A2)),
                      SizedBox(width: 20.0),
                      Text('+0123 4567 8910', style: TextStyle(color: Color(0xFFA294C2), fontSize: 16.0, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //logic  goes here
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.sms, color: Color(0xFFED92A2)),
                      SizedBox(width: 20.0),
                      Text('+0123 4567 8910', style: TextStyle(color: Color(0xFFA294C2), fontSize: 16.0, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.mail, color: Color(0xFFED92A2)),
                      SizedBox(width: 20.0),
                      Text('example@logrocket.com', style: TextStyle(color: Color(0xFFA294C2), fontSize: 16.0, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //logic  goes here
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_pin, color: Color(0xFFED92A2)),
                      SizedBox(width: 20.0),
                      Text('87 Summer St., Boston, MA 02110', style: TextStyle(color: Color(0xFFA294C2), fontSize: 16.0, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final Uri url = Uri.parse('https://blog.logrocket.com');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url); //forceWebView is true now
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.language, color: Color(0xFFED92A2)),
                      SizedBox(width: 20.0),
                      Text('blog.logrocket.com', style: TextStyle(color: Color(0xFFA294C2), fontSize: 16.0, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  // ignore: no_leading_underscores_for_local_identifiers
}
