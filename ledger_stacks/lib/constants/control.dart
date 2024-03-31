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
