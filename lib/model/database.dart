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

  Future tambahInfoAkun(
      String userCredential, Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userCredential)
        .set(userInfoMap);
  }

  Future updateInfoAkun(
      String userCredential, Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userCredential)
        .update(userInfoMap);
  }

  Future tambahFavorit(String namaBarang, userCredential,
      Map<String, dynamic> favoritInfoMap) async {
    return FirebaseFirestore.instance
        .collection("favorit")
        .doc(userCredential)
        .collection('barangFavoriteUser')
        .doc(namaBarang)
        .set(favoritInfoMap);
  }

  Future tambahKeranjang(String barangUid, userCredential,
      Map<String, dynamic> tambahKeranjangMap) async {
    return FirebaseFirestore.instance
        .collection("keranjang")
        .doc(userCredential)
        .collection('barang')
        .doc(barangUid)
        .set(tambahKeranjangMap);
  }

  Future checkout(String barangUid, userCredential,
      Map<String, dynamic> tambahCheckoutMap) async {
    return FirebaseFirestore.instance
        .collection("riwayatPembelian")
        .doc(userCredential)
        .collection('barang')
        .doc(barangUid)
        .set(tambahCheckoutMap);
  }

  Future pesananMasuk(
      String barangUid, Map<String, dynamic> tambahPesananMasukMap) async {
    return FirebaseFirestore.instance
        .collection("pesananMasuk")
        .doc(barangUid)
        .set(tambahPesananMasukMap);
  }

  Future<void> updateStatusPesananMasuk(String barangUid, updatePembelian) {
    return FirebaseFirestore.instance
        .collection("pesananMasuk")
        .doc(barangUid)
        .update(updatePembelian);
  }

  Future updateStatusRiwayatPembelian(String myUserCredential, String barangUid,
      Map<String, dynamic> updateStatus) async {
    return FirebaseFirestore.instance
        .collection('riwayatPembelian')
        .doc(myUserCredential)
        .collection('barang')
        .doc(barangUid)
        .update(updateStatus);
  }

  Future updateHargaCheckout(String userCredential,
      Map<String, dynamic> updateTotalCheckoutMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userCredential)
        .update(updateTotalCheckoutMap);
  }

  Future updateHargaTagihan(
      String userCredential, Map<String, dynamic> updateTotalTagihanMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userCredential)
        .update(updateTotalTagihanMap);
  }

  Future updateMinusStok(
      String barangUID, Map<String, dynamic> updateStok) async {
    return FirebaseFirestore.instance
        .collection("barang")
        .doc(barangUID)
        .update(updateStok);
  }

  Future updateTambahStok(
      String barangUID, Map<String, dynamic> updateStok) async {
    return FirebaseFirestore.instance
        .collection("barang")
        .doc(barangUID)
        .update(updateStok);
  }

  Future hapusBarangKeranjangTerpilih(
      String userCredential, String barangUid) async {
    return FirebaseFirestore.instance
        .collection("keranjang")
        .doc(userCredential)
        .collection("barang")
        .doc(barangUid)
        .delete();
  }

  Future hapusPesananMasukTerpilih(
      String userCredential, String barangUid) async {
    return FirebaseFirestore.instance
        .collection("pesananMasuk")
        .doc(barangUid)
        .delete();
  }

  Future hapusRiwayatPembelianTerpilih(
      String userCredential, String barangUid) async {
    return FirebaseFirestore.instance
        .collection("riwayatPembelian")
        .doc(userCredential)
        .collection("barang")
        .doc(barangUid)
        .delete();
  }

  Future<QuerySnapshot> getUserInfo(String email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
  }

  Future tambahBarang(namaBarang, Map<String, dynamic> infoBarang) async {
    DocumentReference barang =
        FirebaseFirestore.instance.collection("barang").doc(namaBarang);
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

  Future<String> getDataId(DocumentReference docRef) async {
    DocumentSnapshot docSnap = await docRef.get();
    var docId = docSnap.reference.id;
    return docId;
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

  // Future<void> kirimDataPembelian(userCredential, updatePembelian) {
  //   CollectionReference riwayatPembelian = FirebaseFirestore.instance
  //       .collection('riwayatPembelian')
  //       .doc(userCredential)
  //       .collection('barang');
  //   WriteBatch batch = FirebaseFirestore.instance.batch();

  //   return riwayatPembelian.get().then((querySnapshot) {
  //     querySnapshot.docs.forEach((document) {
  //       batch.update(document.reference, updatePembelian);
  //     });

  //     return batch.commit();
  //   });
  // }

  Future<void> hapusBarangKeranjang(userCredential) {
    CollectionReference barangKeranjang = FirebaseFirestore.instance
        .collection('keranjang')
        .doc(userCredential)
        .collection('barang');
    WriteBatch batch = FirebaseFirestore.instance.batch();

    return barangKeranjang.get().then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        batch.delete(document.reference);
      });

      return batch.commit();
    });
  }

  Future addInfoToko(infoToko) {
    return FirebaseFirestore.instance
        .collection("dataPembayaran")
        .doc("admin")
        .update(infoToko);
  }

  Future addInfoTagihan(userCredential, infoTagihan) {
    return FirebaseFirestore.instance
        .collection("dataPembayaran")
        .doc(userCredential)
        .update(infoTagihan);
  }
}
