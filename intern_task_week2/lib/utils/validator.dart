class Validator {
  Validator();

  String? validateIdName(String? value) {
    if (value!.isEmpty) {
      return "Your Name cannot be empty";
    }
    var regExString = RegExp("^[A-Za-z ]*\$");
    var regExLength = RegExp("^[A-Za-z ]{3,15}\$");
    final isValidString = regExString.hasMatch(value);
    final isValidLength = regExLength.hasMatch(value);
    if (!isValidString) {
      return "Please Enter Valid Name";
    }
    if (!isValidLength) {
      return "Must be between 3-15 character";
    }

    return null;
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return "Prefered Name cannot be empty";
    }
    var regExString = RegExp("^[A-Za-z ]*\$");
    var regExLength = RegExp("^[A-Za-z ]{3,15}\$");
    final isValidString = regExString.hasMatch(value);
    final isValidLength = regExLength.hasMatch(value);
    if (!isValidString) {
      return "Please Enter Valid Name";
    }
    if (!isValidLength) {
      return "Must be between 3-15 character";
    }
    return null;
  }

  String? validateId(String? value) {
    if (value!.isEmpty) {
      return "ID cannot be empty";
    }
    return null;
  }

  String? validateDoa(String? value) {
    if (value!.isEmpty) {
      return "Date of birth cannot be empty";
    }

    final date = DateTime.parse(value);
    final today = DateTime.now();
    final difference = today.difference(date).inDays;

    if (difference / 360 < 18) {
      return "Must be above 18 years old";
    }
    if (difference / 360 > 100) {
      return "Sorry old man, cannot be above 100 year old";
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Email cannot be empty";
    }
    var regEx = RegExp("[A-Za-z0-9._]{1,}@[a-z]{3,}[.][A-Za-z.]{3,6}\$");
    var isValid = regEx.hasMatch(value);
    if (!isValid) {
      return "Please Enter Valid Email";
    }
    return null;
  }

  String? validateMaden(String? value) {
    if (value!.isEmpty) {
      return "Mother's Name cannot be empty";
    }
    var regExString = RegExp("^[A-Za-z ]*\$");
    var regExLength = RegExp("^[A-Za-z ]{3,15}\$");
    final isValidString = regExString.hasMatch(value);
    final isValidLength = regExLength.hasMatch(value);
    if (!isValidString) {
      return "Please Enter Valid Name";
    }
    if (!isValidLength) {
      return "Must be between 3-15 character";
    }
    return null;
  }

  String? validatePhone({String? value, required int digit, int? max}) {
    if (value!.isEmpty) {
      return "Phone cannot be empty";
    }
    if (max != null) {
      if (value.length < digit || value.length > max) {
        return "Must be between $digit and $max characters";
      }
    } else {
      if (value.length != digit) {
        return "Must be $digit characters";
      }
    }

    return null;
  }
}
