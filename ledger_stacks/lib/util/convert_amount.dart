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
    if (amount % 1 == 0) {
      return amount.toStringAsFixed(0); // Display without decimals
    } else {
      return amount.toStringAsFixed(2); // Display with exactly two decimals
    }
  }
}

String convertToPercent(double value) {
  return (value).toStringAsFixed(0); // แปลงค่าเป็นเปอร์เซ็นต์แบบเต็มจำนวน
}
