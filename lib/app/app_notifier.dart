import 'package:demoflight/utilities/constants.dart';
import 'package:demoflight/utilities/multi_languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppNotifier extends ChangeNotifier {
  Locale? locale;

  Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates = [
    MultiLanguages.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  List<Locale> locales = const [
    Locale.fromSubtags(languageCode: "en"),
    Locale.fromSubtags(languageCode: "ru"),
    Locale.fromSubtags(languageCode: "kk"),
  ];

  final Map<String, String> _titles = {
    "en": "Flight App",
    "ru": "Приложение Flight",
    "kk": "Flight бағдарламасы",
  };

  String get title => _titles[locale?.languageCode] ?? "";

  void changeLocale({required Locale locale}) {
    this.locale = locale;
    notifyListeners();
  }

  dynamic localeResolutionCallback(
    locale,
    supportedLocales,
  ) {
    for (var supportedLocaleLanguage in supportedLocales) {
      if (supportedLocaleLanguage.languageCode == locale?.languageCode &&
          supportedLocaleLanguage.countryCode == locale?.countryCode) {
        return supportedLocaleLanguage;
      }
    }
    return null;
  }

  Future<void> setData() async {
    await SharedPreferences.getInstance().then((mySharedPreferences) {
      locale = Locale.fromSubtags(
        languageCode: mySharedPreferences.getString("localeKey") ??
            Constants.defaultLanguage,
      );
      notifyListeners();
    });
  }
}
