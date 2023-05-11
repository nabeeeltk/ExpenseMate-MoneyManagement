import 'package:flutter/material.dart';
import 'package:save_money/db/transaction/transaction_db.dart';
import 'package:save_money/models/category/category_model.dart';


class Amounts {
  Amounts._internal();
  static Amounts instance = Amounts._internal();
  factory Amounts() {
    return instance;
  }
ValueNotifier<double> incomeNotifier = ValueNotifier(0);
ValueNotifier<double> expenseNotifier = ValueNotifier(0);
ValueNotifier<double> totelblanceNotifier = ValueNotifier(0);
Future<void> calculateAll() async {
  await Transactiondb.instence.getAllTrasactions().then((value) {
    expenseNotifier.value = 0;
    totelblanceNotifier.value = 0;
    incomeNotifier.value = 0;

    for (var element in value) {
      if (element.type == categoryType.income) {
        // }
        incomeNotifier.value += element.Amount;
        // incomeResult.value = incomeTotal;
      } else {
        expenseNotifier.value += element.Amount;
        // expenseResult.value = expenseTotal;
      }
    }

    totelblanceNotifier.value = incomeNotifier.value - expenseNotifier.value;
  });
  print(incomeNotifier.value);
  print(expenseNotifier.value);
  print(totelblanceNotifier.value);
}
}