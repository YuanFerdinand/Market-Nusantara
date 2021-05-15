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
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60, bottom: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 3, color: Color(0xff2CCACA)),
                    borderRadius: BorderRadius.circular(100)),
                elevation: 15,
                child: Container(
                  //margin: EdgeInsets.only(top: 60, bottom: 30),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image: AssetImage("assets/magnus.jpg"),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 20, top: 30),
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
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(width: 3, color: Color(0xff2CCACA))),
              elevation: 7,
              child: Container(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
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
                                height: 30,
                                width: 30,
                                child: Image(
                                    image:
                                        AssetImage("assets/belumdibayar.png"))),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return BayarPage();
                                }));
                              },
                              child: Text("Bayar"))
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
                                height: 30,
                                width: 30,
                                child: Image(
                                    image: AssetImage("assets/diproses.png"))),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DiprosesPage();
                                }));
                              },
                              child: Text("Diproses"))
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
                                height: 30,
                                width: 30,
                                child: Image(
                                    image: AssetImage("assets/dikirim.jpg"))),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DikirimPage();
                                }));
                              },
                              child: Text("Dikirim"))
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
                                height: 30,
                                width: 30,
                                child: Image(
                                    image: AssetImage("assets/diterima.png"))),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DiterimaPage();
                                }));
                              },
                              child: Text("Diterima"))
                        ],
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
