import 'package:flutter/material.dart';

typedef Lang = Map<String, String>;

const List<Lang> langs = [
  {
    'code': 'en',
    'name': 'English',
    'country': 'US',
    'flag': 'assets/icons/english.svg',
    'flagEmoji': '🇺🇸',
  },
  {
    'code': 'ar',
    'name': 'Arabic',
    'country': 'AE',
    'flag': 'assets/icons/arabic.svg',
    'flagEmoji': '🇦🇪',
  },
  {
    'code': 'tr',
    'name': 'Turkish',
    'country': 'TR',
    'flag': 'assets/icons/turkish.svg',
    'flagEmoji': '🇹🇷',
  },
];


extension LangExt on Lang {
  Locale get locale => Locale(this['code']!);
  String get flag => this['flag'] ?? '';
  String get name => this['name'] ?? '';
  String get code => this['code'] ?? '';
  String get emoji => this['flagEmoji'] ?? '';
}
