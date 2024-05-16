// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `LOGIN WITH GOOGLE`
  String get googleLogin {
    return Intl.message(
      'LOGIN WITH GOOGLE',
      name: 'googleLogin',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN WITH FACEBOOK`
  String get facebookLogin {
    return Intl.message(
      'LOGIN WITH FACEBOOK',
      name: 'facebookLogin',
      desc: '',
      args: [],
    );
  }

  /// `WHERE BEAUTY MEETS THE UNIVERSE!`
  String get loginSlogan {
    return Intl.message(
      'WHERE BEAUTY MEETS THE UNIVERSE!',
      name: 'loginSlogan',
      desc: '',
      args: [],
    );
  }

  /// ` Welcome to our app! We care about your beauty and skincare health. In our products, we combine the latest technologies with the finest natural ingredients to deliver the best in skincare. Explore our diverse range of products, aimed at achieving healthy, radiant skin for every customer. We take pride in the quality of our products and always strive to meet your needs and exceed your expectations. Discover the difference our products can make and join our family today!`
  String get about {
    return Intl.message(
      ' Welcome to our app! We care about your beauty and skincare health. In our products, we combine the latest technologies with the finest natural ingredients to deliver the best in skincare. Explore our diverse range of products, aimed at achieving healthy, radiant skin for every customer. We take pride in the quality of our products and always strive to meet your needs and exceed your expectations. Discover the difference our products can make and join our family today!',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `PROFILE`
  String get profileText {
    return Intl.message(
      'PROFILE',
      name: 'profileText',
      desc: '',
      args: [],
    );
  }

  /// `PREVIOUS ORDERS`
  String get previousOrdersText {
    return Intl.message(
      'PREVIOUS ORDERS',
      name: 'previousOrdersText',
      desc: '',
      args: [],
    );
  }

  /// `LANGUAGE`
  String get languagesText {
    return Intl.message(
      'LANGUAGE',
      name: 'languagesText',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get currentLanguage {
    return Intl.message(
      'English',
      name: 'currentLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logOut {
    return Intl.message(
      'Logout',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `NO PREVIOUS ORDERS`
  String get noPreviousOrders {
    return Intl.message(
      'NO PREVIOUS ORDERS',
      name: 'noPreviousOrders',
      desc: '',
      args: [],
    );
  }

  /// `BAG`
  String get bag {
    return Intl.message(
      'BAG',
      name: 'bag',
      desc: '',
      args: [],
    );
  }

  /// `YOUR BAG IS STILL EMPTY`
  String get bagEmpty {
    return Intl.message(
      'YOUR BAG IS STILL EMPTY',
      name: 'bagEmpty',
      desc: '',
      args: [],
    );
  }

  /// `WELCOME`
  String get welcome {
    return Intl.message(
      'WELCOME',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `SKIN`
  String get skin {
    return Intl.message(
      'SKIN',
      name: 'skin',
      desc: '',
      args: [],
    );
  }

  /// `HAIR`
  String get hair {
    return Intl.message(
      'HAIR',
      name: 'hair',
      desc: '',
      args: [],
    );
  }

  /// `BODY`
  String get body {
    return Intl.message(
      'BODY',
      name: 'body',
      desc: '',
      args: [],
    );
  }

  /// `BEST SELLING`
  String get bestSelling {
    return Intl.message(
      'BEST SELLING',
      name: 'bestSelling',
      desc: '',
      args: [],
    );
  }

  /// `DEODORANT`
  String get deodorant {
    return Intl.message(
      'DEODORANT',
      name: 'deodorant',
      desc: '',
      args: [],
    );
  }

  /// `THERE`
  String get there {
    return Intl.message(
      'THERE',
      name: 'there',
      desc: '',
      args: [],
    );
  }

  /// `FAVORITE`
  String get favorite {
    return Intl.message(
      'FAVORITE',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `MAKE YOUR OWN WISH LIST`
  String get emptyFavoritePage {
    return Intl.message(
      'MAKE YOUR OWN WISH LIST',
      name: 'emptyFavoritePage',
      desc: '',
      args: [],
    );
  }

  /// `Add To The Bag`
  String get addToBag {
    return Intl.message(
      'Add To The Bag',
      name: 'addToBag',
      desc: '',
      args: [],
    );
  }

  /// `Benefits:`
  String get benefits {
    return Intl.message(
      'Benefits:',
      name: 'benefits',
      desc: '',
      args: [],
    );
  }

  /// `Tips For Usage:`
  String get tipsForUse {
    return Intl.message(
      'Tips For Usage:',
      name: 'tipsForUse',
      desc: '',
      args: [],
    );
  }

  /// ` FACE`
  String get face {
    return Intl.message(
      ' FACE',
      name: 'face',
      desc: '',
      args: [],
    );
  }

  /// `Total Price: `
  String get totalPrice {
    return Intl.message(
      'Total Price: ',
      name: 'totalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Place Order`
  String get order {
    return Intl.message(
      'Place Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Other Phone`
  String get otherPhone {
    return Intl.message(
      'Other Phone',
      name: 'otherPhone',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Order Is Sent`
  String get orderIsSent {
    return Intl.message(
      'Order Is Sent',
      name: 'orderIsSent',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `ADDED`
  String get added {
    return Intl.message(
      'ADDED',
      name: 'added',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
