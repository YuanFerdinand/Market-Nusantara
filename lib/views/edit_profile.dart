//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:market_nusantara/locale/locale_keys.g.dart';
import 'package:market_nusantara/model/auth.dart';
import 'package:market_nusantara/model/database.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String namaUser, toko, alamatUser, bank, myUserCredential;
  int rek, telp;
  var imageDir;
  TextEditingController nama = new TextEditingController();
  TextEditingController namaToko = new TextEditingController();
  TextEditingController nomorRekening = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController nomorTelp = new TextEditingController();
  TextEditingController namaBank = new TextEditingController();
  @override
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
                    //   color: Color(0xFF030303),
                    //   width: 5.0, // Underline thickness
                    // ))),
                    child: Text(
                      LocaleKeys.Edit_Profile.tr(),
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
                          controller: nama,
                          onChanged: (nama) {
                            this.namaUser = nama;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: LocaleKeys.masukkan_nama.tr(),
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
                          controller: namaToko,
                          onChanged: (namaToko) {
                            this.toko = namaToko;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: LocaleKeys.masukan_nama_toko.tr(),
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        TextFormField(
                          controller: alamat,
                          onChanged: (alamat) {
                            this.alamatUser = alamat;
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.streetAddress,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: LocaleKeys.masukan_nama_alamat.tr(),
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        TextFormField(
                          controller: nomorTelp,
                          onChanged: (nomorTelp) {
                            this.telp = int.tryParse(nomorTelp);
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
                              hintText: LocaleKeys.masukkan_no_telepon.tr(),
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        TextFormField(
                          controller: namaBank,
                          onChanged: (namaBank) {
                            this.bank = namaBank;
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
                              hintText: LocaleKeys.masukan_nama_bank.tr(),
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 25,
                        ),
                        TextFormField(
                          controller: nomorRekening,
                          onChanged: (nomorRekening) {
                            this.rek = int.tryParse(nomorRekening);
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
                              hintText: LocaleKeys.masukkan_nama_rekening.tr(),
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
                                Map<String, dynamic> infoProfile = {
                                  "name": namaUser,
                                  "namaToko": toko,
                                  "alamat": alamatUser,
                                  "nomorTelp": telp.toString(),
                                  "nomorRekening": rek.toString(),
                                  "namaBank": bank,
                                };
                                Map<String, dynamic> infoToko = {
                                  "namaAdmin": namaUser,
                                  "nomorTelp": telp.toString(),
                                  "nomorRekening": rek.toString(),
                                  "namaBank": bank,
                                };
                                DatabaseMethods().addInfoToko(infoToko);
                                DatabaseMethods().updateInfoAkun(
                                    myUserCredential, infoProfile);
                                Auth().toSignOut(context);
                                Fluttertoast.showToast(
                                    msg: 'Profil telah di update',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM);
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
                                    LocaleKeys.update_profil.tr(),
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
