import 'package:flutter/material.dart';
import 'package:market_nusantara/views/cart_page.dart';
import 'package:market_nusantara/views/home_page.dart';
import 'package:market_nusantara/produk/new_chat.dart';
import 'package:market_nusantara/produk/chat_messages.dart';
import 'package:market_nusantara/views/message_page.dart';
import 'package:market_nusantara/views/profil_page.dart';
import 'package:market_nusantara/views/wishlist_page.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = [
      // DashboardSamsat(),
      HomePage(),
      WishListPage(),
      ChatRoom(),
      CartPage(),
      ProfilPage()
    ];

    return Scaffold(
      body: Center(
        child: _listPage[_selectedNavbar],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Beranda'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: ('Harapan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: ('Pesan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: ('Keranjang'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: ('Profil'),
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Color(0xFFFFCE00),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
