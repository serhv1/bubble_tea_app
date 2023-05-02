import 'package:bubble_tea_app/models/shop.dart';
import 'package:bubble_tea_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BubbleTeaShop(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    ),
  );
}
