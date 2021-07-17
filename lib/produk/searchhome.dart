import 'package:cloud_firestore/cloud_firestore.dart';

//search untuk bagian home page

class SearchService {
  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection('barang')
        .where('searchKey',
            isEqualTo: searchField.substring(0, 1).toUpperCase())
        .get();
  }
}
