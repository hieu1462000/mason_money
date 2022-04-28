import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:mason_money/models/category_model.dart';
import 'package:mason_money/models/repositories/category_repositories.dart';
import 'package:mason_money/models/repositories/product_repositories.dart';
import 'package:mason_money/models/sources/remote/params/list_product_params.dart';

class CategoryService extends ChangeNotifier {
  final CategoryRepositories categoryRepositories = CategoryRepositories();
  final ProductRepositories productRepositories = ProductRepositories();
  List<CategoryModel> _categoryList = [];
  List<CategoryModel> _categoryChildList = [];
  final ScrollController scrollController = ScrollController();
  int _page = 1;
  int _size = 10;
  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;



  void getCategoryFromApi() async {
    final response = await categoryRepositories.getParentCategories();
    if (response.status == 200 && response.data != null) {
      print("Successful");
    };
    _categoryList = response.data as List<CategoryModel>;
    notifyListeners();
  }
  List<CategoryModel> getCategoryList() {
    return _categoryList;
  }


  void getCategoryChildFromApi(int parentId) async {
    final response = await categoryRepositories.getChildCategories(parentId);
    if (response.status == 200 && response.data != null) {
      print("Successful");
    };
    _categoryChildList = response.data as List<CategoryModel>;
    notifyListeners();
  }
  List<CategoryModel> getCategoryChildList() {
    return _categoryChildList;
  }

  void getListProductFromApi(ListProductParams listProductParams) async {
    final response = await productRepositories.getListProduct(listProductParams);
    if (response.status == 200 && response.data != null) {
      print("Successful");
    };

}

}
