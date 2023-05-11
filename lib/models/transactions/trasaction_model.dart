import 'package:hive/hive.dart';
import 'package:save_money/models/category/category_model.dart';
part 'trasaction_model.g.dart';

@HiveType(typeId: 3)
class TransactionModel {
  @HiveField(0)
  final String Description;
  @HiveField(1)
  final double Amount;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final categoryType type;
  @HiveField(4)
  final categoryModel category;

  @HiveField(5)
  String? id;

  TransactionModel(
      {required this.Description,
      // ignore: non_constant_identifier_names
      required this.Amount,
      required this.date,
      required this.type,
      required this.category}) {
    id = DateTime.now().microsecondsSinceEpoch.toString();
  }
}
