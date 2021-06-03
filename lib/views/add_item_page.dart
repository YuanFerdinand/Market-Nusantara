//import 'dart:ffi';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market_nusantara/model/database.dart';
import 'package:market_nusantara/views/bottom_navigation.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  String nama = "NAMA", merek = "MEREK", tipe = "TIPE";
  String harga = "1000000", jumlah = "1";
  String imagePath = "GAMBAR", detail = "Detail";
  var imageDir;

  Future<File> getImage() async {
    var imageFile;
    final picker = ImagePicker();
    PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      return imageDir = imageFile;
    } else {
      return imageDir = imageFile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Form(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Color(0xff2CCACA), Color(0xffFF1192)])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.only(
                      bottom: 5, // Space between underline and text
                    ),
                    // decoration: BoxDecoration(
                    //     border: Border(
                    //         bottom: BorderSide(
                    //   color: Color(0xff8142FC),
                    //   width: 5.0, // Underline thickness
                    // ))),
                    child: Text(
                      "TAMBAH BARANG",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Popppins",
                          fontSize: 24,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white),
                    //0xff2CCACA : 0xff5D11FF
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView(
                      children: [
                        TextFormField(
                          onChanged: (namaBarang) {
                            nama = DatabaseMethods().getNama(namaBarang);
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Nama",
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        TextFormField(
                          onChanged: (detailBarang) {
                            this.detail =
                                DatabaseMethods().getDetail(detailBarang);
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Detail",
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        TextFormField(
                          onChanged: (hargaBarang) {
                            this.harga =
                                DatabaseMethods().getHarga(hargaBarang);
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Harga",
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        TextFormField(
                          onChanged: (tipeBarang) {
                            this.tipe = DatabaseMethods().getTipe(tipeBarang);
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Tipe",
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        TextFormField(
                          onChanged: (merekBarang) {
                            this.merek =
                                DatabaseMethods().getMerek(merekBarang);
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Merek",
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 25,
                        ),
                        TextFormField(
                          onChanged: (jumlahBarang) {
                            this.jumlah =
                                DatabaseMethods().getJumlah(jumlahBarang);
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Jumlah",
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff2CCACA),
                                    borderRadius: BorderRadius.circular(50)),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: (imageDir == null)
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("Upload file",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18)),
                                          IconButton(
                                              icon: Icon(Icons.upload_file),
                                              color: Colors.white,
                                              iconSize: 30,
                                              onPressed: () {
                                                getImage();
                                              })
                                        ],
                                      )
                                    : Text(
                                        imageDir.toString(),
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      )),
                            GestureDetector(
                              onTap: () async {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return BottomNavigation();
                                }));
                                if (imageDir != null) {
                                  imagePath =
                                      await DatabaseMethods.getGambar(imageDir);
                                }
                                Map<String, dynamic> infoBarang = {
                                  "nama": nama,
                                  "detail": detail,
                                  "tipe": tipe,
                                  "dibuat": DateTime.now(),
                                  "gambar": imagePath,
                                  "harga": int.tryParse(this.harga),
                                  "jumlah": int.tryParse(this.jumlah),
                                  "merek": merek,
                                  "terjual": null
                                };

                                DatabaseMethods().tambahBarang(infoBarang);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: Center(
                                  child: Text(
                                    "Tambah",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
