import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';

class BayarPage extends StatefulWidget {
  @override
  _BayarPageState createState() => _BayarPageState();
}

class _BayarPageState extends State<BayarPage> {
  String myUserCredential = "USERCREDENTIAL";
  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  getMyInfoFromSharedPreferences() async {
    myUserCredential = await SharedPreferenceHelper().getUserCredentialId();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore dbInfo = FirebaseFirestore.instance;
    CollectionReference info = dbInfo.collection('dataPembayaran');
    FirebaseFirestore dbTotal = FirebaseFirestore.instance;
    CollectionReference total = dbTotal.collection('users');
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xff2CCACA),
        title: Text(
          'Payment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Center(),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: StreamBuilder<DocumentSnapshot>(
                  stream: info.doc("admin").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData)
                      return Text(
                        snapshot.data['namaBank'].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      );
                    else {
                      return Text("Mohon Tunggu");
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: StreamBuilder<DocumentSnapshot>(
                  stream: info.doc("admin").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData)
                      return Text(
                        snapshot.data['nomorRekening'].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      );
                    else {
                      return Text("Mohon Tunggu");
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: StreamBuilder<DocumentSnapshot>(
                  stream: info.doc("admin").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData)
                      return Text(
                        snapshot.data['namaAdmin'].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      );
                    else {
                      return Text("Mohon Tunggu");
                    }
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: 2,
        child: Container(
          color: Colors.transparent,
          child: Container(
            height: 550,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                boxShadow: [
                  BoxShadow(color: Colors.lightBlue, spreadRadius: 3),
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0xff2CCACA), Color(0xffFF1192)])),
            child: Column(
              children: [
                Center(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Text(
                    "Please transfer to following number with amount below: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40, left: 20, right: 20, bottom: 40),
                  child: StreamBuilder<DocumentSnapshot>(
                      stream: total.doc(myUserCredential).snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData)
                          return Text(
                            "Rp. " + snapshot.data['tagihan'].toString(),
                            style: TextStyle(
                                fontFamily: "RedHatDisplay",
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          );
                        else {
                          return Text("Mohon Tunggu");
                        }
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 35),
                  child: Text(
                    "After completing the payment, please confirm to following number with payment bill",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/etc/wa.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 20, right: 10, bottom: 13),
                    child: StreamBuilder<DocumentSnapshot>(
                        stream: info.doc("admin").snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return Text(
                              snapshot.data['nomorTelp'].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            );
                          else {
                            return Text("Mohon Tunggu");
                          }
                        }),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
