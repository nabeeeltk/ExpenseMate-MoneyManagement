import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:save_money/Screens/add_transaction/screen_add_transaction.dart';
import 'package:save_money/Screens/trasactions/Edit_Transaction.dart';
import 'package:save_money/Screens/trasactions/screen_Transactions.dart';
import 'package:save_money/Screens/trasactions/view_Tranasction.dart';
import 'package:save_money/db/transaction/transaction_db.dart';
import 'package:save_money/home/widgets/drower/Terms_condetions.dart';
import 'package:save_money/home/widgets/drower/chart/report.dart';
import 'package:save_money/home/widgets/drower/privacy.dart';
import 'package:save_money/home/widgets/drower/reset.dart';
import 'package:save_money/models/category/category_model.dart';
import 'package:save_money/models/transactions/trasaction_model.dart';
import '../../balance/amount.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Transactiondb.instence.refrush();
    Amounts.instance.calculateAll();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Mate',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 77, 80, 80),
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     Colors.black,
                //     Colors.white,
                //   ],
                // ),
                color: Colors.black
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'EXPENSE MATE..!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                  
                ),
              
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.auto_graph,
                color: Colors.black,
                size: 30,
              ),
              title: const Text(
                'Statitics',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Report_screen()));
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.security, color: Colors.black, size: 30),
              title: const Text(
                'Privacy Policy ',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const privacy_policy()));
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.description, color: Colors.black, size: 30),
              title: const Text(
                'Terms&Conditions',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Terms_condetions()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.reset_tv_rounded,
                  color: Colors.black, size: 30),
              title: const Text(
                'Reset',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onTap: () {
                resetAlert(context);
              },
            ),
            // ListTile(
            //   leading:
            //       const Icon(Icons.feedback, color: Colors.black, size: 30),
            //   title: const Text(
            //     'Feedback ',
            //     style: TextStyle(fontSize: 18, color: Colors.black),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const screen_add_transaction()));
            //   },
            // ),
            ListTile(
                leading: const Icon(Icons.share, color: Colors.black, size: 30),
                title: const Text(
                  'Share ',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                onTap: () {
                  Share.share('com.example.save_money');
                }),
            const Padding(
              padding: EdgeInsets.only(
                left: 60,
                top: 40,
              ),
              child: ListTile(
                title: Text(
                  "Version 0.01",
                  style: TextStyle(fontSize: 20, color: Colors.black26),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 236, 238, 238),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 240,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 9, 7),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: Amounts.instance.totelblanceNotifier,
                          builder: (context, value, child) {
                            return Column(
                              children: [
                                const Text(
                                  "Total Balence",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    Amounts.instance.totelblanceNotifier.value
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 35,
                                        color: Colors.white)),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            );
                          },
                        ),
                        Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 187, 182, 182),
                                    radius: 25,
                                    child: Icon(
                                      Icons.arrow_downward,
                                      color: Color.fromARGB(255, 28, 81, 29),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Income',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                          child: ValueListenableBuilder(
                                            valueListenable:
                                                Amounts.instance.incomeNotifier,
                                            builder: (context, value, child) {
                                              return Text(
                                                Amounts.instance.incomeNotifier
                                                    .value
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 65,
                            ),
                            Container(
                              width: 140,
                              height: 75,
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 187, 182, 182),
                                    radius: 25,
                                    child: Icon(
                                      Icons.arrow_upward,
                                      color: Color.fromARGB(255, 207, 37, 3),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  Container(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Expenses',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                          child: ValueListenableBuilder(
                                            valueListenable: Amounts
                                                .instance.expenseNotifier,
                                            builder: (context, value, child) {
                                              return Text(
                                                Amounts.instance.expenseNotifier
                                                    .value
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ])),
            ),

            // #Recent Transaction ..........
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Transactions',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Screen_Transactions()),
                        );
                      },
                      child: const Text(
                        'View all',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )),
                ],
              ),
            ),
            ValueListenableBuilder(
                valueListenable: Transactiondb.instence.trasactionListNotifier,
                builder:
                    (BuildContext, List<TransactionModel> newList, Widget_) {
                  return Expanded(
                      child: newList.isNotEmpty
                          ? ListView.separated(
                              padding: const EdgeInsets.all(5.0),
                              itemBuilder: (ctx, index) {
                                final _value = newList[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              View_Transaction(
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
                                                const Color.fromARGB(
                                                    255, 236, 238, 238),
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
                                              color: _value.type ==
                                                      categoryType.income
                                                  ? const Color.fromARGB(
                                                      255, 28, 70, 29)
                                                  : Colors.red),
                                        ),
                                        subtitle: Text(
                                          _value.category.name,
                                          style: const TextStyle(
                                              color: Colors.black),
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
                                                                  value:
                                                                      _value)));
                                                },
                                                icon: const Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (ctx) =>
                                                        AlertDialog(
                                                      title: const Text(
                                                          "Are you sure?"),
                                                      content: const Text(
                                                        "Do you want to delete?",
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            Transactiondb
                                                                .instence
                                                                .deleteTransaction(
                                                                    index);
                                                            Navigator.of(ctx)
                                                                .pop();
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(14),
                                                            child: const Text(
                                                                "Ok"),
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(ctx)
                                                                .pop();
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(14),
                                                            child: const Text(
                                                                "Cancel"),
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
                              itemCount:
                                  newList.length > 3 ? 3 : newList.length)
                          : const Center(
                              child: Text('No Tranasactions ..! PleaseAdd'),
                            ));
                }),
          ],
        ),
      ),
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitDate = _date.split(' ');
    return '${_splitDate.first}\n${_splitDate.last}';
  }
}
