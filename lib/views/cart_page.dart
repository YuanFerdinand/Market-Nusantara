import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:market_nusantara/produk/keranjangCard.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var db;
  String myUserCredential = "USERCREDENTIAL", myTotal = "0";
  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  getMyInfoFromSharedPreferences() async {
    myUserCredential = await SharedPreferenceHelper().getUserCredentialId();

    myTotal = await SharedPreferenceHelper().getTotal();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore dbfirebase = FirebaseFirestore.instance;
    CollectionReference total = dbfirebase.collection('users');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2CCACA),
        title: Text(
          "Keranjang",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("keranjang")
                      .doc(myUserCredential)
                      .collection('barang')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot documentSnapshot =
                                snapshot.data.docs[index];
                            return KeranjangCard(
                                documentSnapshot["nama"],
                                documentSnapshot["merek"],
                                documentSnapshot["tipe"],
                                documentSnapshot["harga"],
                                documentSnapshot["jumlah"],
                                documentSnapshot["gambar"],
                                documentSnapshot["detail"],
                                documentSnapshot["dibuat"],
                                documentSnapshot["terjual"]);
                          });
                    } else {
                      return Center(
                          child: Text(
                        'Belum ada Barang',
                        style: TextStyle(fontFamily: "Poppins", fontSize: 15),
                      ));
                    }
                  }),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.02),
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Color(0xff2CCACA),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text("PESAN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)))),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: StreamBuilder<DocumentSnapshot>(
                                stream: total.doc(myUserCredential).snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Text(
                                      "Rp. " +
                                          snapshot.data['totalCheckout']
                                              .toString(),
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
                          )),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
