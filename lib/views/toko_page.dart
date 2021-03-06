import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/locale/locale_keys.g.dart';
import 'package:market_nusantara/produk/item_card.dart';
import 'package:market_nusantara/produk/item_card_edit_barang.dart';
import 'package:market_nusantara/views/add_item_page.dart';
import 'package:easy_localization/easy_localization.dart';

class TokoPage extends StatefulWidget {
  @override
  _TokoPageState createState() => _TokoPageState();
}

class _TokoPageState extends State<TokoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2CCACA),
        title: Text(LocaleKeys.toko_anda).tr(),
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
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 0.8,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("barang")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            shrinkWrap: true,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot documentSnapshot =
                                  snapshot.data.docs[index];
                              return ItemCardEditBarang(
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
                                  documentSnapshot["searchKey"]);
                            });
                      } else {
                        return Center(
                            child: Text(
                          LocaleKeys.belum_ada.tr(),
                          style: TextStyle(fontFamily: "Poppins", fontSize: 15),
                        ));
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
