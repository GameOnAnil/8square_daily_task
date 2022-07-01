import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider = ChangeNotifierProvider(((ref) => LocaleNotifer()));

class LocaleNotifer extends ChangeNotifier {
  Locale locale = const Locale("en");

  void setLocale(Locale newLocale) {
    locale = newLocale;
    notifyListeners();
  }
}
