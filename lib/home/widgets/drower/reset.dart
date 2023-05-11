import 'package:flutter/material.dart';
import 'package:save_money/Screens/splash/Splash_Screen1.dart';
import 'package:save_money/Screens/splash/splash_screen.dart';
import 'package:save_money/db/cateegory/category_db.dart';
import 'package:save_money/db/transaction/transaction_db.dart';

Future<void> resetAlert(BuildContext ctx) async {
  return showDialog(
    context: ctx,
    builder: (context) {
      return AlertDialog(
        title: const Text('Reset !'),
        content: const Text('All your transactions & categories will be gone'),
        actions: [
          TextButton(
              onPressed: () async {
                categoryDB.instance.categoryClear();
                Transactiondb.instence.transactionClear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (ctx) => splash_screen(),
                    ),
                    (route) => false);
              },
              child: const Text('Yes')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No',style: TextStyle(color: Colors.red),))
        ],
      );
    },
  );
}
