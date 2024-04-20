import 'dart:ui';

abstract class LangStates {}

class LangInitState extends LangStates{}

class SelectedLangState extends LangStates{
  Locale locale;
  SelectedLangState(this.locale);
}