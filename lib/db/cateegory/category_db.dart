import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:save_money/models/category/category_model.dart';

const CATEGORY_DB_NAME = 'category-database';

// ignore: camel_case_types
abstract class categoryDbFuctions {
  Future<List<categoryModel>> getallcategory();
  Future<void> insertcategory(categoryModel value);
  Future<void> deletecategory(String categoryID);
  Future<void> categoryClear();
}

// ignore: camel_case_types
class categoryDB implements categoryDbFuctions {
  categoryDB.internal();

  static categoryDB instance = categoryDB.internal();
  factory categoryDB() {
    return instance;
  }

  ValueNotifier<List<categoryModel>> incomeCategoryListListner =
      ValueNotifier([]);
  ValueNotifier<List<categoryModel>> expencecategoryListListner =
      ValueNotifier([]);
  @override
  Future<void> insertcategory(categoryModel value) async {
    final _categoryDB = await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.put(value.id, value);

    refrushUI();
  }

  @override
  Future<List<categoryModel>> getallcategory() async {
    final _categoryDB = await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();
  }

  Future<void> refrushUI() async {
    final _allcategory = await getallcategory();
    incomeCategoryListListner.value.clear();
    expencecategoryListListner.value.clear();
    await Future.forEach(_allcategory, (categoryModel category) {
      if (category.type == categoryType.income) {
        incomeCategoryListListner.value.add(category);
      } else {
        expencecategoryListListner.value.add(category);
      }
    });
    incomeCategoryListListner.notifyListeners();
    expencecategoryListListner.notifyListeners();
  }

  @override
  Future<void> deletecategory(String categoryID) async {
    final _categoryDB = await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.delete(categoryID);
    refrushUI();
  }

  @override
  Future<void> categoryClear() async {
    final categoryDB = await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
    await categoryDB.clear();
    refrushUI();
  }
}
