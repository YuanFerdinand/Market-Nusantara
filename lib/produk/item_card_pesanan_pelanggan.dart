import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:market_nusantara/views/detail_pesanan_masuk.dart';
import 'package:market_nusantara/views/detail_pesanan_pelanggan.dart';

class ItemCardPesanan extends StatefulWidget {
  ItemCardPesanan(
      this.nama,
      this.merek,
      this.tipe,
      this.harga,
      this.jumlah,
      this.gambar,
      this.detail,
      this.dibuat,
      this.terjual,
      this.barangUid,
      this.status);

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
  final String status;

  @override
  _ItemCardPesananState createState() => _ItemCardPesananState();
}

class _ItemCardPesananState extends State<ItemCardPesanan> {
  String myLogedIn = "ROLEID";
  @override
  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  getMyInfoFromSharedPreferences() async {
    myLogedIn = await SharedPreferenceHelper().getLogedIn();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return (myLogedIn == "admin")
              ? PesananMasuk(
                  widget.nama,
                  widget.merek,
                  widget.tipe,
                  widget.harga,
                  widget.jumlah,
                  widget.gambar,
                  widget.detail,
                  widget.dibuat,
                  widget.terjual,
                  widget.barangUid,
                  widget.status)
              : PesananPelanggan(
                  widget.nama,
                  widget.merek,
                  widget.tipe,
                  widget.harga,
                  widget.jumlah,
                  widget.gambar,
                  widget.detail,
                  widget.dibuat,
                  widget.terjual,
                  widget.barangUid,
                  widget.status);
        }));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.gambar),
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.30),
              Text(
                widget.nama,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.status,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
