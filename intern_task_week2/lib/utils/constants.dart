import 'package:intern_task_week2/models/country_model.dart';
import 'package:intern_task_week2/models/language_model.dart';

List<String> mrType = [
  "Mr",
  "Mrs",
  "Ms",
];

List<LanguageModel> languageList = [
  LanguageModel(url: "assets/flags/uk.png", language: "English", locale: "en"),
  LanguageModel(
      url: "assets/flags/malaysia.png",
      language: "Bahasa Malaysia",
      locale: "ms"),
  LanguageModel(
      url: "assets/flags/nepal.png", language: "Nepali", locale: "ne"),
  LanguageModel(
      url: "assets/flags/china.png", language: "Chinese", locale: "zh"),
  LanguageModel(
      url: "assets/flags/usa.png", language: "English (USA)", locale: "en"),
  LanguageModel(url: "assets/flags/india.png", language: "Hindi", locale: "hi"),
];

List<Country> countryList = [
  Country(
      mindigits: 7,
      maxdigits: 8,
      name: "Bahasa Malaysia",
      countryCode: "+60",
      url: "assets/flags/malaysia.png",
      language: "Bahasa Malaysia"),
  Country(
    mindigits: 10,
    maxdigits: 10,
    name: "UK",
    countryCode: "+44",
    url: "assets/flags/uk.png",
    language: "English",
  ),
  Country(
    mindigits: 7,
    maxdigits: 7,
    name: "China",
    countryCode: "+86",
    url: "assets/flags/china.png",
    language: "Chinese",
  ),
  Country(
    mindigits: 10,
    maxdigits: 10,
    name: "Nepal",
    countryCode: "+977",
    url: "assets/flags/nepal.png",
    language: "Nepali",
  ),
  Country(
    mindigits: 10,
    maxdigits: 10,
    name: "USA",
    countryCode: "+1",
    url: "assets/flags/usa.png",
    language: "English (USA)",
  ),
  Country(
      mindigits: 7,
      maxdigits: 7,
      name: "Sri Lanka",
      countryCode: "+94",
      url: "assets/flags/srilanka.png",
      language: "Sinhala"),
  Country(
      mindigits: 10,
      maxdigits: 10,
      name: "India",
      countryCode: "+91",
      url: "assets/flags/india.png",
      language: "Hindi"),
];
