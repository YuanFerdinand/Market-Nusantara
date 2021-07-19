import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:market_nusantara/views/detail_pesanan_masuk.dart';
import 'package:market_nusantara/views/detail_pesanan_pelanggan.dart';

class ItemCardHistory extends StatefulWidget {
  ItemCardHistory(
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
  _ItemCardHistoryState createState() => _ItemCardHistoryState();
}

class _ItemCardHistoryState extends State<ItemCardHistory> {
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
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.20,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(width: 5, color: Color(0xff2CCACA))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.gambar),
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: MediaQuery.of(context).size.width * 0.30),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: MediaQuery.of(context).size.height * 0.17,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Barang : " + widget.nama,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Status Pembelian : " + widget.status,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Harga Pembelian : Rp. " + widget.harga.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Tanggal Pembelian : " +
                            widget.terjual.toDate().toString().substring(0, 11),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Jam Pembelian : " +
                            widget.terjual
                                .toDate()
                                .toString()
                                .substring(11, 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Kode Pembelian : INV" + widget.barangUid,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
