import 'package:flutter/material.dart';
import 'package:save_money/db/cateegory/category_db.dart';
import '../../models/category/category_model.dart';

// ignore: camel_case_types
class Icomecategory_list extends StatelessWidget {
  const Icomecategory_list({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: categoryDB().incomeCategoryListListner,
        builder: (BuildContext ctx, List<categoryModel> newlist, Widget? _) {
          return ListView.separated(
              itemBuilder: (ctx, index) {
                // ignore: non_constant_identifier_names
                final Category = newlist[index];
                return Padding(
                  padding: const EdgeInsets.all(1),
                  child: Card(
                    color: Colors.grey,
                    child: ListTile(
                        title: Text(Category.name),
                        trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Are you sure?"),
                                  content: const Text("Do you want to delete?"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        categoryDB.instance
                                            .deletecategory(Category.id);
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(14),
                                        child: const Text("ok",style: TextStyle(color: Colors.red),),
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: const Text('Cancel'))
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(Icons.delete))),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: newlist.length);
        });
  }
}
