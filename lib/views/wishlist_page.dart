import 'package:flutter/material.dart';
import 'package:market_nusantara/produk/processor.dart';
import 'package:market_nusantara/produk/wishlist_prod.dart';
import 'package:market_nusantara/views/cart_page.dart';
import 'package:market_nusantara/views/message_page.dart';
import 'package:market_nusantara/views/wishlist_page.dart';

class WishListPage extends StatefulWidget {
  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
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
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 10,
              ),
              child: Text(
                "FAVOURITE",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 720,
              child: WishlishProdPage(),
            )
          ],
        ),
      ),
    );
  }
}
