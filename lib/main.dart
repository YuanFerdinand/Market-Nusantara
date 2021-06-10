import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/views/bottom_navigation.dart';
import 'package:market_nusantara/views/login_page.dart';

import 'views/add_item_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      home: StreamBuilder<Object>(
          stream: auth.authStateChanges(),
          builder: (context, snapshot) {
            return (snapshot.data == null) ? LoginPage() : BottomNavigation();
          }),
    );
  }
}
