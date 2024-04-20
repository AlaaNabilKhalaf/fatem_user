import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:fatem_users/Features/Profile/Controller/Cubits/Languages/languages_states.dart';
import '../../../../../Core/utils/app_logger.dart';




class LangCubit extends Cubit<LangStates>
{
  LangCubit() : super(LangInitState());

  String? currentLang;

  void changeLanguage()
  {
    if(isArabic())
    {
      currentLang = "en";
      _toEnglish();
    }
    else
    {
      currentLang = "ar";
      _toArabic();
    }
  }


  void _toArabic() => emit(SelectedLangState(const Locale("ar")));

  void _toEnglish() => emit(SelectedLangState(const Locale("en")));

}