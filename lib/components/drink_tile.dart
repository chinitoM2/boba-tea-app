import 'package:flutter/material.dart';
import '../models/drink.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  final void Function()? onTap;
  final Widget trailing;
  const DrinkTile({
    super.key,
    required this.drink,
    required this.onTap,
    required this.trailing,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 11),
        decoration: BoxDecoration(color: Colors.brown[100],
        borderRadius: BorderRadius.circular(11),
        ),
        child: ListTile(
          title: Text(drink.name),
          subtitle: Text("\$${drink.price.toStringAsFixed(2)}"),
          leading: Image.asset(drink.imagePath),
          trailing: trailing,
        ),
      ),
    );
  }
}