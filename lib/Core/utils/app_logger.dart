import 'package:flutter/foundation.dart';
import "package:intl/intl.dart";

   log(message){
if(!kReleaseMode) {
  log(message);
}
  }

bool isArabic(){
  return Intl.getCurrentLocale() == "ar" ;
}