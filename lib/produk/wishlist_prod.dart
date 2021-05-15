import 'package:flutter/material.dart';
import 'package:market_nusantara/views/Detail_Page.dart';

class WishlishProdPage extends StatefulWidget {
  @override
  _WishlishProdPageState createState() => _WishlishProdPageState();
}

class _WishlishProdPageState extends State<WishlishProdPage> {
  var processor_list = [
    {
      "picture": "assets/processor/corei3.jpg",
    },
    {
      "picture": "assets/processor/corei5.jpg",
    },
    {
      "picture": "assets/processor/corei7.jpg",
    },
    {
      "picture": "assets/processor/corei9.jpg",
    },
    {
      "picture": "assets/processor/corei9.jpg",
    },
    {
      "picture": "assets/processor/corei9.jpg",
    },
    {
      "picture": "assets/processor/corei9.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: processor_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_picture: processor_list[index]['picture'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_picture;

  Single_prod({
    this.prod_picture,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 25, left: 15, right: 15),
        child: Hero(
          tag: prod_picture,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new DetailPage())),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red[400],
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}