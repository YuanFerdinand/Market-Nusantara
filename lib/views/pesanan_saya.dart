import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:market_nusantara/produk/item_card_history_pelanggan.dart';
import 'package:market_nusantara/produk/item_card_pesanan_pelanggan.dart';

class PesananSaya extends StatefulWidget {
  @override
  _PesananSayaState createState() => _PesananSayaState();
}

class _PesananSayaState extends State<PesananSaya> {
  String myLogedIn = "ROLEID", myUserCredential = "USERCREDENTIAL";
  @override
  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  getMyInfoFromSharedPreferences() async {
    myLogedIn = await SharedPreferenceHelper().getLogedIn();
    myUserCredential = await SharedPreferenceHelper().getUserCredentialId();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore dbBarang = FirebaseFirestore.instance;
    CollectionReference barang = dbBarang.collection('pesananMasuk');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2CCACA),
        title: Text("Pesanan Saya"),
      ),
      body: Center(
        child: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: StreamBuilder(
                stream: barang
                    .where('pemesan', isEqualTo: myUserCredential)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data.docs[index];
                          return ItemCardHistory(
                              documentSnapshot["nama"],
                              documentSnapshot["merek"],
                              documentSnapshot["tipe"],
                              documentSnapshot["harga"],
                              documentSnapshot["jumlah"],
                              documentSnapshot["gambar"],
                              documentSnapshot["detail"],
                              documentSnapshot["dibuat"],
                              documentSnapshot["terjual"],
                              documentSnapshot["barangUid"],
                              documentSnapshot["status"]);
                        });
                  } else {
                    return Center(
                        child: Text(
                      'Belum ada Barang',
                      style: TextStyle(fontFamily: "Poppins", fontSize: 15),
                    ));
                  }
                })),
      ),
    );
  }
}
