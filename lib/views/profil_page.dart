import 'package:flutter/material.dart';
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
      ),
      body: Center(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                margin: EdgeInsets.only(top: 60, bottom: 60),
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
              width: MediaQuery.of(context).size.width * 0.5,
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(color: Color(0xffDAA520)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "  You're a Gold User!",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
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
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              child: Text("LOGOUT"),
            )
          ],
        ),
      ),
    );
  }
}
