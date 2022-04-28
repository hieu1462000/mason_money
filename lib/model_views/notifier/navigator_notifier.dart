import 'package:flutter/material.dart';

// class AppRoutes {
//   static const String HOME = "/home";
//   static const String SEARCH = "/search";
//   static const String EDIT_PROFILE = "/edit_profile";
//
//   static const String EXCLUSIVE_SALE = "/exclusive_sale";
//   static const String WOMEN_SHOES = "/women_shoes";
//   static const String MEN_SHOES = "/men_shoes";
//   static const String SPECIAL_OFFER = "/special_offer";
//   static const String BACKPACK = "/backpack";
//   static const String ACCESSORY = "/accessory";
//   static const String BEST_SHOES = "/best_shoes";
// }

class NavigatorNotifier extends ChangeNotifier {
  String screenName = '/';
  int screenId = 0;

  void changeScreen(String newScreenName, int newScreenId) {
    screenName = newScreenName;
    screenId = newScreenId;
    notifyListeners();
  }

}