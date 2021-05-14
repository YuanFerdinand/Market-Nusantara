import 'package:flutter/material.dart';
import 'package:market_nusantara/views/login_page.dart';

void main() {
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
