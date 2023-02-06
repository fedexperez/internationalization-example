import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageInitialState(languageCode: 'en')) {
    on<SetLanguageEvent>((event, emit) async {
      try {
        emit(LanguageSetState(language: event.language));
      } catch (e) {
        emit(const LanguageErrorState(errorMessage: 'LanguageError'));
      }
    });
  }
}
