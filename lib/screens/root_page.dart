import 'package:flutter/material.dart';
import 'feed_page.dart';
import 'upload_page.dart';
import 'profile_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentIndex = 0;

  final pages = [
    FeedPage(),
    UploadPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Асосӣ"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box), label: "Пост"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Профил"),
        ],
      ),
    );
  }
}
