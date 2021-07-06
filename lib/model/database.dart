import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseMethods {
  String nama = "NAMA";
  String merek = "MEREK";
  String tipe = "TIPE";
  String detail = "DETAIL";
  String gambar = "GAMBAR";
  String harga = "0";
  String jumlah = "0";
  Timestamp dibuat, terjual;

  /// Menambah Info User ke Cloud Firestore

  Future tambahAkun(String userId, Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  Future<QuerySnapshot> getUserInfo(String email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
  }

  Future tambahBarang(Map<String, dynamic> infoBarang) async {
    DocumentReference barang =
        FirebaseFirestore.instance.collection("barang").doc();
    return barang.set(infoBarang);
  }

  getNama(namabarang) {
    return this.nama = namabarang;
  }

  getMerek(merekBarang) {
    return this.merek = merekBarang;
  }

  getTipe(tipeBarang) {
    return this.tipe = tipeBarang;
  }

  getDetail(detailBarang) {
    return this.detail = detailBarang;
  }

  static Future<String> uploadGambar(File imageFIle) async {
    String fileName = basename(imageFIle.path);
    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    UploadTask task = ref.putFile(imageFIle);
    TaskSnapshot snapshot = await task;
    return await snapshot.ref.getDownloadURL();
  }

  getHarga(hargaBarang) {
    return this.harga = hargaBarang;
  }

  getWaktuDibuat(waktuDibuatBarang) {
    return this.dibuat = waktuDibuatBarang;
  }

  getWaktuTerjual(waktuTerjualbarang) {
    return this.terjual = waktuTerjualbarang;
  }

  getJumlah(jumlahBarang) {
    return this.jumlah = jumlahBarang;
  }

  getChats(String chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection("users")
        .where('name', isEqualTo: searchField)
        .get();
  }

  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addMessage(String chatRoomId, chatMessageData) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserChats(String itIsMyName) async {
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }
}
