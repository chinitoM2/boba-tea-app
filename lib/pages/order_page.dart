import 'package:boba_tea_app/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({
    super.key,
    required this.drink,
    });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final double regular = 100;
  final int sliderDivisions = 4;
  double sugarLevel = 50;
  double iceLevel = 50;
  List<bool> chosenAddons = [];
  
  // CUSTOMIZE SUGAR LEVEL
  void customizeSugarLevel(double customerLevel) {
    setState(() {
      sugarLevel = customerLevel;
    });
  }

  // CUSTOMIZE ICE LEVEL
  void customizeIceLevel(double customerLevel) {
    setState(() {
      iceLevel = customerLevel;
    });
  }

  // ADD TO CART
  void addToCart(){
    Provider.of<BobaTeaMenu>(context, listen: false).addToCart(widget.drink);

    // direct customer back to menu page
    Navigator.pop(context);

    // let customer know drink was added to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Added ${widget.drink.name} to Cart'),
        backgroundColor: Colors.white,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.name),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Colors.brown[200],
      body: Column(
        children: [
          // drink image
          Image.asset(widget.drink.imagePath, height: 240),
          // sliders to customize drink
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // sugar level slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text("Sugar Level"),
                    ),
                    Expanded(
                      child: Slider(
                        value: sugarLevel,
                        max: regular,
                        divisions: sliderDivisions,
                        label: sugarLevel.toStringAsFixed(0),
                        onChanged: (value) => customizeSugarLevel(value),
                      ),
                    ),
                  ],
                ),
                // ice level slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text("Ice Level"),
                    ),
                    Expanded(
                      child: Slider(
                        value: iceLevel,
                        max: regular,
                        divisions: sliderDivisions,
                        label: iceLevel.toStringAsFixed(0),
                        onChanged: (value) => customizeIceLevel(value),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // toppings & add-ons checkboxes
          // add to cart button
          MaterialButton(
            color: Colors.brown,
            onPressed: addToCart,
            child: const Text('Add to Cart', style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }
}
