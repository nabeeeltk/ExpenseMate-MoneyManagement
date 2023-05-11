import 'package:flutter/material.dart';
import 'package:save_money/Screens/category/category_add_popup.dart';
import 'package:save_money/Screens/category/expencecategory_list.dart';
import 'package:save_money/db/cateegory/category_db.dart';
import 'icomecategory_list.dart';

// ignore: camel_case_types
class screencategory extends StatefulWidget {
  const screencategory({super.key});

  @override
  State<screencategory> createState() => _screencategoryState();
}

// ignore: camel_case_types
class _screencategoryState extends State<screencategory> {
  @override
  void initState() {
    categoryDB().refrushUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 236, 238, 238),
          appBar: AppBar(
            bottom: const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: 'INCOME',
                  icon: Icon(
                    Icons.circle,
                    color: Colors.green,
                  ),
                ),
                Tab(
                  text: "EXPENSE",
                  
                  icon: Icon(
                    Icons.circle,
                    color: Colors.red,
                  ),
                ),
              ],
              indicatorColor: Colors.black,
            ),
            backgroundColor: Colors.white,
            title: const Text(
              "Category",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            elevation: 1,
          ),
          body: const TabBarView(children: [
            Icomecategory_list(),
            expencecategory_list(),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showcategoryaddPopup(context);
            },
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ));
  }
}
