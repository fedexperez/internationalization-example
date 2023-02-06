import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:internationalization/blocs/language/language_bloc.dart';
import 'package:internationalization/routes/app_routes.dart';
import 'package:internationalization/screens/locale_language_screen.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(
          create: (BuildContext context) => LanguageBloc(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        if (state is LanguageSetState) {
          return MaterialApp(
            locale: Locale(state.language['languageCode']!),
            debugShowCheckedModeBanner: false,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: const LocaleLanguageScreen(),
            routes: AppRoutes.routes,
          );
        }
        return MaterialApp(
          locale: const Locale('en'),
          debugShowCheckedModeBanner: false,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: const LocaleLanguageScreen(),
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
