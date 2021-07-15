import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:market_nusantara/model/database.dart';

class KeranjangCard extends StatefulWidget {
  final String nama;
  final String merek;
  final String tipe;
  final int harga;
  final int jumlah;
  final String gambar;
  final String detail;
  final Timestamp dibuat;
  final Timestamp terjual;
  final String barangUid;

  KeranjangCard(this.nama, this.merek, this.tipe, this.harga, this.jumlah,
      this.gambar, this.detail, this.dibuat, this.terjual, this.barangUid);
  @override
  _KeranjangCardState createState() => _KeranjangCardState();
}

class _KeranjangCardState extends State<KeranjangCard> {
  String myUserCredential;
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
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.03,
          top: MediaQuery.of(context).size.height * 0.03,
          right: MediaQuery.of(context).size.width * 0.03),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              width: 2,
              color: Color(0xff2CCACA),
            )),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                color: Color(0xff2CCACA),
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Image(image: NetworkImage(widget.gambar))),
            Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.nama,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.tipe,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rp. " + widget.harga.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.merek,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Map<String, dynamic> updateStock = {
                                'jumlah': FieldValue.increment(widget.jumlah)
                              };
                              Map<String, dynamic> updateTotalCheckoutMap = {
                                'totalCheckout':
                                    FieldValue.increment(-widget.harga)
                              };

                              DatabaseMethods()
                                  .updateTambahStok(widget.nama, updateStock);
                              DatabaseMethods().hapusBarangKeranjangTerpilih(
                                  myUserCredential, widget.barangUid);
                              DatabaseMethods().updateHargaCheckout(
                                  myUserCredential, updateTotalCheckoutMap);
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
