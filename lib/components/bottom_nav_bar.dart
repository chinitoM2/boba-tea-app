// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final Color defaultActiveColor = Colors.white;
    final Color defaultColor = Colors.brown;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: defaultActiveColor,
        color: defaultColor,
        tabActiveBorder: Border.all(color: defaultActiveColor),
        gap: 8,
        tabs: const [
          // shop tab
          GButton(
            icon: Icons.home,
            text: 'Menu',
          ),
          // cart tab
          GButton(
            icon: Icons.shopping_cart,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
