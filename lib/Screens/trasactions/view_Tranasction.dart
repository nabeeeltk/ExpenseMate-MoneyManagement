// ignore: file_names
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:save_money/Screens/trasactions/Edit_Transaction.dart';
import 'package:save_money/models/transactions/trasaction_model.dart';

// ignore: camel_case_types
class View_Transaction extends StatefulWidget {
  final TransactionModel value;
  const View_Transaction({super.key, required this.value});

  @override
  State<View_Transaction> createState() => _View_TransactionState();
}

// ignore: camel_case_types
class _View_TransactionState extends State<View_Transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Transaction Details',style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 250,
          width: double.infinity,
          color:Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Descriptiion :${widget.value.Description}',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Category Type: ${widget.value.category.name}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'RS:${widget.value.Amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Date: ${widget.value.date.toString()}',
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                
              ),
             const  SizedBox(height: 50,
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
