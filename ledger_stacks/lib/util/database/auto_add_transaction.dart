import 'package:flutter/material.dart';
import 'package:ledger_stacks/util/database/database_service.dart';

import '../../models/latest_date.dart';
import '../../models/my_list.dart';
import '../../models/transaction.dart';

Future<void> collectDateTime() async {
  final List<LatestDate> latestDates = await LedgetStackDB.instance.getLatestDate();
  final currentDate = DateTime.now();
  final currentDateOnly = DateTime(currentDate.year, currentDate.month, currentDate.day);

  if (latestDates.isEmpty) {
    await LedgetStackDB.instance.createLatestDate(currentDate.toIso8601String());
  } else {
    final storedDate = DateTime.parse(latestDates[0].latestdate!);
    final storedDateOnly = DateTime(storedDate.year, storedDate.month, storedDate.day);

    final difference = storedDateOnly.difference(currentDateOnly).inDays.abs();
    debugPrint("Distance between stored date and current date: $difference days");
    if (difference >= 1) {
      await autoAddTransaction();
    }
    await LedgetStackDB.instance.updateLatestDate(currentDate.toIso8601String());
    debugPrint("If table exist Current Date: $storedDate");
  }
}

Future<void> autoAddTransaction() async {
  final List<MyList> mylist = await LedgetStackDB.instance.getMylist();
  if (mylist.isNotEmpty) {
    // Get current date
    final currentDate = DateTime.now();
    // Iterate through user's list
    for (var item in mylist) {
      // Check if the item is of type "Auto"
      if (item.type == "Auto") {
        // Calculate the number of days since the last transaction
        final lastTransactionDate = await LedgetStackDB.instance.getLatestDate();
        final lastTransactionDateTime = DateTime.parse(lastTransactionDate[0].latestdate ?? currentDate.toIso8601String());
        final daysSinceLastTransaction = currentDate.difference(lastTransactionDateTime).inDays;

        // If the user hasn't logged in for a while, add transactions for missed days
        if (daysSinceLastTransaction > 0) {
          for (var i = 0; i <= daysSinceLastTransaction; i++) {
            final transactionDate = lastTransactionDateTime.add(Duration(days: i));
            if (_shouldAddTransactionOnDate(item, transactionDate)) {
              await addTransaction(item, transactionDate);
            }
          }
        }
      }
    }
  }
}

bool _shouldAddTransactionOnDate(MyList item, DateTime date) {
  switch (item.frequency) {
    case "Mon - Fri":
      return date.weekday >= DateTime.monday && date.weekday <= DateTime.friday;
    case "Sat - Sun":
      return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
    case "1st day":
      return date.day == 1;
    case "15th":
      return date.day == 15;
    default:
      return false;
  }
}

Future<void> addTransaction(MyList item, DateTime date) async {
  final transactionData = TransactionModel(
    name: item.name,
    amount: item.amount,
    isIncome: item.isIncome.toString(),
    date: date.toIso8601String(),
  );
  await LedgetStackDB.instance.addTransactionFromMylist(transactionData);
  debugPrint('Added transaction for ${item.name} on ${date.toString()}');
}
