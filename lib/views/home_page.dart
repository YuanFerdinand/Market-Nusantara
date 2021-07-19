import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_nusantara/produk/item_card.dart';
import 'package:market_nusantara/views/list_case.dart';
import 'package:market_nusantara/views/list_disk.dart';
import 'package:market_nusantara/views/list_memory.dart';
import 'package:market_nusantara/views/list_motherboard.dart';
import 'package:market_nusantara/views/list_processor.dart';
import 'package:market_nusantara/views/list_vga.dart';
import 'package:market_nusantara/views/searchhome_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      initialIndex: 0,
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xff2CCACA),
          title: Container(
            height: 30,
            child: TextField(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchHomePage();
                }));
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                labelText: "Search Product...",
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
                contentPadding: EdgeInsets.all(2),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 7,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ListProcessor();
                                    }));
                                  },
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/icon_processor.png"))),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ListProcessor();
                                      }));
                                    },
                                    child: Text("Proc")),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ListVGA();
                                    }));
                                  },
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/icon_vga.png"))),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ListVGA();
                                      }));
                                    },
                                    child: Text("VGA")),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ListMemory();
                                    }));
                                  },
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/icon_RAM.png"))),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ListMemory();
                                      }));
                                    },
                                    child: Text("RAM")),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ListCase();
                                    }));
                                  },
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/icon_case.png"))),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ListCase();
                                      }));
                                    },
                                    child: Text("Case")),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ListDisk();
                                    }));
                                  },
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/icon_disk.png"))),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ListDisk();
                                      }));
                                    },
                                    child: Text("Disk")),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ListMotherboard();
                                    }));
                                  },
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/icon_motherboard.png"))),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ListMotherboard();
                                      }));
                                    },
                                    child: Text("Board")),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ListProcessor();
                                    }));
                                  },
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/icon_monitor.png"))),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ListProcessor();
                                      }));
                                    },
                                    child: Text("Monitor")),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ListProcessor();
                                    }));
                                  },
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/icon_speaker.png"))),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ListProcessor();
                                      }));
                                    },
                                    child: Text("Speaker")),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.95,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("barang")
                        .orderBy("dibuat", descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                          'Belum ada Barang',
                          style: TextStyle(fontFamily: "Poppins", fontSize: 15),
                        ));
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
