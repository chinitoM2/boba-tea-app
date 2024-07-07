import 'package:flutter/material.dart';
import '../models/drink.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  void Function()? onTap;
  DrinkTile({
    super.key,
    required this.drink,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Colors.brown[100],
        borderRadius: BorderRadius.circular(11),
        ),
        child: ListTile(
          title: Text(drink.name),
          subtitle: Text("\$${drink.price.toStringAsFixed(2)}"),
          leading: Image.asset(drink.imagePath),
          trailing: Icon(Icons.arrow_forward_rounded),
        ),
      ),
    );
  }
}