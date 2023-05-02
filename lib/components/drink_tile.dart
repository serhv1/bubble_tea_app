import 'package:bubble_tea_app/models/drink.dart';
import 'package:flutter/material.dart';

class DrinkTile extends StatelessWidget {
  final void Function()? onTap;
  final Drink drink;
  final Widget trailling;
  const DrinkTile({
    super.key,
    required this.drink,
    required this.onTap,
    required this.trailling,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(drink.name),
          subtitle: Text(drink.price),
          leading: Image.asset(drink.imagePath),
          trailing: trailling,
        ),
      ),
    );
  }
}
