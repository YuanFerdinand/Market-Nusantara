import 'package:flutter/material.dart';
import 'package:market_nusantara/produk/produk_cart.dart';
import 'package:market_nusantara/views/bayar_page.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text("My Cart"),
        ),
        body: new ProdukCart(),
        bottomNavigationBar: SizedBox(
          width: 2,
          child: Container(
            color: Colors.transparent,
            child: Container(
              height: 50,
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Expanded(
                  child: new RawMaterialButton(
                      fillColor: Colors.lightBlue,
                      onPressed: () => Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (context) => new BayarPage(),
                            ),
                          ),
                      child: Container(
                        child: new Text("Check Out"),
                      ))),
            ),
          ),
        ));
  }
}
