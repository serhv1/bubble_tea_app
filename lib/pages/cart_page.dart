import 'package:bubble_tea_app/components/drink_tile.dart';
import 'package:bubble_tea_app/models/drink.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Your Cart',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    // get individual drink in cart first
                    Drink drink = value.cart[index];
                    // return a tile
                    return DrinkTile(
                      drink: drink,
                      onTap: () => removeFromCart(drink),
                      trailling: const Icon(
                        Icons.delete,
                      ),
                    );
                  },
                ),
              ),
              MaterialButton(
                elevation: 8,
                color: Colors.brown,
                onPressed: () {},
                child: const Text(
                  'PAY',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
