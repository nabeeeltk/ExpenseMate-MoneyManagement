// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:save_money/Screens/add_transaction/screen_add_transaction.dart';
import 'package:save_money/Screens/trasactions/screen_Transactions.dart';
import 'package:save_money/home/widgets/home.dart';

import 'category/screen_category.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

final items = <Widget>[
  const Icon(
    Icons.home,
    size: 30,
    color: Colors.black,
  ),
  const Icon(Icons.compare_arrows, size: 30, color: Colors.black),
  const Icon(Icons.add, size: 30, color: Colors.black),
  const Icon(Icons.category, size: 30, color: Colors.black),
];
final navigationKey = GlobalKey<CurvedNavigationBarState>();

List pages = <Widget>[
  HomePage(),
  const Screen_Transactions(),
  const screen_add_transaction(),
  const screencategory()
];

class _Home_ScreenState extends State<Home_Screen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(168, 170, 150, 150),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black38,
        key: navigationKey,
        index: index,
        backgroundColor: const Color.fromARGB(255, 236, 238, 238),
        items: items,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      body: pages[index],
    );
  }
}
