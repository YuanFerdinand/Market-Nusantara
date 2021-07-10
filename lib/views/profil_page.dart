import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:market_nusantara/model/auth.dart';
import 'package:market_nusantara/model/database.dart';
import 'package:market_nusantara/views/Setting_page.dart';
import 'package:market_nusantara/views/bayar_page.dart';
import 'package:market_nusantara/views/dikirim_page.dart';
import 'package:market_nusantara/views/diproses_page.dart';
import 'package:market_nusantara/views/diterima_page.dart';
import 'package:market_nusantara/views/toko_page.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  var imageDir;
  String myPict = "DEFAULT", def = "DEFAULT";
  String myUserName,
      myEmail = "DEFAULT",
      myCredentialId = "DEFAULT",
      myLogedIn = "USER";

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
    myCredentialId = await SharedPreferenceHelper().getUserCredentialId();
    myPict = await SharedPreferenceHelper().getUserProfilePicture();
    myLogedIn = await SharedPreferenceHelper().getLogedIn();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2CCACA),
        title: Text("Profile"),
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
                                    _users.doc(myCredentialId).update({
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
                                    _users.doc(myCredentialId).update({
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
                child: (myLogedIn == "Admin")
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
                                  child: Text("Buka Toko Penjualan"),
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
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(width: 3, color: Color(0xff2CCACA))),
                elevation: 7,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
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
                                  return BayarPage();
                                }));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/belumdibayar.png"))),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return BayarPage();
                                  }));
                                },
                                child: Text("Bayar"))
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
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                      image:
                                          AssetImage("assets/diproses.png"))),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DiprosesPage();
                                  }));
                                },
                                child: Text("Diproses"))
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
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                      image: AssetImage("assets/dikirim.jpg"))),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DikirimPage();
                                  }));
                                },
                                child: Text("Dikirim"))
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
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                      image:
                                          AssetImage("assets/diterima.png"))),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DiterimaPage();
                                  }));
                                },
                                child: Text("Diterima"))
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
