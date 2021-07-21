import 'package:flutter/material.dart';
import 'package:market_nusantara/locale/locale_keys.g.dart';
import 'package:market_nusantara/views/about_page.dart';
import 'package:market_nusantara/views/language_page.dart';
import 'package:market_nusantara/views/profil_page.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2CCACA),
          title: Text(LocaleKeys.pengaturan).tr(),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context) {
                return ProfilPage();
              }));
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LanguagePage();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.bahasa,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600]),
                    ).tr(),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AboutPage();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.tentang,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600]),
                    ).tr(),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) {
              //       return KonfirmasiBarangCardPage();
              //     }));
              //   },
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         "Konfirmasi Barang",
              //         style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.w500,
              //             color: Colors.grey[600]),
              //       ).tr(),
              //       Icon(Icons.arrow_forward)
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
