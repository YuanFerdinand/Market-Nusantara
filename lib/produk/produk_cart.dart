import 'package:flutter/material.dart';

class ProdukCart extends StatefulWidget {
  @override
  _ProdukCartState createState() => _ProdukCartState();
}

class _ProdukCartState extends State<ProdukCart> {
  var cart_produk = [
    {
      "name": "core i9",
      "picture": "assets/corei9.png",
      "price": "IDR 9.200.000",
      "type": "processor",
      "Brand": "Intel",
      "qty": "1",
    },
    {
      "name": "core i7",
      "picture": "assets/corei7.png",
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

class Single_cart_prod extends StatefulWidget {
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
  _Single_cart_prodState createState() => _Single_cart_prodState();
}

class _Single_cart_prodState extends State<Single_cart_prod> {
  @override
  Widget build(BuildContext context) {
    int counter;
    return Card(
        margin: EdgeInsets.only(top: 25, left: 15, right: 15),
        child: ListTile(
          leading: new Image.asset(widget.cart_picture),
          title: new Text(widget.cart_name),
          // title: new Image.asset(
          //   cart_picture,
          //   height: 70,
          //   width: 70,
          //),
          subtitle: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Text("Type:"),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      widget.cart_tipe,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 4, left: 40),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            if (counter > 1) {
                              setState(() {
                                counter -= 1;
                              });
                            } else {
                              setState(() {
                                counter = 0;
                              });
                            }
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side:
                                    BorderSide(width: 1, color: Colors.black)),
                            child: Container(
                                margin: EdgeInsets.all(7),
                                child: GestureDetector(
                                    onTap: () {
                                      if (counter > 0) {
                                        setState(() {
                                          counter -= 1;
                                        });
                                      } else {
                                        setState(() {
                                          counter = 0;
                                        });
                                      }
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 14,
                                    ))),
                          ),
                        ),
                        Text(" 4 ", style: TextStyle(fontSize: 18)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              counter += 1;
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side:
                                    BorderSide(width: 1, color: Colors.black)),
                            child: Container(
                                margin: EdgeInsets.all(7),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        counter += 1;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 14,
                                    ))),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      widget.cart_brand,
                    ),
                  ),
                  new Container(
                    padding: EdgeInsets.only(left: 80),
                    child: new Text(widget.cart_price),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
