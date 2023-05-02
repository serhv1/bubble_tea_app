import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // customize sweetness
  double sweetValue = 0.5;
  double iceValue = 0.5;
  double pearlValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.name),
      ),
      backgroundColor: Colors.brown[200],
      body: Column(
        children: [
          // drink image
          Image.asset(widget.drink.imagePath),
          // sliders to customize drink
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                // sweetness
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        'Sweetness',
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        activeColor: Colors.pinkAccent,
                        value: sweetValue,
                        divisions: 4,
                        onChanged: (value) => customizeSweet(value),
                      ),
                    ),
                  ],
                ),
                // ice
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        'Ice',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: iceValue,
                        divisions: 4,
                        onChanged: (value) => customizeIce(value),
                        activeColor: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
                // pearls
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text(
                        'Pearls',
                        style: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        activeColor: Colors.yellowAccent,
                        value: pearlValue,
                        divisions: 4,
                        onChanged: (value) => customizePearl(value),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // add to cart button
          MaterialButton(
            color: Colors.brown,
            elevation: 8,
            onPressed: () {
              Provider.of<BubbleTeaShop>(context, listen: false)
                  .addToCart(widget.drink);
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                    title: Text(
                  'Successfully added to cart!',
                )),
              );
            },
            child: const Text(
              'Add to cart',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
