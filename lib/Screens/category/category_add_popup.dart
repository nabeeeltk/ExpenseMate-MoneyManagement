import 'package:flutter/material.dart';
import 'package:save_money/db/cateegory/category_db.dart';
import 'package:save_money/models/category/category_model.dart';

ValueNotifier<categoryType> selectedCategoryNotifier =
    ValueNotifier(categoryType.income);

Future<void> showcategoryaddPopup(BuildContext context) async {
  var nam;

  final nameEditingController = TextEditingController();
  final data = await categoryDB.instance.getallcategory();
  for (var element in data) {
    nam = element.name;
  }
  // ignore: use_build_context_synchronously
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          backgroundColor: Colors.white,
          title: const Text("Add Category"),
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: nameEditingController,
                decoration: const InputDecoration(
                    fillColor: Color.fromARGB(255, 236, 238, 238),
                    border: OutlineInputBorder(),
                    hintText: "category"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  RedioButton(
                    titile: ("Income"),
                    type: categoryType.income,
                  ),
                  RedioButton(titile: 'Expense', type: categoryType.expense),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 236, 238, 238),
                  ),
                  // elevation:
                ),
                onPressed: () {
                  final name = nameEditingController.text;
                  if (name.isEmpty) {
                    return;
                  } else if (data.contains(name)) {
                    print(true);
                  } else {
                    final type = selectedCategoryNotifier.value;
                    final category = categoryModel(
                        id: DateTime.now().microsecondsSinceEpoch.toString(),
                        name: name,
                        type: type);

                    categoryDB.instance.insertcategory(category);
                    Navigator.of(ctx).pop();
                  }
                },
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        );
      });
}

class RedioButton extends StatelessWidget {
  final String titile;
  final categoryType type;

  const RedioButton({super.key, required this.titile, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: selectedCategoryNotifier,
            builder: (BuildContext ctx, categoryType newcategory, Widget? _) {
              return Radio<categoryType>(
                value: type,
                groupValue: newcategory,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  selectedCategoryNotifier.value = value;
                  selectedCategoryNotifier.notifyListeners();
                },
              );
            }),
        Text(titile)
      ],
    );
  }
}
