import 'package:flutter/material.dart';

class DikirimPage extends StatefulWidget {
  @override
  _DikirimPageState createState() => _DikirimPageState();
}

class _DikirimPageState extends State<DikirimPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dikirim"),
        elevation: 0.0,
        backgroundColor: Color(0xff2CCACA),
      ),
      extendBodyBehindAppBar: false,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0xff2CCACA), Color(0xffFF1192)])),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.97,
                    height: MediaQuery.of(context).size.height * 0.55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Prosesor",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "CORE i7-10700K",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 20, top: 50, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/corei7.png"),
                          // height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                        )
                      ],
                    )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Status : DIKIRIM",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Last Status Update : 06 - Mei - 2021",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Price : 9.200.00",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 33,
                        width: 153,
                        child: Center(
                          child: Text(
                            "Send Items",
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 15,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
