import 'package:flutter/foundation.dart';
import 'drink.dart';

class BobaTeaMenu extends ChangeNotifier{
  // list of drinks for sale
  final List<Drink> _menu = [
    // classic milk tea
    Drink(
      name: "Classic Milk Tea",
      price: 5.50,
      imagePath: "lib/images/classic_milk_tea.png",
    ),
  ];

  // list of drinks in customer's cart
  final List<Drink> _userCart = [];

  // getter for menu
  List<Drink> get menu => _menu;

  // getter for customer's cart
  List<Drink> get userCart => _userCart;

  // add drink to cart
  void addToCart(Drink drink){
    _userCart.add(drink);
    notifyListeners();
  }
  // remove drink from cart
  void removeFromCart(Drink drink){
    _userCart.remove(drink);
    notifyListeners();
  }
}