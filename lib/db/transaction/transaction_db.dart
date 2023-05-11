// ignore_for_file: non_constant_identifier_names
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:save_money/models/category/category_model.dart';
import 'package:save_money/models/transactions/trasaction_model.dart';

const TRANSACTION_DB_NAME = 'transactiondb';

abstract class TrasactiondbFuctions {
  Future<void> addTrasaction(TransactionModel obj);
  Future<List<TransactionModel>> getAllTrasactions();
  Future<void> deleteTransaction(int id);
  Future<void> UpdateTransaction(int id, TransactionModel obj);
  Future<void> transactionClear();
}

class Transactiondb implements TrasactiondbFuctions {
  Transactiondb._internel();

  static Transactiondb instence = Transactiondb._internel();

  factory Transactiondb() {
    return instence;
  }

  ValueNotifier<List<TransactionModel>> trasactionListNotifier =
      ValueNotifier([]);
  // ValueNotifier<List<TransactionModel>> transactionFilterNotifier = ValueNotifier([]);
  @override
  Future<void> addTrasaction(TransactionModel obj) async {
    final _transactiondb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    _transactiondb.put(obj.id, obj);
  }

  Future<void> refrush() async {
    final _allTransaction = await getAllTrasactions();
    final _list = await getAllTrasactions();
    _list.sort((first, second) => second.date.compareTo(first.date));
    trasactionListNotifier.value.clear();
    trasactionListNotifier.value.addAll(_list);
    trasactionListNotifier.notifyListeners();
  }

  @override
  Future<List<TransactionModel>> getAllTrasactions() async {
    final Transactiondb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return Transactiondb.values.toList();
  }

  @override
  Future<void> deleteTransaction(int id) async {
    final Transactiondb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await Transactiondb.deleteAt(id);
    log("message");
    refrush();
  }

  @override
  Future<void> UpdateTransaction(int id, TransactionModel obj) async {
    final _transactiondb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    _transactiondb.putAt(id, obj);
  }

  Future<void> SearchHistory(String text) async {
    final Transactiondb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    trasactionListNotifier.value.clear();
    trasactionListNotifier.value.addAll(Transactiondb.values
        .where((element) => element.Description.contains(text)));
    trasactionListNotifier.notifyListeners();
  }

  Future<void> filterDataByDate(String dateRange) async {
    final transactiondb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);

    if (dateRange == 'today') {
      trasactionListNotifier.value.clear();
      trasactionListNotifier.value.addAll(transactiondb.values
          .where((element) =>
              element.date.day == DateTime.now().day &&
              element.date.month == DateTime.now().month &&
              element.date.year == DateTime.now().year)
          .toList());
      trasactionListNotifier.notifyListeners();
    } else if (dateRange == 'Yesterday') {
      trasactionListNotifier.value.clear();
      trasactionListNotifier.value.addAll(transactiondb.values
          .where((element) =>
              element.date.day == DateTime.now().day - 1 &&
              element.date.month == DateTime.now().month &&
              element.date.year == DateTime.now().year)
          .toList());
      trasactionListNotifier.notifyListeners();
    } else if (dateRange == 'Month') {
      trasactionListNotifier.value.clear();
      trasactionListNotifier.value.addAll(transactiondb.values
          .where((element) =>
              element.date.month == DateTime.now().month &&
              element.date.year == DateTime.now().year)
          .toList());
      trasactionListNotifier.notifyListeners();
    } else {
      transactiondb.values.toList();
    }
  }

  Future<void> filter(String text) async {
    if (text == 'Income') {
      final Transactiondb =
          await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
      trasactionListNotifier.value.clear();
      trasactionListNotifier.value.addAll(Transactiondb.values
          .where((element) => element.type == categoryType.income)
          .toList());
      trasactionListNotifier.notifyListeners();
    } else if (text == 'Expense') {
      final Transactiondb =
          await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
      trasactionListNotifier.value.clear();
      trasactionListNotifier.value.addAll(Transactiondb.values
          .where((element) => element.type == categoryType.expense)
          .toList());
      trasactionListNotifier.notifyListeners();
    } else {
      final Transactiondb =
          await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
      trasactionListNotifier.notifyListeners();
    }
  }

  @override
  Future<void> transactionClear() async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await transactionDB.clear();
    refrush();
  }
}
