import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class WishListNotifier extends ChangeNotifier {
  List<int> wishList = [];
  void addToList(int itemId) {
    wishList.add(itemId);
    notifyListeners();
  }

  void removeFromList(int itemId) {
    wishList.remove(itemId);
    notifyListeners();
  }
}