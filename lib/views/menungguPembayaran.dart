import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:market_nusantara/locale/locale_keys.g.dart';
import 'package:market_nusantara/produk/item_card_pesanan_pelanggan.dart';
import 'package:easy_localization/easy_localization.dart';

class MenungguPembayaran extends StatefulWidget {
  @override
  _MenungguPembayaranState createState() => _MenungguPembayaranState();
}

class _MenungguPembayaranState extends State<MenungguPembayaran> {
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
        title: Text(LocaleKeys.pesanan_menunggu).tr(),
      ),
      body: Center(
        child: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: StreamBuilder(
                stream: barang
                    .where('status', isEqualTo: "Menunggu Pembayaran")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        shrinkWrap: true,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data.docs[index];
                          return ItemCardPesanan(
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
