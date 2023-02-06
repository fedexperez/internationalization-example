import 'package:flutter/material.dart';

import 'package:internationalization/screens/change_language_screen.dart';
import 'package:internationalization/screens/locale_language_screen.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final Map<String, Widget Function(BuildContext)> routes = {
    'locale': (BuildContext context) => const LocaleLanguageScreen(),
    'languages': (BuildContext context) => const ChangeLanguageScreen(),
  };
}
