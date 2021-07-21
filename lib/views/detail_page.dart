import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:market_nusantara/model/database.dart';
import 'package:market_nusantara/views/cart_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailPage extends StatefulWidget {
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

  //// Pointer to Update Function
  // final Function onUpdate;
  // //// Pointer to Delete Function
  // final Function onDelete;

  DetailPage(
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
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var db;
  int counter = 0;
  bool fav = false;
  String myUserName, myEmail, myUserCredential, myLogedIn;

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myUserCredential = await SharedPreferenceHelper().getUserCredentialId();
    myLogedIn = await SharedPreferenceHelper().getLogedIn();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deskripsi"),
        elevation: 0.0,
        backgroundColor: Color(0xff2CCACA),
      ),
      extendBodyBehindAppBar: false,
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
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        (myLogedIn != "admin")
                            ? Padding(
                                padding: const EdgeInsets.only(top: 170),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Map<String, dynamic> favoritInfoMap = {
                                          "nama": widget.nama,
                                          "merek": widget.merek,
                                          "tipe": widget.tipe,
                                          "harga": widget.harga,
                                          "jumlah": widget.jumlah,
                                          "gambar": widget.gambar,
                                          "detail": widget.detail,
                                          "dibuat": DateTime.now(),
                                          "terjual": null,
                                          "favorit": "Difavoritkan",
                                          "barangUid": widget.barangUid,
                                          "searchKey": widget.searchKey,
                                        };
                                        DatabaseMethods().tambahFavorit(
                                            widget.nama,
                                            myUserCredential,
                                            favoritInfoMap);
                                      });
                                      Fluttertoast.showToast(
                                          msg: 'Tercatat di list',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM);
                                    },
                                    child: (fav)
                                        ? Icon(
                                            Icons.favorite_border_outlined,
                                            size: 45,
                                          )
                                        : Icon(
                                            Icons.favorite,
                                            color: Colors.pink,
                                            size: 45,
                                          )),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(top: 190),
                                child: SizedBox(),
                              ),
                        Image(
                          image: NetworkImage(widget.gambar),
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.4,
                        )
                      ],
                    )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Spesifikasi",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Rp. " + widget.harga.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        widget.detail,
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
          (myLogedIn != "admin")
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Container(
                        width: 600,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (counter != 0)
                                ? GestureDetector(
                                    onTap: () {
                                      String barangUid = getRandomString(25);
                                      Map<String, dynamic> tambahKeranjang = {
                                        "nama": widget.nama,
                                        "detail": widget.detail,
                                        "tipe": widget.tipe,
                                        "dibuat": widget.dibuat,
                                        "gambar": widget.gambar,
                                        "harga": widget.harga * counter,
                                        "jumlah": counter,
                                        "merek": widget.merek,
                                        "terjual": null,
                                        "status": "Menunggu Pembayaran",
                                        "barangUid": barangUid,
                                        "searchKey": widget.nama.substring(0, 1)
                                      };
                                      Map<String, dynamic> tambahPesanan = {
                                        "nama": widget.nama,
                                        "detail": widget.detail,
                                        "tipe": widget.tipe,
                                        "dibuat": widget.dibuat,
                                        "gambar": widget.gambar,
                                        "harga": widget.harga * counter,
                                        "jumlah": counter,
                                        "merek": widget.merek,
                                        "terjual": DateTime.now(),
                                        "status": "Menunggu Pembayaran",
                                        "barangUid": barangUid,
                                        "searchKey":
                                            widget.nama.substring(0, 1),
                                        "pemesan": myUserCredential
                                      };
                                      Map<String, dynamic> tambahTotalCheckout =
                                          {
                                        "totalCheckout": FieldValue.increment(
                                            widget.harga * counter)
                                      };
                                      Map<String, dynamic> updateStokBarang = {
                                        "jumlah": FieldValue.increment(-counter)
                                      };
                                      Map<String, dynamic>
                                          tambahTagihanPengguna = {
                                        "tagihan": FieldValue.increment(
                                            widget.harga * counter)
                                      };

                                      DatabaseMethods().updateHargaCheckout(
                                          myUserCredential,
                                          tambahTagihanPengguna);
                                      DatabaseMethods().updateMinusStok(
                                          widget.nama, updateStokBarang);
                                      DatabaseMethods().pesananMasuk(
                                          barangUid, tambahPesanan);

                                      DatabaseMethods().tambahKeranjang(
                                          barangUid,
                                          myUserCredential,
                                          tambahKeranjang);
                                      DatabaseMethods().updateHargaCheckout(
                                          myUserCredential,
                                          tambahTotalCheckout);
                                    },
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: BorderSide(
                                                width: 1, color: Colors.black)),
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Icon(Icons
                                                .add_shopping_cart_rounded))),
                                  )
                                : Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                            width: 1, color: Colors.black)),
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.add_shopping_cart_rounded,
                                          color: Colors.grey,
                                        ))),
                            (counter != 0)
                                ? GestureDetector(
                                    onTap: () {
                                      String barangUid = getRandomString(25);
                                      Map<String, dynamic> tambahKeranjang = {
                                        "nama": widget.nama,
                                        "detail": widget.detail,
                                        "tipe": widget.tipe,
                                        "dibuat": widget.dibuat,
                                        "gambar": widget.gambar,
                                        "harga": widget.harga * counter,
                                        "jumlah": counter,
                                        "merek": widget.merek,
                                        "terjual": null,
                                        "status": "Menunggu Pembayaran",
                                        "barangUid": barangUid,
                                        "searchKey": widget.nama.substring(0, 1)
                                      };
                                      Map<String, dynamic> tambahPesanan = {
                                        "nama": widget.nama,
                                        "detail": widget.detail,
                                        "tipe": widget.tipe,
                                        "dibuat": widget.dibuat,
                                        "gambar": widget.gambar,
                                        "harga": widget.harga * counter,
                                        "jumlah": counter,
                                        "merek": widget.merek,
                                        "terjual": DateTime.now(),
                                        "status": "Menunggu Pembayaran",
                                        "barangUid": barangUid,
                                        "searchKey":
                                            widget.nama.substring(0, 1),
                                        "pemesan": myUserCredential
                                      };
                                      Map<String, dynamic> tambahTotalCheckout =
                                          {
                                        "totalCheckout": FieldValue.increment(
                                            widget.harga * counter)
                                      };
                                      Map<String, dynamic> updateStokBarang = {
                                        "jumlah": FieldValue.increment(-counter)
                                      };
                                      Map<String, dynamic>
                                          tambahTagihanPengguna = {
                                        "tagihan": FieldValue.increment(
                                            widget.harga * counter)
                                      };

                                      DatabaseMethods().updateHargaCheckout(
                                          myUserCredential,
                                          tambahTagihanPengguna);
                                      DatabaseMethods().updateMinusStok(
                                          widget.nama, updateStokBarang);
                                      DatabaseMethods().pesananMasuk(
                                          barangUid, tambahPesanan);

                                      DatabaseMethods().tambahKeranjang(
                                          barangUid,
                                          myUserCredential,
                                          tambahKeranjang);
                                      DatabaseMethods().updateHargaCheckout(
                                          myUserCredential,
                                          tambahTotalCheckout);

                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return CartPage();
                                      }));
                                    },
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // side: BorderSide(
                                          //     width: 1, color: Colors.black)
                                        ),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xff2CCACA),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            // padding: EdgeInsets.only(top: 10, bottom: 10),
                                            child: Center(
                                              child: Text("BELI SEKARANG",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20)),
                                            ))),
                                  )
                                : Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      // side: BorderSide(
                                      //     width: 1, color: Colors.black)
                                    ),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        // padding: EdgeInsets.only(top: 10, bottom: 10),
                                        child: Center(
                                          child: Text("BELI SEKARANG",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ))),
                            Container(
                              // margin: EdgeInsets.only(
                              //     top: MediaQuery.of(context).size.width * 0.05,
                              //     bottom: MediaQuery.of(context).size.width * 0.2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      if (counter > 1) {
                                        setState(() {
                                          counter -= 1;
                                        });
                                      } else {
                                        setState(() {
                                          counter = 0;
                                        });
                                      }
                                    },
                                    child: Card(
                                      color: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                          margin: EdgeInsets.all(10),
                                          child: GestureDetector(
                                              onTap: () {
                                                if (counter > 0) {
                                                  setState(() {
                                                    counter -= 1;
                                                  });
                                                } else {
                                                  setState(() {
                                                    counter = 0;
                                                  });
                                                }
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ))),
                                    ),
                                  ),
                                  Text("  " + counter.toString() + "  ",
                                      style: TextStyle(fontSize: 25)),
                                  GestureDetector(
                                    onTap: () {
                                      if (counter <= widget.jumlah) {
                                        setState(() {
                                          counter += 1;
                                        });
                                      } else {
                                        setState(() {
                                          counter += 0;
                                        });
                                      }
                                    },
                                    child: Card(
                                      color: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                          margin: EdgeInsets.all(10),
                                          child: GestureDetector(
                                              onTap: () {
                                                if (counter < widget.jumlah) {
                                                  setState(() {
                                                    counter += 1;
                                                  });
                                                } else {
                                                  setState(() {
                                                    counter += 0;
                                                  });
                                                }
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox()
        ],
      ),
    );
  }
}
