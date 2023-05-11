// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:save_money/Screens/trasactions/screen_Transactions.dart';
import 'package:save_money/db/transaction/transaction_db.dart';
import '../../db/cateegory/category_db.dart';
import '../../models/category/category_model.dart';
import '../../models/transactions/trasaction_model.dart';

class Edit_Transaction extends StatefulWidget {
  final int id;
  final TransactionModel value;
  const Edit_Transaction({
    super.key,
    required this.value,
    required this.id,
  });

  @override
  State<Edit_Transaction> createState() => _Edit_TransactionState();
}

class _Edit_TransactionState extends State<Edit_Transaction> {
  DateTime? _SelectedDate;

  categoryType? _SelectedCategoryType;
  categoryModel? _SelectedCategoryModel;
  String? _categoryID;
  TextEditingController _descriptionTextEditingControler =
      TextEditingController();
  TextEditingController _amountTextEditingController = TextEditingController();

  @override
  void initState() {
    _SelectedCategoryType = widget.value.type;
    _SelectedCategoryModel = widget.value.category;
    _SelectedDate = widget.value.date;
    _descriptionTextEditingControler =
        TextEditingController(text: widget.value.Description);
    _amountTextEditingController =
        TextEditingController(text: widget.value.Amount.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 238, 238),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 2,
        title: const Text(
          " Update Transactions",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 2),
                            
                          ),

                        ],
               borderRadius: BorderRadius.circular(20), color: Colors.black26
              ),
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: categoryType.income,
                                groupValue: _SelectedCategoryType,
                                activeColor: Colors.white,
                                focusColor: Colors.white,
                                onChanged: (newvalue) {
                                  setState(() {
                                    _SelectedCategoryType = categoryType.income;
                                    _categoryID = null;
                                  });
                                }),
                            const Text(
                              "Income",
                              style: TextStyle(
                                 color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: categoryType.expense,
                                groupValue: _SelectedCategoryType,
                                activeColor: Colors.white,
                                onChanged: (newvalue) {
                                  setState(() {
                                    _SelectedCategoryType =
                                        categoryType.expense;
                                    _categoryID = null;
                                  });
                                }),
                            const Text("Expence",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 60,
                      width: 900,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(30)),
                         color: Color.fromARGB(255, 236, 238, 238),
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          hint: const Text(
                            "SelectCategory",
                            style: TextStyle(color: Colors.black),
                          ),
                          value: _categoryID,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          items: (_SelectedCategoryType == categoryType.income
                                  ? categoryDB().incomeCategoryListListner
                                  : categoryDB().expencecategoryListListner)
                              .value
                              .map((e) {
                            return DropdownMenuItem(
                              value: e.id,
                              child: Text(e.name),
                              onTap: () {
                                _SelectedCategoryModel = e;
                              },
                            );
                          }).toList(),
                          onChanged: (SelectedSvalue) {
                            print(SelectedSvalue);
                            setState(() {
                              _categoryID = SelectedSvalue;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _descriptionTextEditingControler,
                      decoration: const InputDecoration(
                          hintText: "Description",
                          prefixIcon: Icon(
                            Icons.description,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30))),
                          fillColor:  Color.fromARGB(255, 236, 238, 238),
                          filled: true),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      controller: _amountTextEditingController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          focusColor: Colors.black,
                          prefixIcon: Icon(
                            Icons.wallet,
                            color: Colors.black,
                          ),
                          hintText: "Amount",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30))),
                          fillColor:Color.fromARGB(255, 236, 238, 238),
                          filled: true),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: 900,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(30)),
                         color: Color.fromARGB(255, 236, 238, 238),
                      ),
                      child: TextButton.icon(
                        onPressed: () async {
                          final _SelectedDateTemp = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 60)),
                              lastDate: DateTime.now());
                          if (_SelectedDateTemp == null) {
                            return;
                          } else {
                            print(_SelectedDateTemp.toString());
                            setState(() {
                              _SelectedDate = _SelectedDateTemp;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                        ),
                        label: Text(
                          _SelectedDate == null
                              ? "select date"
                              : DateFormat("dd-MMMM-yyyy")
                                  .format(_SelectedDate!),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton.icon(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 236, 238, 238),
                      )),
                      onPressed: () {
                        editTransactioin(widget.id);
                      },
                      icon: const Icon(
                        Icons.save,
                        color: Colors.black,
                      ),
                      label: const Text(
                        "Update",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> editTransactioin(id) async {
    final _descriptionText = _descriptionTextEditingControler.text.trim();
    final _amountText = _amountTextEditingController.text.trim();

    if (_descriptionText.isEmpty) {
      return;
    }
    if (_amountText.isEmpty) {
      return;
    }
    if (_categoryID == null) {
      return;
    }
    if (_SelectedDate == null) {
      return;
    }

    final _parsedamount = double.tryParse(_amountText);

    if (_parsedamount == null) {
      return;
    }
    if (_SelectedCategoryModel == null) {
      return;
    }
    final _model = TransactionModel(
        Description: _descriptionText,
        Amount: _parsedamount,
        date: _SelectedDate!,
        type: _SelectedCategoryType!,
        category: _SelectedCategoryModel!);
    Transactiondb.instence.UpdateTransaction(id, _model);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Screen_Transactions()),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text(
              'Sucsessfully',
              style: TextStyle(color: Colors.green),
            ),
            content: Text('Transaction Recorded'),
          );
        });
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
  }
}
