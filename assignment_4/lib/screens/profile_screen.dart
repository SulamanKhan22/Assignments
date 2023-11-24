import 'package:assignment_4/api/http_api.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<List<Map<String, dynamic>>> usersData;

  final ApiService httpService = ApiService('https://api.escuelajs.co');
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    usersData = httpService.fetchUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: usersData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile Screen'),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const Text('No user data available.');
        } else {
          final List<Map<String, dynamic>> allUsersData = snapshot.data!;
          List<Map<String, dynamic>> displayedUsersData = allUsersData;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile Screen'),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: displayedUsersData.length,
                    itemBuilder: (context, index) {
                      final userData = displayedUsersData[index];
                      return buildUserProfileCard(userData);
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget buildUserProfileCard(Map<String, dynamic> userData) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 5.0,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 98, 90, 236),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                height: 200,
                margin: const EdgeInsets.only(bottom: 30), // Adjusted margin
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        userData['name'],
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        userData['email'],
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialIcon(icon: Icons.link),
                          SocialIcon(icon: Icons.two_k_outlined),
                          SocialIcon(icon: Icons.install_desktop),
                          SocialIcon(icon: Icons.stacked_bar_chart),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ActionButton(title: 'Contact Me'),
                          const SizedBox(width: 10.0),
                          ActionButton(title: 'Add Me'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 100.0,
            left: 0,
            right: 0,
            child: Center(
              child: CircleAvatar(
                radius: 70.0,
                backgroundImage: NetworkImage(userData['avatar']),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;

  SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Icon(
        icon,
        size: 30.0,
        color: Colors.black,
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String title;

  ActionButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add your action here
      },
      child: Text(title),
    );
  }
}
