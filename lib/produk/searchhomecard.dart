import 'package:flutter/material.dart';

class SearchHomeCard extends StatefulWidget {
  final data;
  SearchHomeCard(this.data);

  @override
  _SearchHomeCardState createState() => _SearchHomeCardState();
}

class _SearchHomeCardState extends State<SearchHomeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 2.0,
        child: Container(
            child: Center(
                child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.3,
                          child:
                              Image(image: NetworkImage(widget.data['gambar'])),
                        ),
                        SizedBox(),
                        Text(
                          widget.data['nama'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    )))));
  }
}
