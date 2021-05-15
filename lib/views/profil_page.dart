import 'package:flutter/material.dart';
import 'package:market_nusantara/views/add_item_page.dart';
import 'package:market_nusantara/views/bayar_page.dart';
import 'package:market_nusantara/views/dikirim_page.dart';
import 'package:market_nusantara/views/diproses_page.dart';
import 'package:market_nusantara/views/diterima_page.dart';
import 'package:market_nusantara/views/login_page.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2CCACA),
        title: Text("Profile"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddItemPage();
                }));
              }),
          IconButton(
              icon: Icon(
                Icons.exit_to_app,
                size: 35,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              }),
        ],
      ),
      body: ListView(children: [
        Center(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  margin: EdgeInsets.only(top: 60, bottom: 30),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image: AssetImage("assets/magnus.jpg"),
                          fit: BoxFit.cover)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xff2CCACA),
                ),
                child: Text(
                  "Magnus Carlsen",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.5,
                margin: EdgeInsets.only(bottom: 70),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffFF1192)),
                child: Center(
                  child: Text(
                    " AIRO Corps. ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 7,
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return BayarPage();
                                }));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  height: 50,
                                  width: 50,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/belumdibayar.png"))),
                            ),
                            Text("Bayar")
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DiprosesPage();
                                }));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  height: 50,
                                  width: 50,
                                  child: Image(
                                      image:
                                          AssetImage("assets/diproses.png"))),
                            ),
                            Text("Diproses")
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DikirimPage();
                                }));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  height: 50,
                                  width: 50,
                                  child: Image(
                                      image: AssetImage("assets/dikirim.jpg"))),
                            ),
                            Text("Dikirim")
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DiterimaPage();
                                }));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  height: 50,
                                  width: 50,
                                  child: Image(
                                      image:
                                          AssetImage("assets/diterima.png"))),
                            ),
                            Text("Diterima")
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
