//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:market_nusantara/model/auth.dart';
import 'package:market_nusantara/model/database.dart';

class EditBarang extends StatefulWidget {
  final String nama;

  EditBarang(this.nama);
  @override
  _EditBarangState createState() => _EditBarangState();
}

class _EditBarangState extends State<EditBarang> {
  String detailBarang, hargaBarang, jumlahBarang, tipeBarang, _chosenValue;
  var imageDir;
  TextEditingController detail = new TextEditingController();
  TextEditingController harga = new TextEditingController();
  TextEditingController jumlah = new TextEditingController();
  TextEditingController tipe = new TextEditingController();

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
                      widget.nama,
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
                          controller: detail,
                          onChanged: (detail) {
                            this.detailBarang = detail;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Masukan Detail Barang",
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(500)
                          ],
                          controller: harga,
                          onChanged: (harga) {
                            this.hargaBarang = harga;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Masukan Harga Barang",
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration.collapsed(hintText: ''),
                          validator: (value) =>
                              value == null ? 'Tipe belum dipilih' : null,
                          value: _chosenValue,
                          items: [
                            'Prosesor',
                            'VGA',
                            'RAM',
                            'Case',
                            'Disk',
                            'Motherboard',
                            'Monitor',
                            'Speaker'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          hint: Text("Pilih Tipe"),
                          onChanged: (value) {
                            setState(() {
                              _chosenValue = value;
                              this.tipeBarang = _chosenValue;
                            });
                          },
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          height: 50,
                          width: 25,
                        ),
                        TextFormField(
                          controller: jumlah,
                          onChanged: (jumlah) {
                            this.jumlahBarang = jumlah;
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
                              hintText: "Masukan Jumlah Barang",
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                Map<String, dynamic> updateBarang = {
                                  "detail": detailBarang,
                                  "harga": int.tryParse(hargaBarang),
                                  "jumlah": int.tryParse(jumlahBarang),
                                  "tipe": tipeBarang,
                                };
                                DatabaseMethods().updateInfoBarang(
                                    widget.nama, updateBarang);
                                Navigator.pop(context);
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
                                    "Update Info Barang",
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
