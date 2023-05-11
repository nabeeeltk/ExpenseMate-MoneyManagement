import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:save_money/Screens/splash/Splash_Screen1.dart';
import 'package:save_money/Screens/splash/splash_screen.dart';
import 'package:save_money/models/category/category_model.dart';
import 'package:save_money/models/transactions/trasaction_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(categoryTypeAdapter().typeId)) {
    Hive.registerAdapter(categoryTypeAdapter());
  }
  runApp(const MyApp());
  if (!Hive.isAdapterRegistered(categoryModelAdapter().typeId)) {
    Hive.registerAdapter(categoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
    debugShowCheckedModeBanner: false,
     home:splash_screen_demo());
  }
}
