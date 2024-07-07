import 'package:boba_tea_app/components/bottom_nav_bar.dart';
import 'package:boba_tea_app/pages/cart_page.dart';
import 'package:boba_tea_app/pages/menu_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // ignore: use_super_parameters
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0; // default home icon to index 0, cart icon to index 1
  // navigate bottom navigation bar function
  void navigateBottomBar(int newIndex){
    setState((){
      _selectedIndex = newIndex;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    // menu page
    const MenuPage(),
    // cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex]
    );
  }
}