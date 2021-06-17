import 'package:flutter/material.dart';

class TokoPage extends StatefulWidget {
  @override
  _TokoPageState createState() => _TokoPageState();
}

class _TokoPageState extends State<TokoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2CCACA),
          title: Text("Toko Anda"),
        ),
      ),
    );
  }
}
