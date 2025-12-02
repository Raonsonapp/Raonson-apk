import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/root_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(RaonsonApp());
}

class RaonsonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Raonson",
      themeMode: ThemeMode.dark,
      home: RootPage(),
    );
  }
}
