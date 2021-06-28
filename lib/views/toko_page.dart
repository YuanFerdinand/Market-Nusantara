import 'package:flutter/material.dart';

class TokoPage extends StatefulWidget {
  @override
  _TokoPageState createState() => _TokoPageState();
}

class _TokoPageState extends State<TokoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toko Anda"),
      ),
    );
  }
}
