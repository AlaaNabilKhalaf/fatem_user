// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        "bag": MessageLookupByLibrary.simpleMessage("BAG"),
        "bagEmpty":
            MessageLookupByLibrary.simpleMessage("YOUR BAG IS STILL EMPTY"),
        "currentLanguage": MessageLookupByLibrary.simpleMessage("English"),
        "facebookLogin":
            MessageLookupByLibrary.simpleMessage("LOGIN WITH FACEBOOK"),
        "googleLogin":
            MessageLookupByLibrary.simpleMessage("LOGIN WITH GOOGLE"),
        "languagesText": MessageLookupByLibrary.simpleMessage("LANGUAGE"),
        "logOut": MessageLookupByLibrary.simpleMessage("Logout"),
        "loginSlogan": MessageLookupByLibrary.simpleMessage(
            "WHERE BEAUTY MEETS THE UNIVERSE!"),
        "noPreviousOrders":
            MessageLookupByLibrary.simpleMessage("NO PREVIOUS ORDERS"),
        "previousOrdersText":
            MessageLookupByLibrary.simpleMessage("PREVIOUS ORDERS"),
        "profileText": MessageLookupByLibrary.simpleMessage("PROFILE")
      };
}
