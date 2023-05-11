// ignore: camel_case_types
import 'package:hive/hive.dart';
part 'category_model.g.dart';
@HiveType(typeId: 2)
enum categoryType {
  @HiveField(0)
  income,
  @HiveField(2)
  expense,
}

// ignore: camel_case_types
@HiveType(typeId: 1)
class categoryModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final bool isDeleted;
  @HiveField(3)
  final categoryType type;

  categoryModel(
      {required this.id,
      required this.name,
      required this.type,
      this.isDeleted = false});

      @override
        String toString(){
          return '{$name $type}';

      }
}
