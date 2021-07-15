import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:market_nusantara/helper/constants.dart';
import 'package:market_nusantara/model/database.dart';
import 'package:market_nusantara/produk/keranjangCard.dart';
import 'package:market_nusantara/produk/chat_messages.dart';
import 'package:market_nusantara/views/bayar_page.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var db;
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController messageEditingController = new TextEditingController();
  String myUserCredential = "USERCREDENTIAL";
  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  getMyInfoFromSharedPreferences() async {
    myUserCredential = await SharedPreferenceHelper().getUserCredentialId();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore dbfirebase = FirebaseFirestore.instance;
    CollectionReference total = dbfirebase.collection('users');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2CCACA),
        title: Text(
          "Keranjang",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("keranjang")
                      .doc(myUserCredential)
                      .collection('barang')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot documentSnapshot =
                                snapshot.data.docs[index];
                            return KeranjangCard(
                              documentSnapshot["nama"],
                              documentSnapshot["merek"],
                              documentSnapshot["tipe"],
                              documentSnapshot["harga"],
                              documentSnapshot["jumlah"],
                              documentSnapshot["gambar"],
                              documentSnapshot["detail"],
                              documentSnapshot["dibuat"],
                              documentSnapshot["terjual"],
                              documentSnapshot["barangUid"],
                            );
                          });
                    } else {
                      return Center(
                          child: Text(
                        'Belum ada Barang',
                        style: TextStyle(fontFamily: "Poppins", fontSize: 15),
                      ));
                    }
                  }),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Map<String, dynamic> updateStatusBarang = {
                            "status": "Menunggu Pembayaran"
                          };
                          Map<String, dynamic> clearTotalKeranjang = {
                            "totalCheckout": 0
                          };

                          List<String> users = [
                            Constants.myName,
                            Constants.myAdmin
                          ];

                          String chatRoomId = getChatRoomId(
                              Constants.myName, Constants.myAdmin);

                          Map<String, dynamic> chatRoom = {
                            "users": users,
                            "chatRoomId": chatRoomId,
                          };

                          databaseMethods.addChatRoom(chatRoom, chatRoomId);

                          DatabaseMethods().updateHargaCheckout(
                              myUserCredential, clearTotalKeranjang);
                          DatabaseMethods().kirimDataPembelian(
                              myUserCredential, updateStatusBarang);
                          DatabaseMethods()
                              .hapusBarangKeranjang(myUserCredential);

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return BayarPage();
                          }));
                        },
                        child: Container(
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.02),
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Color(0xff2CCACA),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text("PESAN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)))),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: StreamBuilder<DocumentSnapshot>(
                                stream: total.doc(myUserCredential).snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Text(
                                      "Rp. " +
                                          snapshot.data['totalCheckout']
                                              .toString(),
                                      style: TextStyle(
                                          fontFamily: "RedHatDisplay",
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    );
                                  else {
                                    return Text("Mohon Tunggu");
                                  }
                                }),
                          )),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
