import 'package:flutter/material.dart';
import 'package:market_nusantara/model/auth.dart';
import 'package:market_nusantara/views/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email, password, username;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  bool _obsecureText = true;
  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Form(
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
                      "DAFTAR",
                      style: TextStyle(
                          color: Colors.white,
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
                          color: Colors.white),
                      //0xff2CCACA : 0xff5D11FF
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Nama",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2CCACA)),
                                ),
                              ),
                              TextFormField(
                                controller: usernameController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 5),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.purpleAccent,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Masukan Nama Anda",
                                    hintStyle: TextStyle(
                                        fontFamily: 'Poppins', fontSize: 12)),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2CCACA)),
                                ),
                              ),
                              TextFormField(
                                controller: emailController,
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
                                        borderRadius:
                                            BorderRadius.circular(50)),
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
                                      color: Color(0xff2CCACA)),
                                ),
                              ),
                              TextFormField(
                                controller: passwordController,
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
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Masukan Kata Sandi Anda",
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
                                  "Ketik Ulang Kata Sandi",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2CCACA)),
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
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Masukan Kembali Kata Sandi Anda",
                                    hintStyle: TextStyle(
                                        fontFamily: 'Poppins', fontSize: 12)),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              (passwordController.text == password)
                                  ? Auth().signUp(
                                      emailController.text,
                                      passwordController.text,
                                      usernameController.text,
                                      context)
                                  : print("Password yang dimasukan berbeda");

                              Fluttertoast.showToast(
                                  msg: 'Akun berhasil dibuat, silahkan login',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM);
                            },
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff2CCACA),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                height: 33,
                                width: 153,
                                child: Center(
                                  child: Text(
                                    "DAFTAR",
                                    style: TextStyle(
                                        color: Colors.white,
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
                                "Sudah punya akun? ",
                                style: TextStyle(
                                  color: Color(0xff2CCACA),
                                  fontSize: 11,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LoginPage();
                                  }));
                                },
                                child: Text(
                                  "Masuk disini! ",
                                  style: TextStyle(
                                      color: Color(0xff2CCACA),
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
        ),
      ]),
    );
  }
}
