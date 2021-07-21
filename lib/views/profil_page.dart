import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:market_nusantara/locale/locale_keys.g.dart';
import 'package:market_nusantara/model/auth.dart';
import 'package:market_nusantara/model/database.dart';
import 'package:market_nusantara/views/Setting_page.dart';
import 'package:market_nusantara/views/bayar_page.dart';
import 'package:market_nusantara/views/dikirim_page.dart';
import 'package:market_nusantara/views/diproses_page.dart';
import 'package:market_nusantara/views/diterima_page.dart';
import 'package:market_nusantara/views/edit_profile.dart';
import 'package:market_nusantara/views/menungguPembayaran.dart';
import 'package:market_nusantara/views/pesanan_saya.dart';
import 'package:market_nusantara/views/toko_page.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  var imageDir;
  String myPict = "DEFAULT", def = "DEFAULT";
  String myUserName = "DEFAULT",
      myEmail = "DEFAULT",
      myUserCredential = "DEFAULT",
      myLogedIn = "USER",
      myAlamat = "USER",
      myBank = "USER",
      myToko = "USER",
      myRekening = "USER",
      myTelp = "USER";

  @override
  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

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

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myUserCredential = await SharedPreferenceHelper().getUserCredentialId();
    myPict = await SharedPreferenceHelper().getUserProfilePicture();
    myLogedIn = await SharedPreferenceHelper().getLogedIn();
    myAlamat = await SharedPreferenceHelper().getAlamat();
    myBank = await SharedPreferenceHelper().getBank();
    myToko = await SharedPreferenceHelper().getToko();
    myRekening = await SharedPreferenceHelper().getRekening();
    myTelp = await SharedPreferenceHelper().getTelp();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2CCACA),
        title: Text(LocaleKeys.Profile).tr(),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.settings,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingPage();
                }));
              }),
          IconButton(
              icon: Icon(
                Icons.exit_to_app,
                size: 35,
              ),
              onPressed: () {
                Auth().toSignOut(context);
              }),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 40, left: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: (def != myPict)
                              ? GestureDetector(
                                  onTap: () async {
                                    File file = await getImage();
                                    (file != null)
                                        ? myPict =
                                            await DatabaseMethods.uploadGambar(
                                                file)
                                        : myPict = def;
                                    FirebaseFirestore _firestore =
                                        FirebaseFirestore.instance;
                                    CollectionReference _users =
                                        _firestore.collection('users');
                                    _users.doc(myUserCredential).update({
                                      'profilePict': myPict,
                                    });
                                    SharedPreferenceHelper()
                                        .saveProfilePicture(myPict);
                                    getMyInfoFromSharedPreferences();
                                    setState(() {});
                                  },
                                  child: Container(
                                    //margin: EdgeInsets.only(top: 60, bottom: 30),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(myPict),
                                            fit: BoxFit.cover)),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    File file = await getImage();
                                    (file != null)
                                        ? myPict =
                                            await DatabaseMethods.uploadGambar(
                                                file)
                                        : myPict = def;
                                    FirebaseFirestore _firestore =
                                        FirebaseFirestore.instance;
                                    CollectionReference _users =
                                        _firestore.collection('users');
                                    _users.doc(myUserCredential).update({
                                      'profilePict': myPict,
                                    });
                                    SharedPreferenceHelper()
                                        .saveProfilePicture(myPict);
                                    getMyInfoFromSharedPreferences();
                                    setState(() {});
                                  },
                                  child: Container(
                                    //margin: EdgeInsets.only(top: 60, bottom: 30),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/add_pp.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                )),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(bottom: 10, top: 2),
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xff2CCACA),
                              ),
                              child: Center(
                                child: Text(
                                  myUserName ?? "Tunggu..",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 10),
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffFF1192)),
                              child: Center(
                                child: Text(
                                  myLogedIn,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditProfile();
                  }));
                },
                child: Card(
                  margin: EdgeInsets.only(bottom: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(width: 3, color: Color(0xff2CCACA))),
                  elevation: 7,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Center(
                          child: Container(
                            child: Text(LocaleKeys.Edit_Profile).tr(),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return EditProfile();
                            }));
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: (myLogedIn == "admin")
                    ? Card(
                        margin: EdgeInsets.only(bottom: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side:
                                BorderSide(width: 3, color: Color(0xff2CCACA))),
                        elevation: 7,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Center(
                                child: Container(
                                  child: Text(LocaleKeys.buka_toko).tr(),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return TokoPage();
                                  }));
                                },
                                icon: Icon(
                                  Icons.arrow_forward,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TokoPage();
                  }));
                },
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.09,
              // ),
              Text(
                (myLogedIn == "admin")
                    ? LocaleKeys.pesanan_masuk.tr()
                    : LocaleKeys.pesanan_anda.tr(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Color(0xff2CCACA)),
              ),
              Container(
                height: 20,
              ),
              (myLogedIn == "admin")
                  ? Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(width: 3, color: Color(0xff2CCACA))),
                      elevation: 7,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 10),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return MenungguPembayaran();
                                      }));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            top: 20, bottom: 10),
                                        height: 30,
                                        width: 30,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/belumdibayar.png"))),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return MenungguPembayaran();
                                        }));
                                      },
                                      child: Text(LocaleKeys.bayar).tr())
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return DiprosesPage();
                                      }));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            top: 20, bottom: 10),
                                        height: 30,
                                        width: 30,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/diproses.png"))),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return DiprosesPage();
                                        }));
                                      },
                                      child: Text(LocaleKeys.diproses).tr())
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return DikirimPage();
                                      }));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            top: 20, bottom: 10),
                                        height: 30,
                                        width: 30,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/dikirim.jpg"))),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return DikirimPage();
                                        }));
                                      },
                                      child: Text(LocaleKeys.dikirim).tr())
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return DiterimaPage();
                                      }));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            top: 20, bottom: 10),
                                        height: 30,
                                        width: 30,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/diterima.png"))),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return DiterimaPage();
                                        }));
                                      },
                                      child: Text(LocaleKeys.diterima).tr())
                                ],
                              ),
                            ]),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PesananSaya();
                        }));
                      },
                      child: Card(
                        margin: EdgeInsets.only(bottom: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side:
                                BorderSide(width: 3, color: Color(0xff2CCACA))),
                        elevation: 7,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Center(
                                child: Container(
                                  child:
                                      Text(LocaleKeys.riwayat_pembelian).tr(),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return PesananSaya();
                                  }));
                                },
                                icon: Icon(
                                  Icons.arrow_forward,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
              (myLogedIn != "admin")
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BayarPage();
                        }));
                      },
                      child: Card(
                        margin: EdgeInsets.only(bottom: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side:
                                BorderSide(width: 3, color: Color(0xff2CCACA))),
                        elevation: 7,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Center(
                                child: Container(
                                  child: Text(LocaleKeys.lihat_tagihan).tr(),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return BayarPage();
                                  }));
                                },
                                icon: Icon(
                                  Icons.arrow_forward,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
