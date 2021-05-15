import 'package:flutter/material.dart';
import 'package:market_nusantara/views/bottom_navigation.dart';
import 'package:market_nusantara/views/detail_page.dart';
import 'package:market_nusantara/views/login_page.dart';
import 'package:market_nusantara/views/profil_page.dart';
import 'package:market_nusantara/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      home: BottomNavigation(),
    );
  }
}
