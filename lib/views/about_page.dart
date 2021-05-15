import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "About",
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "developper",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/nama.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Container(
                //margin: EdgeInsets.only(top: 60, bottom: 30),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/logo.png"),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
