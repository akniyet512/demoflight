import 'dart:convert';

import 'package:demoflight/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MultiLanguages {
  final Locale locale;
  MultiLanguages(
      {this.locale =
          const Locale.fromSubtags(languageCode: Constants.defaultLanguage)});

  static MultiLanguages? of(BuildContext context) {
    return Localizations.of<MultiLanguages>(context, MultiLanguages);
  }

  static const LocalizationsDelegate<MultiLanguages> delegate =
      _MultiLanguagesDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle
        .loadString("assets/languages/${locale.languageCode}.json");
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key]!;
  }
}

class _MultiLanguagesDelegate extends LocalizationsDelegate<MultiLanguages> {
  const _MultiLanguagesDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru', 'kk'].contains(locale.languageCode);
  }

  @override
  Future<MultiLanguages> load(Locale locale) async {
    MultiLanguages localizations = MultiLanguages(locale: locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_MultiLanguagesDelegate old) => false;
}
