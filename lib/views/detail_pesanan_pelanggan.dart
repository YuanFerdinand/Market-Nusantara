import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:market_nusantara/model/database.dart';

class PesananPelanggan extends StatefulWidget {
  PesananPelanggan(
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
  _PesananPelangganState createState() => _PesananPelangganState();
}

class _PesananPelangganState extends State<PesananPelanggan> {
  String myLogedIn = "MYLOGEDIN", myUserCredential = "USERCREDENTIAL";
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pesanan"),
        elevation: 0.0,
        backgroundColor: Color(0xff2CCACA),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0xff2CCACA), Color(0xffFF1192)])),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.97,
                    height: MediaQuery.of(context).size.height * 0.55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.tipe,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  widget.nama,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 20, top: 50, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Image(
                          image: NetworkImage(widget.gambar),
                          // height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                        )
                      ],
                    )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Status : " + widget.status,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Tanggal Pembelian : " +
                            widget.terjual.toDate().toString().substring(0, 16),
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Price : Rp." + widget.harga.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 60,
                        width: 300,
                        child: Center(
                          child: (widget.status == "Dikirim")
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Map<String, dynamic> updateStatus = {
                                      'status': "Diterima",
                                    };
                                    DatabaseMethods().updateStatusPesananMasuk(
                                        widget.barangUid, updateStatus);
                                    // DatabaseMethods()
                                    //     .updateStatusRiwayatPembelian(
                                    //         myUserCredential,
                                    //         widget.barangUid,
                                    //         updateStatus);
                                  },
                                  child: Text(
                                    (widget.status == "Menunggu Pembayaran")
                                        ? "Harap Melakukan Pembayaran"
                                        : (widget.status == "Diproses")
                                            ? "Pesanan Sedang Diproses"
                                            : (widget.status == "Dikirim")
                                                ? "Konfirmasi Pesanan Diterima"
                                                : "Selesai",
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900),
                                  ),
                                )
                              : Text(
                                  (widget.status == "Menunggu Pembayaran")
                                      ? "Harap Melakukan Pembayaran"
                                      : (widget.status == "Diproses")
                                          ? "Pesanan Sedang Diproses"
                                          : (widget.status == "Dikirim")
                                              ? "Konfirmasi Pesanan Diterima"
                                              : "Selesai",
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900),
                                ),
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
