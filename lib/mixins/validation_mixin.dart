class ValidationMixin {
  String patternName = '[a-zA-Z]';
  String? validateName(value) {
    RegExp regExp = RegExp(patternName);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  String? validateSurname(value) {
    RegExp regExp = RegExp(patternName);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid surname';
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
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validateAddress(value) {
    if (value.length == 0) {
      return 'Please enter address';
    }
    return null;
  }

  String? validateCity(value) {
    if (value.length == 0) {
      return 'Please enter city';
    }
    return null;
  }

  String? validateState(value) {
    if (value.length == 0) {
      return 'Please enter state';
    }
    return null;
  }

  String? validateZipCode(value) {
    String pattern = r'^[0-9]{5}(?:-[0-9]{4})?$';
    RegExp regExp = RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter zip code';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid zip code';
    }
    return null;
  }

  String? validateCaseType(value) {
    if (value.length == 0) {
      return 'Please enter type of case';
    }
    return null;
  }

  String? validateAlienNumber(value) {
    String pattern = r'^(\d{7}|\d{8}|\d{9})$';
    RegExp regExp = RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter alien number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid alien number';
    }
    return null;
  }

  bool _isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  String? validateTotalPrice(value) {
    if (value.length == 0) {
      return 'Please enter total price';
    }

    if (!_isNumeric(value)) {
      return 'Please enter a valid total price';
    }

    if (double.tryParse(value)! <= 0) {
      return 'Total price must be more than 0';
    }

    return null;
  }

  String? validateDownPayment(value) {
    if (value.length == 0) {
      return 'Please enter down payment';
    }

    if (!_isNumeric(value)) {
      return 'Please enter a valid down payment';
    }

    return null;
  }
}
