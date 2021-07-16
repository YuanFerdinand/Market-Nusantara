import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/produk/item_card.dart';

class ListMonitor extends StatefulWidget {
  @override
  _ListMonitorState createState() => _ListMonitorState();
}

class _ListMonitorState extends State<ListMonitor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2CCACA),
        title: Text("Monitor Komputer"),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("barang")
                  .where('tipe', isEqualTo: "Monitor")
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
                        return ItemCard(
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
                        );
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
      ),
    );
  }
}
