import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/locale/locale_keys.g.dart';
import 'package:market_nusantara/produk/item_card.dart';
import 'package:market_nusantara/helper/shared_preference_helper.dart';
import 'package:easy_localization/easy_localization.dart';

class WishListPage extends StatefulWidget {
  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  String myUserCredential;
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
      appBar: AppBar(
        backgroundColor: Color(0xff2CCACA),
        title: Text(LocaleKeys.barang_favorite).tr(),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("favorit")
                  .doc(myUserCredential)
                  .collection('barangFavoriteUser')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data.docs[index];
                        return ItemCard(
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
                            documentSnapshot["searchKey"]);
                      });
                } else {
                  return Center(
                      child: Text(
                    LocaleKeys.belum_ada.tr(),
                    style: TextStyle(fontFamily: "Poppins", fontSize: 15),
                  ));
                }
              }),
        ),
      ),
    );
  }
}
