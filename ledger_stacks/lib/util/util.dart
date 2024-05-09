import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ledger_stacks/util/database/database_service.dart';

//Update the observable value
class IsObscureController extends GetxController {
  var isObscure = true.obs;

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }
}

//RegExp Control
bool isValidEmail(String email) {
  final RegExp regex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    caseSensitive: false,
    multiLine: false,
  );
  return regex.hasMatch(email);
}

bool validateUsername(String username) {
  final RegExp usernameRegExp = RegExp(r'^[a-zA-Z][a-zA-Z0-9_-]{2,15}$');

  return usernameRegExp.hasMatch(username);
}

bool validatePassword(String password) {
  final RegExp passwordRegExp = RegExp(r'^.{8,}$');

  return passwordRegExp.hasMatch(password);
}

//Validator Control
String? validateUsernameField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username is required';
  }
  if (!validateUsername(value)) {
    return 'Invalid username';
  }
  return null;
}

String? validateEmailField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  if (!isValidEmail(value)) {
    return 'Invalid email address';
  }
  return null;
}

String? validatePasswordField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (!validatePassword(value)) {
    return 'Password must be at least 8 characters long';
  }
  return null;
}

String? validateConfirmPasswordField(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Confirm Password is required';
  }
  if (!validatePassword(value)) {
    return 'Confirm Password must be at least 8 characters long';
  }
  if (value != password) {
    return 'Password does not match';
  }
  return null;
}

//Add my list validator
String? validateListNameField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required';
  }
  if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    return 'Special characters are not allowed';
  }
  if (RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])').hasMatch(value)) {
    return 'Emoji characters are not allowed';
  }
  return null;
}

String? validateListAmountField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Amount is required';
  }
  return null;
}

//Add transaction validator
String? validateTransactionNameField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required';
  }
  return null;
}

String? validateTransactionAmountField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Amount is required';
  }
  return null;
}

String getMonthName(String date) {
  DateTime dateTime = DateTime.parse(date);
  return DateFormat.MMM().format(dateTime);
}

Future dailyIncomeValue(String date) async {
  double dailyIncome = await LedgetStackDB.instance.calculateDailyIncome(date);
  return dailyIncome;
}

Future dailyExpenseValue(String date) async {
  double dailyExpense = await LedgetStackDB.instance.calculateDailyExpense(date);
  return dailyExpense;
}

Future monthlyIncomeValue(String date) async {
  double monthlyIncome = await LedgetStackDB.instance.calculateMonthlyIncome(date);
  return monthlyIncome;
}

Future monthlyExpenseValue(String date) async {
  double monthlyExpense = await LedgetStackDB.instance.calculateMonthlyExpense(date);
  return monthlyExpense;
}

Future<double> calculateMonthlyBalance(String date) async {

  double monthlyIncome = await monthlyIncomeValue(date);
  double monthlyExpense = await monthlyExpenseValue(date);
  double monthlyBalance = monthlyIncome - monthlyExpense;

  return monthlyBalance;
}

Future<double> calculateMonthlyBalancePercent(String date) async {
  // คำนวณค่ารายได้รายเดือน
  
  double monthlyIncome = await monthlyIncomeValue(date);
  double monthlyExpense = await monthlyExpenseValue(date);
  // ignore: unused_local_variable
  double monthlyBalancePercent = ((monthlyIncome - monthlyExpense) / monthlyIncome) * 100;

  if (monthlyBalancePercent.isInfinite || monthlyBalancePercent.isNaN ||monthlyBalancePercent <=0) {
    return  monthlyBalancePercent = 0;
  }else{
    return monthlyBalancePercent;
  }
  
}

Future<double> financialRisk(String date) async {
  // คำนวณค่ารายได้รายเดือน
  double monthlyIncome = await monthlyIncomeValue(date);
  double monthlyExpense = await monthlyExpenseValue(date);
  // ignore: unused_local_variable
  double financialRisk = (monthlyExpense / monthlyIncome) * 100;

  if (financialRisk.isInfinite || financialRisk.isNaN || financialRisk <= 0) {
    return  financialRisk = 0;
  }else{
    return financialRisk;
  }
}

Future<double> financialRiskChart(String date) async {
  // คำนวณค่ารายได้รายเดือน
  double monthlyIncome = await monthlyIncomeValue(date);
  double monthlyExpense = await monthlyExpenseValue(date);
  // ignore: unused_local_variable
  double financialRiskChart = (monthlyExpense / monthlyIncome);

   if (financialRiskChart.isInfinite || financialRiskChart.isNaN || financialRiskChart<= 0) {
    return  financialRiskChart= 0;
  }else{
    return financialRiskChart;
  }
}