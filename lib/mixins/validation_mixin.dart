class ValidationMixin {
  String? validateName(value) {
    String pattern = '[a-zA-Z]';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid name or surname';
    }
    return null;
  }

  String? validateTelephoneNumber(value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter telephone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid telephone number';
    }
    return null;
  }

  String? validateEmail(value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}
