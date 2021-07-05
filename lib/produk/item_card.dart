import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/views/detail_page.dart';

class ItemCard extends StatefulWidget {
  ItemCard(this.nama, this.merek, this.tipe, this.harga, this.jumlah,
      this.gambar, this.detail, this.dibuat, this.terjual);

  final String nama;
  final String merek;
  final String tipe;
  final int harga;
  final int jumlah;
  final String gambar;
  final String detail;
  final Timestamp dibuat;
  final Timestamp terjual;

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailPage(
              widget.nama,
              widget.merek,
              widget.tipe,
              widget.harga,
              widget.jumlah,
              widget.gambar,
              widget.detail,
              widget.dibuat,
              widget.terjual);
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
              Image(fit: BoxFit.fitHeight, image: NetworkImage(widget.gambar)),
              Text(
                widget.nama,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
