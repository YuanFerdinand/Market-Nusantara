import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:market_nusantara/model/database.dart';
import 'package:market_nusantara/views/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return auth.currentUser;
  }

  Future signUp(String email, String password, String username,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User userDetail = userCredential.user;

      if (userCredential != null) {
        // SharedPreferenceHelper().saveUserEmail(userDetail.email);
        // SharedPreferenceHelper().saveUserId(userDetail.uid);
        // SharedPreferenceHelper().saveUserName(name);
        // SharedPreferenceHelper().saveOriginName(origin);

        Map<String, dynamic> userInfoMap = {
          "email": userDetail.email,
          "name": username,
          "logedIn": "pelanggan",
          "profilePict": "DEFAULT",
          "totalCheckout": 0,
          "namaToko": "NAMA TOKO",
          "alamat": "ALAMAT",
          "nomorTelp": "NOMOR TELEPON",
          "nomorRekening": "NOMOR REKENING",
          "namaBank": "NAMA BANK",
          "tagihan": 0
        };

        DatabaseMethods()
            .tambahInfoAkun(userCredential.user.uid, userInfoMap)
            .then((value) {
          Navigator.pop(context);
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Gagal membuat akun'),
              content: Text('Email tersebut sudah terdaftar'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);

                    //
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future signIn(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User userDetail = userCredential.user;

      QuerySnapshot querySnapshot =
          await DatabaseMethods().getUserInfo(userDetail.email);

      if (userCredential != null) {
        // CollectionReference _users = _firestore.collection('users');
        // String myBool = "false";
        SharedPreferenceHelper().saveUserEmail(userDetail.email);
        SharedPreferenceHelper().saveUserId(userDetail.uid);
        SharedPreferenceHelper().saveUserCredentialId(userCredential.user.uid);
        SharedPreferenceHelper().saveUserName(querySnapshot.docs[0]['name']);
        SharedPreferenceHelper().saveLogedIn(querySnapshot.docs[0]['logedIn']);
        SharedPreferenceHelper()
            .saveProfilePicture(querySnapshot.docs[0]['profilePict']);

        SharedPreferenceHelper().saveAlamat(querySnapshot.docs[0]['alamat']);
        SharedPreferenceHelper().saveBank(querySnapshot.docs[0]['namaBank']);
        SharedPreferenceHelper().saveToko(querySnapshot.docs[0]['namaToko']);
        SharedPreferenceHelper()
            .saveRekening(querySnapshot.docs[0]['nomorRekening']);
        SharedPreferenceHelper().saveTelp(querySnapshot.docs[0]['nomorTelp']);

        // myBool = await SharedPreferenceHelper().getLogedIn();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => BottomNavigation()));

        // print('XXXXXXXXXX disini');
        // print(myBool);
        // print('XXXXXXXXXX disini');

        // if (myBool == 'false') {
        //   print("1 login");
        // } else {
        //   print("2 login");
        //   Auth().toSignOut(context);
        // }
        // _users
        //     .doc(userDetail.uid)
        //     .update({
        //       'logedIn': "true",
        //     })
        //     .then((value) => print("User Login"))
        //     .catchError((error) => print("Gagal login"));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Gagal masuk'),
              content: Text('Email tidak ditemukan'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Gagal masuk'),
              content: Text('Password salah'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  Future toSignOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    auth.signOut();
    preferences.clear();
    Future.delayed(const Duration(milliseconds: 500), () {
      RestartWidget.restartApp(context);
    });

    //return new LoginPage();
  }
}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
