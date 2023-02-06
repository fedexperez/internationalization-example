import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:internationalization/blocs/language/language_bloc.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Map<String, String>> languages = [
      {'languageCode': 'en', 'languageName': 'English'},
      {'languageCode': 'es', 'languageName': 'Español'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).language),
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: (context, index) {
            final language = languages.elementAt(index);
            return ListTile(
              title: Text(language['languageName'] ?? ''),
              onTap: () {
                context
                    .read<LanguageBloc>()
                    .add(SetLanguageEvent(language: language));
              },
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: AppLocalizations.supportedLocales.length,
        ),
      ),
    );
  }
}
