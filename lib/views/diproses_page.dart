import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'add_item_page.dart';
import 'profil_page.dart';

class DiprosesPage extends StatefulWidget {
  @override
  _DiprosesPageState createState() => _DiprosesPageState();
}

class _DiprosesPageState extends State<DiprosesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2CCACA),
          title: Text("Barang Diproses"),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return ProfilPage();
                  }));
                }),
          ],
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color(0xff2CCACA),
            Color(0xFF11A0FF),
            Color(0xE5FF11D7),
            Color(0xE5FF1194)
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Processor",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Text(
                      "CORE i9-190900KF",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child:
                                Image(image: AssetImage("assets/intel9.png")))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
              ))
            ],
          ),
        ));
  }
}
