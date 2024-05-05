import 'dart:collection';
import 'package:flutter/material.dart';

// Cache Data
String? token ;
String? name ;
String? email ;
String? phone ;
String? avatar ;
String? cachedLang;


//Locale Variable
Locale? locale;


//BottomNavBar Pages indices (Depends on bottomNavIcons List)
//0-> Profile, 1-> Fav, 2-> Bag, 3-> Home
int pageIndex = -1;
Queue<int> currentPageIndex = Queue<int>();

const List<List<int>> bottomNavBarIconSize = [[35,35], [27,31], [31,31], [30,30]];


// Colors
const Color buttonColor = Color(0xffC69670);
const Color bottomNaviBarColor = Color(0xFFB79D7F);
const Color bottomNaviBarBorderColor = Color(0xFF886552);
const List<Color> gradColor= [Color(0xffD5C5A9), Color(0xffF4ECDD)];
const Color itemCardColor = Color(0xFFC79872);
const Color imageBGCardColor = Color (0xffF8F1EA);
List<Color> listGradColor = [const Color(0xffD1A582).withOpacity(0.4), const Color(0xffFFFFFF).withOpacity(0), const Color(0xffD1A582).withOpacity(0.4)];
//List<BoxShadow> listGradShadow = [BoxShadow(color: const Color(0xffD1A582).withOpacity(0.4), blurRadius: 20)];
List<BoxShadow> shadow = [BoxShadow(color: Colors.black.withOpacity(0.25),  blurRadius: 6, offset: const Offset(0, 4))];


// Family Fonts
const String arLight = "StcLight";
const String arRegular = "StcRegular";
const String arBold = "StcBold";
const String enRegular = "LexendGigaRegular";
const String enExtraLight = "LexendGigaExtraLight";
const String enLight = "LexendGigaLight";
const String ade = "Ade";