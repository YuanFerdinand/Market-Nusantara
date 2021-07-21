import 'package:flutter/material.dart';
import 'package:market_nusantara/locale/locale_keys.g.dart';
import 'package:market_nusantara/views/Setting_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2CCACA),
        title: Text(LocaleKeys.bahasa).tr(),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) {
              return SettingPage();
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
              onTap: () async => {
                context.setLocale(Locale('id')),
                Fluttertoast.showToast(
                    msg: 'Berhasil',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM)
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Indonesia",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async => {
                context.setLocale(Locale('en')),
                Fluttertoast.showToast(
                    msg: 'Successful',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM)
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "English",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async => {
                context.setLocale(Locale('pl')),
                Fluttertoast.showToast(
                    msg: 'odnoszący sukcesy',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM)
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Polandia",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
