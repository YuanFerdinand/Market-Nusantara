import 'package:flutter/material.dart';
import 'package:market_nusantara/produk/processor.dart';
import 'package:market_nusantara/views/cart_page.dart';
import 'package:market_nusantara/views/message_page.dart';
import 'package:market_nusantara/views/wishlist_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      initialIndex: 0,
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.lightBlue,
          title: Container(
            height: 30,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                labelText: "Search Product...",
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
                contentPadding: EdgeInsets.all(2),
              ),
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 720,
              child: Processor(),
            )
          ],
        ),
      ),
    );
  }
}
