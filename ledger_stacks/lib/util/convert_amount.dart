import 'package:intl/intl.dart';

//Change amount to readable format
String convertToAmount(double amount) {
  if (amount >= 1000) {
    var result = NumberFormat.compactCurrency(
      decimalDigits: 2,
      locale: 'en_US',
      symbol: '',
    ).format(amount);
    return result;
  } else if (amount >= 10000000) {
    var result = NumberFormat.compactCurrency(
      decimalDigits: 2,
      locale: 'en_US',
      symbol: '',
    ).format(amount);
    return result;
  } else {
    return amount.toString();
  }
}
