// ignore_for_file: prefer_const_constructors

import 'package:boba_tea_app/components/drink_tile.dart';
import 'package:boba_tea_app/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class CartPage extends StatefulWidget{
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>{
  // remove drink from cart
  void removeFromCart(Drink drink){
    Provider.of<BobaTeaMenu>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context){
    return Consumer<BobaTeaMenu>(
      builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // heading
            const Text('Your Cart',
            style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 11),
            // list of cart items
            Expanded(child: ListView.builder(
              itemCount: value.cart.length,
              itemBuilder: (context, index){
              // get each drink from cart
              Drink drink = value.cart[index];
              // return drink as a tile
              return DrinkTile(
                drink: drink,
                onTap: () => removeFromCart(drink),
                trailing: Icon(Icons.delete),
              );
            },
            ),
            ),
            // checkout button
            MaterialButton(
              child: const Text('CHECKOUT', style: TextStyle(color: Colors.white),), 
              color: Colors.brown,
              onPressed: () {},
            ),
          ],
        ),
      ),
    ),
     );
  }
}