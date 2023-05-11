import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:save_money/balance/amount.dart';

// ignore: camel_case_types
class Report_screen extends StatefulWidget {
  @override
  State<Report_screen> createState() => _Report_screenState();
}

// ignore: camel_case_types
class _Report_screenState extends State<Report_screen> {
  Map<String, double> dataMap = {
    "Income": Amounts.instance.incomeNotifier.value,
    "Expenses": Amounts.instance.expenseNotifier.value,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Statitics',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
          child: Center(
            child: PieChart(
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 2.7,
              colorList: const [
                Colors.green,
                Colors.red,
              ],
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 32,
              centerText:
                  "Total\n${Amounts.instance.totelblanceNotifier.value}",
              legendOptions: const LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
