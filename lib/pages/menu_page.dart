// ignore_for_file: prefer_const_constructors
import 'package:boba_tea_app/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/drink_tile.dart';
import '../models/drink.dart';
import 'order_page.dart';

class MenuPage extends StatefulWidget{
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  
  void goToOrderPage(Drink drink){
    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage()));
  }
  @override
  Widget build(BuildContext context) {
    //wrapped SafeArea block in Consumer widget from provider package
    //wrapped heading in SafeArea so heading avoids top left corner
    return Consumer<BobaTeaMenu>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // heading
              Text(
                "Boba Tea Menu",
                style: TextStyle(fontSize: 24),
              ),
              // list of drinks for sale
              Expanded(
                child: ListView.builder(
                  itemCount: value.menu.length,
                  itemBuilder: (context, index) {
                    // get each drink from menu
                    Drink tileDrink = value.menu[index];
                    // return each drink as a tile
                    return DrinkTile(
                      drink: tileDrink,
                      onTap: () => goToOrderPage(tileDrink),
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
