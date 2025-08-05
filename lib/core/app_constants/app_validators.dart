class AppValidators {
  AppValidators._();

  static String? validateEmail(String? val) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    if (val == null || val.trim().isEmpty) {
      return 'this field is required';
    } else if (!emailRegex.hasMatch(val.trim())) {
      return 'enter valid email';
    } else {
      return null;
    }
  }


  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (val.isEmpty) {
      return 'this field is required';
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return 'strong password please';
    } else {
      return null;
    }
  }}


