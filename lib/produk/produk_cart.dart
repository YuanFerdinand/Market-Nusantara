import 'package:flutter/material.dart';

class ProdukCart extends StatefulWidget {
  @override
  _ProdukCartState createState() => _ProdukCartState();
}

class _ProdukCartState extends State<ProdukCart> {
  var cart_produk = [
    {
      "name": "core i9",
      "picture": "assets/processor/corei9.jpg",
      "price": "IDR 9.200.000",
      "type": "processor",
      "Brand": "Intel",
      "qty": "1",
    },
    {
      "name": "core i7",
      "picture": "assets/processor/corei7.jpg",
      "price": "IDR 9.200.000",
      "type": "processor",
      "Brand": "Intel",
      "qty": "1",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: cart_produk.length,
        itemBuilder: (context, index) {
          return Single_cart_prod(
            cart_name: cart_produk[index]["name"],
            cart_picture: cart_produk[index]["picture"],
            cart_brand: cart_produk[index]["Brand"],
            cart_price: cart_produk[index]["price"],
            cart_qty: cart_produk[index]["qty"],
            cart_tipe: cart_produk[index]["type"],
          );
        });
  }
}

class Single_cart_prod extends StatelessWidget {
  final cart_picture;
  final cart_name;
  final cart_price;
  final cart_tipe;
  final cart_qty;
  final cart_brand;

  Single_cart_prod({
    this.cart_picture,
    this.cart_name,
    this.cart_price,
    this.cart_tipe,
    this.cart_qty,
    this.cart_brand,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 25, left: 15, right: 15),
        child: ListTile(
          leading: new Image.asset(cart_picture),
          title: new Text(cart_name),
          // title: new Image.asset(
          //   cart_picture,
          //   height: 70,
          //   width: 70,
          //),
          subtitle: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: new Text("Type:"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      cart_tipe,
                    ),
                  ),

                  new Container(
                      padding: EdgeInsets.only(left: 125),
                      child: Row(
                        children: [
                          new IconButton(
                              icon: Icon(Icons.add), onPressed: () {}),
                          new Text("$cart_qty"),
                          new IconButton(
                              icon: Icon(Icons.remove), onPressed: () {}),
                        ],
                      ))
                  // Expanded(child: new Text("Type: ")),
                  // Expanded(child: new Text("QTY: ")),
                ],
              ),
              new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                    child: new Text("Brand:"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      cart_brand,
                    ),
                  ),
                  new Container(
                    padding: EdgeInsets.only(left: 170),
                    child: new Text(cart_price),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
