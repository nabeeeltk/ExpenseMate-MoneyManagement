import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:save_money/Screens/trasactions/Edit_Transaction.dart';
import 'package:save_money/Screens/trasactions/view_Tranasction.dart';
import 'package:save_money/db/cateegory/category_db.dart';
import 'package:save_money/db/transaction/transaction_db.dart';
import 'package:save_money/models/category/category_model.dart';
import '../../models/transactions/trasaction_model.dart';

// ignore: camel_case_types
class Screen_Transactions extends StatefulWidget {
  const Screen_Transactions({super.key});

  @override
  State<Screen_Transactions> createState() => _Screen_TransactionsState();
}

// ignore: camel_case_types
class _Screen_TransactionsState extends State<Screen_Transactions> {
  Icon customIcon = const Icon(
    Icons.search,
    color: Colors.black,
    size: 30,
  );

  Widget customSearchBar = const Text(
    'Transaction Record',
    style: TextStyle(color: Colors.black),
  );
  @override
  Widget build(BuildContext context) {
    Transactiondb.instence.refrush();
    categoryDB.instance.refrushUI();
    return ValueListenableBuilder(
        valueListenable: Transactiondb.instence.trasactionListNotifier,
        builder: (BuildContext, List<TransactionModel> newList, Widget_) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 236, 238, 238),
            appBar: AppBar(
              backgroundColor: Colors.grey,
              elevation: 1,
              title: Center(
                child: customSearchBar,
              ),
              actions: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      if (customIcon.icon == Icons.search) {
                        customIcon = const Icon(
                          Icons.cancel,
                          color: Colors.black,
                        );
                        customSearchBar = TextField(
                          onChanged: (Description) {
                            Transactiondb.instence.SearchHistory(Description);
                          },
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'Search',
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        );
                      } else {
                        customIcon = const Icon(Icons.search);
                        customSearchBar = const Text(
                          "Transaction Record",
                          style: TextStyle(color: Colors.black),
                        );
                      }
                    });
                  },
                  child: SizedBox(
                    width: 100,
                    child: customIcon,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton(
                      icon: const Icon(
                        Icons.filter_list_sharp,
                        color: Colors.black,
                        size: 30,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () {
                            Transactiondb.instence.refrush();
                          },
                          child: const Text(
                            'All',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        PopupMenuItem(
                            onTap: () {
                              Transactiondb.instence.filter('Income');
                            },
                            child: const Text('Income',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        PopupMenuItem(
                            onTap: () {
                              Transactiondb.instence.filter('Expense');
                            },
                            child: const Text('Expense',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                    PopupMenuButton(
                      icon: const Icon(Icons.filter_2),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                            onTap: () {},
                            child: const Text('All',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        PopupMenuItem(
                            onTap: () {
                              Transactiondb.instence.filterDataByDate(
                                'today',
                              );
                            },
                            child: const Text('Today',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        PopupMenuItem(
                            onTap: () {
                              Transactiondb.instence.filterDataByDate(
                                'Yesterday',
                              );
                            },
                            child: const Text(
                              'Yesterday',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        PopupMenuItem(
                            onTap: () {
                              Transactiondb.instence
                                  .filterDataByDate('Month');
                            },
                            child: const Text(
                              'Month',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(5.0),
                    itemBuilder: (ctx, index) {
                      final _value = newList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => View_Transaction(
                                      value: _value,
                                    )),
                          );
                          print("view transaction");
                        },
                        child: Card(
                            color: Colors.grey,
                            elevation: 10,
                            child: ListTile(
                              leading: CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      const Color.fromARGB(255, 236, 238, 238),
                                  child: Text(
                                    parseDate(_value.date),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                              title: Text(
                                "₹${_value.Amount}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _value.type == categoryType.income
                                        ? const Color.fromARGB(255, 28, 70, 29)
                                        : Colors.red),
                              ),
                              subtitle: Text(
                                _value.category.name,
                                style: const TextStyle(color: Colors.black),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Edit_Transaction(
                                                        id: index,
                                                        value: _value)));
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: const Text("Are you sure?"),
                                            content: const Text(
                                              "Do you want to delete?",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Transactiondb.instence
                                                      .deleteTransaction(index);
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  child: const Text("Ok"),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  child: const Text("Cancel"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                            )),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const SizedBox(height: 10);
                    },
                    itemCount: newList.length,
                  ),
                ),
              ],
            ),
          );
        });
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitDate = _date.split(' ');
    return '${_splitDate.first}\n${_splitDate.last}';
  }
}
