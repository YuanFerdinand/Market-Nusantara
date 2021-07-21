import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/views/detail_page.dart';
import 'package:market_nusantara/views/edit_barang.dart';

class ItemCardEditBarang extends StatefulWidget {
  ItemCardEditBarang(
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
      this.searchKey);

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
  final String searchKey;

  @override
  _ItemCardEditBarangState createState() => _ItemCardEditBarangState();
}

class _ItemCardEditBarangState extends State<ItemCardEditBarang> {
  @override
  Widget build(BuildContext context) {
    return (widget.jumlah > 0)
        ? GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditBarang(
                  widget.nama,
                );
              }));
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.gambar),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.30),
                    Text(
                      widget.nama,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          )
        : Stack(
            fit: StackFit.expand,
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget.gambar),
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.30),
                      Text(
                        widget.nama,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      child: Image(
                        image: AssetImage("assets/soldout.png"),
                        width: 200,
                        height: 200,
                      )))
            ],
          );
  }
}
