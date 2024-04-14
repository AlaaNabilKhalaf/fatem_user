
import 'package:flutter/foundation.dart';
import "package:intl/intl.dart";

   log(message){
if(!kReleaseMode) {
  print(message);
}
  }

bool isArabic(){
  return Intl.getCurrentLocale() == "ar" ;
}