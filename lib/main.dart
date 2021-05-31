import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/views/login_page.dart';

import 'views/add_item_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      home: LoginPage(),
    );
  }
}
