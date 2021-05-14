import 'package:flutter/material.dart';
import 'package:market_nusantara/views/bottom_navigation.dart';
import 'package:market_nusantara/views/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  bool _obsecureText = true;
  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
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
                    "MASUK",
                    style: TextStyle(
                        color: Color(0xff36C6CE),
                        fontFamily: "Popppins",
                        fontSize: 48,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xff2CCACA),
                              Color(0xffFF1192)
                            ])),
                    //0xff2CCACA : 0xff5D11FF
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            TextFormField(
                              onChanged: (value) {
                                email = value.trim();
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 5),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.purpleAccent,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Masukan Email Anda",
                                  hintStyle: TextStyle(
                                      fontFamily: 'Poppins', fontSize: 12)),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Kata Sandi",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            TextFormField(
                              onChanged: (value) {
                                password = value.trim();
                              },
                              obscureText: _obsecureText,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      _toggle();
                                    },
                                    child: Icon((_obsecureText)
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 5),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.purpleAccent,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Masukan Kata Sandi Anda",
                                  hintStyle: TextStyle(
                                      fontFamily: 'Poppins', fontSize: 12)),
                            )
                          ],
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return BottomNavigation();
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              height: 33,
                              width: 153,
                              child: Center(
                                child: Text(
                                  "MASUK",
                                  style: TextStyle(
                                      color: Color(0xff894BF9),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Belum memiliki akun? ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return RegisterPage();
                                }));
                              },
                              child: Text(
                                "Daftar disini! ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
